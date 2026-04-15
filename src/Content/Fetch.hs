{-# LANGUAGE OverloadedStrings #-}

module Content.Fetch
    ( fetchURL
    ) where

import qualified Data.ByteString.Lazy as LBS
import Data.Text (Text)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TLE
import Network.HTTP.Req

-- | Fetch content from a URL
fetchURL :: String -> IO Text
fetchURL url = runReq defaultHttpConfig $ do
    let (urlScheme, urlPath) = case parseUrl url of
            Just u -> u
            Nothing -> error "Invalid URL"
    response <- req GET urlScheme NoReqBody lbsResponse urlPath
    return $ TL.toStrict $ TLE.decodeUtf8 $ responseBody response

-- Simple URL parsing helper
parseUrl :: String -> Maybe (Url 'Https, Option 'Https)
parseUrl url =
    case useHttpsURI =<< parseURI (T.pack url) of
        Just (u, opts) -> Just (u, opts)
        Nothing -> Nothing

import qualified Data.Text as T
import Text.URI (parseURI)
import Network.HTTP.Req (useHttpsURI)
