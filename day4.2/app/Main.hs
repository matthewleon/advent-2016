module Main where

import Lib

main :: IO ()
main = putStrLn . show
  =<< fmap ((\room -> (decryptRoomName room, room)) . parseRoom)
      . lines <$> readFile "input"
