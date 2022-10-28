module Pangram (isPangram) where
import Data.Char (isLetter, toLower)
import qualified Data.Set as Set

alphaSet :: Set.Set Char
alphaSet = Set.fromList ['a'..'z']

isPangram :: String -> Bool
isPangram text = alphaSet == Set.fromList (map toLower (filter isLetter text))