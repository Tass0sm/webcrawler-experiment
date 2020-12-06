module NextLink
  ( isNextLink
  , getNextLinkTag
  , maybeNextLink
  , prettyShowNextLink ) where

import Util
import Text.HTML.TagSoup

isNextLink :: Tag String -> Bool
isNextLink (TagOpen str attrList) =
  str == "LINK" && hasNextRelationAttribute attrList
  where
    hasNextRelationAttribute = (Just "NEXT" ==) . lookup "REL"
isNextLink _ = False

getNextLinkTag :: [Tag String] -> Maybe (Tag String)
getNextLinkTag tags = do
  let trimmedTags = dropWhile (not . isNextLink) tags
  case trimmedTags of
    x:_ -> Just x
    [] -> Nothing

maybeNextLink :: String -> IO (Maybe String)
maybeNextLink file = do
  tags <- parseTags <$> readFile file
  let maybeNextLink = maybeHREF $ getNextLinkTag tags
  return maybeNextLink

prettyShowNextLink :: String -> IO (String)
prettyShowNextLink file = do
  tags <- parseTags <$> readFile file
  let prettyNextLink = prettyShowHREF $ getNextLinkTag tags
  return prettyNextLink

  
