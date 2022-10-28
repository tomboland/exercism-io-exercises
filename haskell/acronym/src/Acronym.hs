module Acronym (abbreviate) where
import Data.Char (toUpper, isUpper)

abbreviate :: String -> String
abbreviate xs = map toUpper $ concat $ map firstAndUpper $ tSplit xs " -"

firstAndUpper :: String -> String
firstAndUpper xs
    | all isUpper xs = head xs : []
    | otherwise = head xs : filter isUpper (tail xs)

tSplit :: String -> String -> [String]
tSplit s delims = filter (not . null) $ tSplit' (s) delims
    where 
        tSplit' [] _ = [""]
        tSplit' (c:cs) delims'
            | c `elem` delims' = "" : rest
            | otherwise = (c : head rest) : tail rest
            where
                rest = tSplit' cs delims'