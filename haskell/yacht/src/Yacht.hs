module Yacht (yacht, Category(..)) where
import Data.List (sort, group, sortOn)

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

yacht :: Category -> [Int] -> Int
yacht Ones xs = sum $ filter (==1) xs
yacht Twos xs = sum $ filter (==2) xs
yacht Threes xs = sum $ filter (==3) xs
yacht Fours xs = sum $ filter (==4) xs
yacht Fives xs = sum $ filter (==5) xs
yacht Sixes xs = sum $ filter (==6) xs
yacht FullHouse xs = let gs = sortOn length $ group $ sort xs in
    case gs of
        (_:_:_):(_:_) -> sum $ concat gs
        _ -> 0
yacht FourOfAKind xs = sum $ take 4 $ concat $ filter (\g -> length g >= 4) $ group $ sort xs
yacht LittleStraight xs = if sort xs == [1..5] then 30 else 0
yacht BigStraight xs = if sort xs == [2..6] then 30 else 0
yacht Choice xs = sum xs
yacht Yacht (x:xs) = if all (==x) xs then 50 else 0
yacht _ _ = error "error"