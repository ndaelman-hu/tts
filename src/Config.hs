{-# LANGUAGE OverloadedStrings #-}

module Config
    ( Config(..)
    , loadConfig
    , defaultConfig
    ) where

import Data.Text (Text)
import qualified Data.Text as T
import Env (parse, var, str, def, help)
import System.FilePath ((</>))
import TTS.Types

data Config = Config
    { cfgDefaultVoice :: FilePath
    , cfgVoicesDir    :: FilePath
    , cfgBinDir       :: FilePath
    , cfgDefaultSpeed :: Speed
    } deriving (Show)

defaultConfig :: Config
defaultConfig = Config
    { cfgDefaultVoice = "voices/en_US-lessac-medium.onnx"
    , cfgVoicesDir = "voices"
    , cfgBinDir = "bin"
    , cfgDefaultSpeed = defaultSpeed
    }

loadConfig :: IO Config
loadConfig = parse id configParser
  where
    configParser = Config
        <$> var str "PIPER_DEFAULT_VOICE" (def "voices/en_US-lessac-medium.onnx" <> help "Default voice model")
        <*> var str "PIPER_VOICES_DIR" (def "voices" <> help "Voices directory")
        <*> var str "PIPER_BIN_DIR" (def "bin" <> help "Binary directory")
        <*> pure defaultSpeed
