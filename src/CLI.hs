{-# LANGUAGE OverloadedStrings #-}

module CLI
    ( Command(..)
    , parseCommand
    , runCommand
    ) where

import Control.Monad (forM_)
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Options.Applicative
import System.FilePath ((</>))
import Config
import Content.File (readTextFile)
import TTS.Piper (synthesizeToFile, listVoices)
import TTS.Types

data Command
    = ReadFile FilePath (Maybe FilePath)
    | ReadURL String (Maybe FilePath)
    | ListVoices
    | Interactive

parseCommand :: Parser Command
parseCommand = subparser
    (  command "read-file" (info readFileCmd (progDesc "Read a text file"))
    <> command "read-url" (info readURLCmd (progDesc "Read from a URL"))
    <> command "list-voices" (info (pure ListVoices) (progDesc "List available voices"))
    <> command "interactive" (info (pure Interactive) (progDesc "Interactive mode"))
    )
  where
    readFileCmd = ReadFile
        <$> argument str (metavar "FILE")
        <*> optional (strOption (long "output" <> short 'o' <> metavar "OUTPUT"))
    readURLCmd = ReadURL
        <$> argument str (metavar "URL")
        <*> optional (strOption (long "output" <> short 'o' <> metavar "OUTPUT"))

runCommand :: Config -> Command -> IO ()
runCommand cfg (ReadFile filePath maybeOutput) = do
    text <- readTextFile filePath
    voice <- loadDefaultVoice cfg
    let outputPath = maybe "output.wav" id maybeOutput
    synthesizeToFile voice (cfgDefaultSpeed cfg) text outputPath
    putStrLn $ "Audio saved to: " ++ outputPath

runCommand cfg (ReadURL url maybeOutput) = do
    putStrLn "URL reading not yet implemented"
    -- TODO: Implement URL fetching and parsing

runCommand cfg ListVoices = do
    voices <- listVoices (cfgVoicesDir cfg)
    putStrLn "Available voices:"
    forM_ voices $ \v -> TIO.putStrLn $ "  - " <> voiceName v

runCommand cfg Interactive = do
    putStrLn "Interactive mode - enter text to synthesize (Ctrl+D to exit):"
    text <- TIO.getContents
    voice <- loadDefaultVoice cfg
    synthesizeToFile voice (cfgDefaultSpeed cfg) text "output.wav"
    putStrLn "Audio saved to: output.wav"

loadDefaultVoice :: Config -> IO Voice
loadDefaultVoice cfg = do
    let modelPath = cfgDefaultVoice cfg
    let name = T.pack $ cfgDefaultVoice cfg
    return $ Voice modelPath name (Language "en")
