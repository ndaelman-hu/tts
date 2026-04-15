{-# LANGUAGE OverloadedStrings #-}

module Content.Parser
    ( extractText
    , cleanText
    ) where

import Data.Text (Text)
import qualified Data.Text as T

-- | Extract readable text from HTML (simplified version)
extractText :: Text -> Text
extractText html = cleanText html  -- TODO: Add proper HTML parsing with scalpel

-- | Clean up text (remove extra whitespace, etc.)
cleanText :: Text -> Text
cleanText = T.unwords . T.words
