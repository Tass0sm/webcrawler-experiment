{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_webcrawl_experiment (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tassos/.cabal/bin"
libdir     = "/home/tassos/.cabal/lib/x86_64-linux-ghc-8.10.2/webcrawl-experiment-0.1.0.0-inplace-webcrawl-experiment"
dynlibdir  = "/home/tassos/.cabal/lib/x86_64-linux-ghc-8.10.2"
datadir    = "/home/tassos/.cabal/share/x86_64-linux-ghc-8.10.2/webcrawl-experiment-0.1.0.0"
libexecdir = "/home/tassos/.cabal/libexec/x86_64-linux-ghc-8.10.2/webcrawl-experiment-0.1.0.0"
sysconfdir = "/home/tassos/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "webcrawl_experiment_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "webcrawl_experiment_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "webcrawl_experiment_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "webcrawl_experiment_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "webcrawl_experiment_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "webcrawl_experiment_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
