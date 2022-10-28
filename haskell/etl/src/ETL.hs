module ETL (transform) where

import qualified Data.Map as Map
import qualified Data.Char as C

transform :: Map.Map a String -> Map.Map Char a
transform = Map.fromList . concatMap (\ (k, v) -> map (\ c -> (C.toLower c, k)) v) . Map.toList
