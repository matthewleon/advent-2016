import Lib

main :: IO ()
main = do
  putStrLn "TLS"
  print $ supportsTLS "abba[mnop]qrst"
  print $ supportsTLS "abcd[bddb]xyyx"
  print $ supportsTLS "aaaa[qwer]tyui"
  print $ supportsTLS "ioxxoj[asdfgh]zxcvbn"

  putStrLn "SSL"
  print $ supportsSSL "aba[bab]xyz"
  print $ supportsSSL "xyx[xyx]xyx"
  print $ supportsSSL "aaa[kek]eke"
  print $ supportsSSL "zazbz[bzb]cdb"
