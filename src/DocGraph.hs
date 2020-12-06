{-# LANGUAGE TupleSections #-}

module DocGraph
  ( getVerticies
  , getIncidentEdges
  , getEdges
  , makeDocGraph ) where

import System.Directory
import Algebra.Graph
import Data.Maybe

import NextLink
import UpLink
import PrevLink


getVerticies :: FilePath -> IO [FilePath]
getVerticies file = do
  isDir <- doesDirectoryExist file
  if isDir
    then do
    allFiles <- listDirectory file
    concat <$> mapM getVerticies allFiles
    else do
    return [file]

getIncidentEdges :: FilePath -> IO [(FilePath, FilePath)]
getIncidentEdges vertex = do
  nextLink <- maybeNextLink vertex
  upLink <- maybeUpLink vertex
  prevLink <- maybePrevLink vertex
  let links = [nextLink, upLink, prevLink]
  let edges = map ((vertex,) <$>) links
  return $ catMaybes $ edges

getEdges :: [FilePath] -> IO [(FilePath, FilePath)]
getEdges verticies = do
  allIncidentEdges <- mapM getIncidentEdges verticies
  return $ concat $ allIncidentEdges
    
makeDocGraph :: FilePath -> IO (Graph FilePath)
makeDocGraph file = do
  theVerticies <- getVerticies file
  theEdges <- getEdges theVerticies
  return $ edges theEdges
