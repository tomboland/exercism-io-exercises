module CryptoSquare (encode) where
import Data.Char (toLower, isAlphaNum)
import Data.List.Split (chunksOf)
import Data.List (transpose)

encode :: String -> String
encode xs = 
    unwords $ chunksOf rows $ transposeMsg cols nct
    where (cols, rows) = colsAndRows ctLen
          nct = normaliseCipherText xs
          cDeficit = cols * rows - ctLen
          ctLen = length nct

transposeMsg chunkSize =
    concat . transpose . chunksOf chunkSize

normaliseCipherText = map toLower . filter isAlphaNum

ceilSqrt = ceiling . sqrt . fromIntegral

colsAndRows n 
    | root * (root - 1) >= n = (root, root - 1)
    | root * root > n - root = (root, root)
    where root = ceilSqrt n

