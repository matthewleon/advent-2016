module Main where

import Lib

main :: IO ()
main = do
  print . length . filter supportsTLS . lines =<< readFile "input"
  print . length . filter supportsSSL . lines =<< readFile "input"
