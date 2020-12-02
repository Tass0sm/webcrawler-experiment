module UpLink
  ( isUpLink
  , getUpLinkTag
  , prettyShowUpLink ) where

import Util
import Text.HTML.TagSoup

isUpLink :: Tag String -> Bool
isUpLink (TagOpen str attrList) =
  str == "LINK" && hasNextRelationAttribute attrList
  where
    hasNextRelationAttribute = (Just "UP" ==) . lookup "REL"
isUpLink _ = False

getUpLinkTag :: [Tag String] -> Maybe (Tag String)
getUpLinkTag tags = do
  let trimmedTags = dropWhile (not . isUpLink) tags
  case trimmedTags of
    x:_ -> Just x
    [] -> Nothing

prettyShowUpLink :: String -> IO (String)
prettyShowUpLink file = do
  tags <- parseTags <$> readFile file
  let prettyUpLink = prettyShowHREF $ getUpLinkTag tags
  return prettyUpLink

  
