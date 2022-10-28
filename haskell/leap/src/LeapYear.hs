module LeapYear (isLeapYear) where

(%) :: Integral a => a -> a -> a
a % b = mod a b

isLeapYear :: Integer -> Bool
isLeapYear year
    | year % 4 == 0 && year % 100 /= 0 = True
    | year % 4 == 0 && year % 100 == 0 && year % 400 == 0 = True
    | otherwise = False
    
