module PrevLink
  ( isPrevLink
  , getPrevLinkTag
  , prettyShowPrevLink ) where

import Util
import Text.HTML.TagSoup

isPrevLink :: Tag String -> Bool
isPrevLink (TagOpen str attrList) =
  str == "LINK" && hasPrevRelationAttribute attrList
  where
    hasPrevRelationAttribute = (Just "PREV" ==) . lookup "REL"
isPrevLink _ = False

getPrevLinkTag :: [Tag String] -> Maybe (Tag String)
getPrevLinkTag tags = do
  let trimmedTags = dropWhile (not . isPrevLink) tags
  case trimmedTags of
    x:_ -> Just x
    [] -> Nothing

prettyShowPrevLink :: String -> IO (String)
prettyShowPrevLink file = do
  tags <- parseTags <$> readFile file
  let prettyPrevLink = prettyShowHREF $ getPrevLinkTag tags
  return prettyPrevLink

  
