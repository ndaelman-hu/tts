{-# LANGUAGE OverloadedStrings #-}

module TTS.Piper
    ( synthesize
    , synthesizeToFile
    , listVoices
    , piperBinaryPath
    ) where

import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as LBS
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import System.Directory (listDirectory, doesFileExist)
import System.FilePath ((</>), takeExtension, dropExtension, takeFileName)
import System.Process.Typed
import TTS.Types

-- | Path to the Piper binary relative to project root
piperBinaryPath :: FilePath
piperBinaryPath = "bin/piper"

-- | Synthesize text to raw audio (WAV format)
synthesize :: Voice -> Speed -> Text -> IO LBS.ByteString
synthesize voice (Speed speedVal) text = do
    let lengthScale = 1.0 / speedVal  -- Piper uses length_scale (inverse of speed)
    let config = proc piperBinaryPath
            [ "--model", voiceModelPath voice
            , "--output_file", "-"  -- Output to stdout
            , "--length_scale", show lengthScale
            , "--quiet"
            ]
    let inputBytes = LBS.fromStrict $ TE.encodeUtf8 text
    readProcessStdout_ $ setStdin (byteStringInput inputBytes) config

-- | Synthesize text to a file
synthesizeToFile :: Voice -> Speed -> Text -> FilePath -> IO ()
synthesizeToFile voice (Speed speedVal) text outputPath = do
    let lengthScale = 1.0 / speedVal
    let config = proc piperBinaryPath
            [ "--model", voiceModelPath voice
            , "--output_file", outputPath
            , "--length_scale", show lengthScale
            , "--quiet"
            ]
    let inputBytes = LBS.fromStrict $ TE.encodeUtf8 text
    runProcess_ $ setStdin (byteStringInput inputBytes) config

-- | List available voice models in the voices directory
listVoices :: FilePath -> IO [Voice]
listVoices voicesDir = do
    files <- listDirectory voicesDir
    let onnxFiles = filter (\f -> takeExtension f == ".onnx") files
    mapM (voiceFromFile voicesDir) onnxFiles

-- | Create a Voice from an ONNX file path
voiceFromFile :: FilePath -> FilePath -> IO Voice
voiceFromFile voicesDir fileName = do
    let fullPath = voicesDir </> fileName
    let name = T.pack $ dropExtension $ takeFileName fileName
    -- Extract language from filename (e.g., "en_US-lessac-medium" -> "en")
    let lang = case T.split (== '_') name of
                (l:_) -> Language l
                []    -> Language "unknown"
    return $ Voice
        { voiceModelPath = fullPath
        , voiceName = name
        , voiceLanguage = lang
        }
