module Main where

import Text.HTML.TagSoup
import System.Environment

printLinks :: String -> IO ()
printLinks file = do
  tags <- parseTags <$> readFile file
  let strings = map show tags
  mconcat $ putStrLn <$> strings 

main :: IO ()
main = do
  rootFile <- head <$> getArgs
  printLinks rootFile
  putStrLn rootFile
