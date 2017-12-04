import Lib

room1 = "aaaaa-bbb-z-y-x-123[abxyz]"
room2 = "a-b-c-d-e-f-g-h-987[abcde]"
room3 = "not-a-real-room-404[oarel]"
room4 = "totally-real-room-200[decoy]"

main :: IO ()
main = do
  putStrLn . show $ parseRoom room1 == Room "aaaaabbbzyx" 123 "abxyz"
  putStrLn . show $ mostCommonEntries "notarealroom" == "oarel"
  putStrLn . show $ realRoom (parseRoom room1) == True
  putStrLn . show $ realRoom (parseRoom room2) == True
  putStrLn . show $ realRoom (parseRoom room3) == True
  putStrLn . show $ realRoom (parseRoom room4) == False
  putStrLn . show $ sumRealRoomSectorIds [room1, room2, room3, room4] == 1514
