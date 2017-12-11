module Lib where

{-
hasAbba :: Eq a => [a] -> Bool
hasAbba (x1 : x2 : x3 : x4 : xs) =
 (x1 == x4 && x2 == x3) || hasAbba (x2 : x3 : x4 : xs)
hasAbba _ = False
-}

isAbba :: Eq a => [a] -> Bool
isAbba (x1 : x2 : x3 : x4 : _) = x1 == x4 && x2 == x3 && x1 /= x2
isAbba _ = False


supportsTLS :: String -> Bool
supportsTLS = go False False
  where
  -- go: inHypernet, hasAbba
  go :: Bool -> Bool -> String -> Bool
  go False hasAbba ('[':cs) = go True hasAbba cs
  go False hasAbba (c:cs) =
    if isAbba (c:cs)
      then go False True cs
      else go False hasAbba cs
  go True hasAbba (']':cs) = go False hasAbba cs
  go True hasAbba (c:cs) = not (isAbba (c:cs)) && go True hasAbba cs
  go _ hasAbba _ = hasAbba

supportsSSL :: String -> Bool
supportsSSL = go False [] []
  where
  -- go: inHyperNet, 
  go :: Bool -> [String] -> [String] -> String -> Bool
  go False abas babs ('[':cs) = go True abas babs cs
  go False abas babs (c1:c2:c3:cs) =
    if isAba [c1,c2,c3]
      then go False ([c1,c2,c3]:abas) babs (c2:c3:cs)
      else go False abas babs (c2:c3:cs)
  go True abas babs (']':cs) = go False abas babs cs
  go True abas babs (c1:c2:c3:cs) =
    if isAba [c1,c2,c3]
      then go True abas ([c1,c2,c3]:babs) (c2:c3:cs)
      else go True abas babs (c2:c3:cs)
  go _ abas babs _ = or [aba `isInverted` bab | aba <- abas, bab <- babs]

  isAba :: String -> Bool
  isAba [c1,c2,c3] = c2 /= '[' && c2 /= ']' && c1 == c3
  isAba _ = False

  isInverted :: String -> String -> Bool
  isInverted [c1,c2,c3] [c1',c2',c3'] = c1 == c2' && c2 == c1'
