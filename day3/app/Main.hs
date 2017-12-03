module Main where

import Lib

main :: IO ()
main = putStrLn . show =<< (countPossibles . lines <$> readFile "input")
