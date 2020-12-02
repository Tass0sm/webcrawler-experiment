module Util (prettyShowHREF) where

import Text.HTML.TagSoup

prettyShowHREF :: Maybe (Tag String) -> String
prettyShowHREF (Just (TagOpen _ attrs)) = 
  let ref = lookup "HREF" attrs
  in case ref of
    Just l -> l
    Nothing -> "Nothing"
prettyShowHREF _ = "Nothing"

