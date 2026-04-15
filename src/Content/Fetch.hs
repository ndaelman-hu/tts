{-# LANGUAGE OverloadedStrings #-}

module Content.Fetch
    ( fetchURL
    ) where

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TLE
import Network.HTTP.Req
import Text.URI (mkURI)

-- | Fetch content from a URL
fetchURL :: String -> IO Text
fetchURL url = runReq defaultHttpConfig $ do
    uri <- mkURI (T.pack url)
    let (urlScheme, urlPath) = case useHttpsURI uri of
            Just u -> u
            Nothing -> error "Only HTTPS URLs are supported"
    response <- req GET urlScheme NoReqBody lbsResponse urlPath
    return $ TL.toStrict $ TLE.decodeUtf8 $ responseBody response
