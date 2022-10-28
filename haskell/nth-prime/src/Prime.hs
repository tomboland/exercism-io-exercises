module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n == 0 = Nothing
    | otherwise = Just $ last $ take n $ filter isPrime [1..]

isPrime :: Integer -> Bool
isPrime n
    | n == 1 = False
    | n == 2 || n == 3 = True
    | n `mod` 2 == 0 || n `mod` 3 == 0 = False
    | otherwise =
        not $ any (\y -> n `mod` y == 0) [2, 3..sqrtNPlusOne]
        where sqrtNPlusOne = iSqrt n + 1
        
iSqrt :: Integer -> Integer
iSqrt = floor . sqrt . fromIntegral