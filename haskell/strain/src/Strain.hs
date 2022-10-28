module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard predicate (x:xs)
    | not $ predicate x = x : discard predicate xs 
    | otherwise = discard predicate xs


keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep predicate (x:xs)
    | predicate x = x : keep predicate xs
    | otherwise = keep predicate xs
