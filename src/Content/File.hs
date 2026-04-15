{-# LANGUAGE OverloadedStrings #-}

module Content.File
    ( readTextFile
    ) where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.FilePath (takeExtension)

-- | Read text from a file
readTextFile :: FilePath -> IO T.Text
readTextFile path = TIO.readFile path
