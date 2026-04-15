{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module TTS.Types
    ( Voice(..)
    , Speed(..)
    , Language(..)
    , mkSpeed
    , defaultSpeed
    ) where

import Data.Text (Text)
import GHC.Generics (Generic)

-- | Voice model configuration
data Voice = Voice
    { voiceModelPath :: FilePath
    , voiceName      :: Text
    , voiceLanguage  :: Language
    } deriving (Show, Eq, Generic)

-- | Speech speed multiplier (0.5 to 2.0)
newtype Speed = Speed Double
    deriving (Show, Eq)

-- | Smart constructor for Speed with bounds checking
mkSpeed :: Double -> Either String Speed
mkSpeed s
    | s < 0.5   = Left "Speed must be at least 0.5"
    | s > 2.0   = Left "Speed must be at most 2.0"
    | otherwise = Right (Speed s)

-- | Default speech speed (1.0 = normal)
defaultSpeed :: Speed
defaultSpeed = Speed 1.0

-- | Language code
newtype Language = Language Text
    deriving (Show, Eq)
