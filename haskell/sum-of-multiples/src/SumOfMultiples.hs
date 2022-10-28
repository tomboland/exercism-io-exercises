module SumOfMultiples (sumOfMultiples) where
import Data.Set (fromList, toList)

anyMultiples :: [Integer] -> Integer -> Bool
anyMultiples factors x = any (\f -> (f > 0) && (x `mod` f) == 0) factors

dedup :: Ord a => [a] -> [a]
dedup = toList . fromList

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ dedup $ filter (anyMultiples factors) [1..limit-1]
