module Util
  ( prettyShowHREF
  , maybeHREF ) where

import Text.HTML.TagSoup

prettyShowHREF :: Maybe (Tag String) -> String
prettyShowHREF (Just (TagOpen _ attrs)) = 
  let ref = lookup "HREF" attrs
  in case ref of
    Just l -> l
    Nothing -> "Nothing"
prettyShowHREF _ = "Nothing"

maybeHREF :: Maybe (Tag String) -> Maybe String
maybeHREF (Just (TagOpen _ attrs)) = 
  lookup "HREF" attrs
maybeHREF _ = Nothing

