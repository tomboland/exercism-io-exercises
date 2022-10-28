module Transpose (transpose) where
import Control.Lens

transpose :: [String] -> [String]
transpose = map (^..each) . zip 
