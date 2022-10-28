module Anagram (anagramsFor) where
import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\s -> (sort $ lowerFromString s) == (sort $ lowerFromString xs)) $ removeOriginal xs xss

removeOriginal :: String -> [String] -> [String]
removeOriginal xs xss = filter (\s -> lowerFromString s /= lowerFromString xs) xss

lowerFromString :: String -> String
lowerFromString = map toLower
