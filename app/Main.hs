{-# LANGUAGE OverloadedStrings #-}

module Main where

import Options.Applicative
import CLI
import Config

main :: IO ()
main = do
    cfg <- loadConfig
    cmd <- execParser opts
    runCommand cfg cmd
  where
    opts = info (parseCommand <**> helper)
        ( fullDesc
        <> progDesc "Privacy-focused local text-to-speech reader with multilingual support (35+ languages)"
        <> header "piper-reader - read text aloud using Piper TTS"
        <> footer "See VOICES.md for voice downloads | See USAGE.md for examples" )
