module Main where

import System.Environment
import DocGraph
import Algebra.Graph.Export.Dot

main :: IO ()
main = do
  rootFile <- head <$> getArgs
  graph <- makeDocGraph rootFile
  putStrLn $ exportViaShow graph
