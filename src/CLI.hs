{-# LANGUAGE OverloadedStrings #-}

module CLI
    ( Command(..)
    , CommandOptions(..)
    , parseCommand
    , runCommand
    ) where

import Control.Monad (forM_)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Options.Applicative
import System.Process.Typed
import System.IO.Temp (withSystemTempFile)
import System.IO (hClose)
import Config
import Content.File (readTextFile)
import TTS.Piper (synthesizeToFile, listVoices)
import TTS.Types

-- | Options that apply to all commands
data CommandOptions = CommandOptions
    { optVoice :: Maybe FilePath
    , optSpeed :: Maybe Double
    , optPlay  :: Bool
    } deriving (Show)

data Command
    = ReadFile FilePath (Maybe FilePath) CommandOptions
    | ReadURL String (Maybe FilePath) CommandOptions
    | ListVoices
    | Interactive CommandOptions

-- | Parse command-line options
parseOptions :: Parser CommandOptions
parseOptions = CommandOptions
    <$> optional (strOption (long "voice" <> short 'v' <> metavar "VOICE" <> help "Voice model file (e.g., voices/en_US-lessac-medium.onnx)"))
    <*> optional (option auto (long "speed" <> short 's' <> metavar "SPEED" <> help "Speech speed (0.5-2.0, default 1.0)"))
    <*> switch (long "play" <> short 'p' <> help "Play audio directly instead of saving to file")

parseCommand :: Parser Command
parseCommand = subparser
    (  command "read-file" (info readFileCmd (progDesc "Read a text file"))
    <> command "read-url" (info readURLCmd (progDesc "Read from a URL"))
    <> command "list-voices" (info (pure ListVoices) (progDesc "List available voices"))
    <> command "interactive" (info interactiveCmd (progDesc "Interactive mode"))
    )
  where
    readFileCmd = ReadFile
        <$> argument str (metavar "FILE")
        <*> optional (strOption (long "output" <> short 'o' <> metavar "OUTPUT" <> help "Output WAV file"))
        <*> parseOptions
    readURLCmd = ReadURL
        <$> argument str (metavar "URL")
        <*> optional (strOption (long "output" <> short 'o' <> metavar "OUTPUT" <> help "Output WAV file"))
        <*> parseOptions
    interactiveCmd = Interactive <$> parseOptions

runCommand :: Config -> Command -> IO ()
runCommand cfg (ReadFile filePath maybeOutput opts) = do
    text <- readTextFile filePath
    voice <- loadVoice cfg (optVoice opts)
    speed <- getSpeed cfg (optSpeed opts)

    if optPlay opts
        then playAudio voice speed text
        else do
            let outputPath = maybe "output.wav" id maybeOutput
            synthesizeToFile voice speed text outputPath
            putStrLn $ "Audio saved to: " ++ outputPath

runCommand cfg (ReadURL _url _maybeOutput _opts) = do
    putStrLn "URL reading not yet implemented"
    -- TODO: Implement URL fetching and parsing

runCommand cfg ListVoices = do
    voices <- listVoices (cfgVoicesDir cfg)
    putStrLn "Available voices:"
    forM_ voices $ \v -> TIO.putStrLn $ "  - " <> voiceName v

runCommand cfg (Interactive opts) = do
    putStrLn "Interactive mode - enter text to synthesize (Ctrl+D to exit):"
    text <- TIO.getContents
    voice <- loadVoice cfg (optVoice opts)
    speed <- getSpeed cfg (optSpeed opts)

    if optPlay opts
        then playAudio voice speed text
        else do
            synthesizeToFile voice speed text "output.wav"
            putStrLn "Audio saved to: output.wav"

-- | Play audio directly using aplay
playAudio :: Voice -> Speed -> Text -> IO ()
playAudio voice speed text = do
    putStrLn "Playing audio..."
    -- Write to temporary file and play it (aplay doesn't handle stdin WAV streams well)
    withSystemTempFile "piper-reader.wav" $ \tmpPath tmpHandle -> do
        hClose tmpHandle  -- Close the handle so synthesizeToFile can write
        synthesizeToFile voice speed text tmpPath
        runProcess_ $ proc "aplay" ["-q", tmpPath]

-- | Load voice model (use specified or default)
loadVoice :: Config -> Maybe FilePath -> IO Voice
loadVoice cfg maybeVoicePath = do
    let modelPath = maybe (cfgDefaultVoice cfg) id maybeVoicePath
    let name = T.pack modelPath
    return $ Voice modelPath name (Language "en")

-- | Get speed (use specified or default)
getSpeed :: Config -> Maybe Double -> IO Speed
getSpeed cfg maybeSpeed = do
    let speedVal = maybe 1.0 id maybeSpeed
    case mkSpeed speedVal of
        Left err -> error $ "Invalid speed: " ++ err
        Right s -> return s
