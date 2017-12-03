module Lib
    ( parseTriangles
    , possible
    , countPossibles
    ) where

import Data.List.Split (chunksOf)
import Data.List (transpose)

data Triangle = Triangle Int Int Int
  deriving (Show)

parseTriangles :: String -> [Triangle]
parseTriangles = 
  fmap triangle
  . concatMap (transpose . chunksOf 3)
  . chunksOf 9
  . map read
  . words
  where triangle [a, b, c] = Triangle a b c

countPossibles :: [Triangle] -> Int
countPossibles = length . filter possible

possible :: Triangle -> Bool
possible (Triangle a b c) = a + b > c && a + c > b && b + c > a
