module Lib where

import Data.Char (isDigit, isLower)
import Data.Foldable (foldl')
import Data.List (sortOn)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M
import Data.Tuple (swap)

data Room = Room String Integer String
  deriving (Show, Eq)

parseRoom :: String -> Room
parseRoom s =
  let (namePrefix, rest)  = span (not . isDigit) s
      (sectorStr, suffix) = span isDigit rest
  in Room (filter isLower namePrefix) (read sectorStr) (init $ tail suffix)

mostCommonEntries :: Ord a => [a] -> [a]
mostCommonEntries = take 5 . sortCommonEntries
  where
  sortCommonEntries :: Ord a => [a] -> [a]
  sortCommonEntries =
      map fst
    . sortOn (swap . fmap negate)
    . M.toList
    . countOccurences

  countOccurences :: Ord a => [a] -> Map a Int
  countOccurences =
    foldl' (\m a -> M.insertWith (\new old -> old + 1) a 0 m) M.empty

realRoom :: Room -> Bool
realRoom (Room name _ checksum) = mostCommonEntries name == checksum

sumRealRoomSectorIds :: [String] -> Integer
sumRealRoomSectorIds = sum . fmap sectorId . filter realRoom . fmap parseRoom
  where sectorId (Room _ sid _) = sid
