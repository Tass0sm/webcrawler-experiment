module Main where

import System.Environment
import NextLink
import UpLink
import PrevLink

printUpRelation :: String -> IO ()
printUpRelation file = do
  upFile <- prettyShowUpLink file
  putStr file
  putStr " -> "
  putStrLn upFile

printNextRelation :: String -> IO ()
printNextRelation file = do
  nextFile <- prettyShowNextLink file
  putStr file
  putStr " -> "
  putStrLn nextFile

printPrevRelation :: String -> IO ()
printPrevRelation file = do
  prevFile <- prettyShowPrevLink file
  putStr file
  putStr " -> "
  putStrLn prevFile


main :: IO ()
main = do
  rootFile <- head <$> getArgs
  printPrevRelation rootFile
  printUpRelation rootFile
  printNextRelation rootFile
