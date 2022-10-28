module Luhn (isValid) where
import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid n
    | not $ all isDigit cs = False
    | length cs < 2 = False
    | sum' `mod` 10 == 0 = True
    | otherwise = False
    where cs = filter (/=' ') n
          sum' = sumEverySecondDigitFromRight cs

mapEveryNth :: Int -> (Int -> Int) -> [Int] -> [Int]
mapEveryNth n f cs = [if snd c `mod` n == 0 then f $ fst c else fst c | c <- zip cs [1..]]

doubleAndIfOver9Subtract9 :: Int -> Int
doubleAndIfOver9Subtract9 x =
    if y > 9 then y - 9 else y
    where y = x + x

sumEverySecondDigitFromRight :: String -> Int
sumEverySecondDigitFromRight = 
    sum . mapEveryNth 2 doubleAndIfOver9Subtract9 . map digitToInt . reverse