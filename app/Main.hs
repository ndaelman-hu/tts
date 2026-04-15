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
        <> progDesc "Privacy-focused local text-to-speech reader"
        <> header "piper-reader - read text aloud using Piper TTS" )
