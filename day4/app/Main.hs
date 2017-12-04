module Main where

import Lib

main :: IO ()
main = putStrLn . show =<< sumRealRoomSectorIds . lines <$> readFile "input"
