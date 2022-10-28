module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad (foldM)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM increment Map.empty
    where increment = 

nucleoHelper :: Char -> Either String Nucleotide
nucleoHelper 'A' = Right A
nucleoHelper 'C' = Right C
nucleoHelper 'G' = Right G
nucleoHelper 'T' = Right T
nucleoHelper _ = Left "?"