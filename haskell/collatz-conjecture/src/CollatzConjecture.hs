module CollatzConjecture (collatz) where

isOne :: Integer -> Bool
isOne n = n == 1

isEven :: Integer -> Bool
isEven n = n `mod` 2 == 0

isOdd :: Integer -> Bool
isOdd n = not $ isEven n

collatz :: Integer -> Maybe Integer
collatz n 
    | n < 1 = Nothing
    | n == 1 = Just 0
    | otherwise = Just (collatzator n 0)

collatzator :: Integer -> Integer -> Integer
collatzator n c 
    | isOne n = c
    | isEven n = collatzator (n `div` 2) (c + 1)
    | isOdd n = collatzator (n * 3 + 1) (c + 1)
    | otherwise = error "I just put this here because of the warning about incomplete pattern matches"