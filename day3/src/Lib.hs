module Lib
    ( possible
    , countPossibles
    ) where

data Triangle = Triangle Int Int Int

possible :: String -> Bool
possible = possible . parseTriangle
  where
  possible (Triangle a b c) = a + b > c && a + c > b && b + c > a
  parseTriangle = (\[a, b, c] -> Triangle a b c) . fmap read . words

countPossibles :: [String] -> Int
countPossibles = length . filter possible
