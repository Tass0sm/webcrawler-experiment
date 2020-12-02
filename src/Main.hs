module Main where

import System.Environment
import NextLink
import UpLink

main :: IO ()
main = do
  rootFile <- head <$> getArgs
  upFile <- prettyShowUpLink rootFile
  putStr rootFile
  putStr " -> "
  putStrLn upFile 
