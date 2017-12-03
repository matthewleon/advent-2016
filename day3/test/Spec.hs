import Lib (possible, countPossibles)
main :: IO ()
main = do
  putStrLn . show $ possible "5 10 25" == False
  putStrLn . show $ countPossibles ["5 10 25"] == 0
