import Lib (parseTriangles, countPossibles)

input :: String
input =
  " 101 301 501\n\
  \ 102 302 502\n\
  \ 103 303 503\n\
  \ 201 403 601\n\
  \ 202 403 602\n\
  \ 203 403 603\n"

main :: IO ()
main = do
  let triangles = parseTriangles input
  putStrLn $ show triangles
  putStrLn . show $ countPossibles triangles == 0
