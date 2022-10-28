module RunLength (decode, encode) where
import Text.Parsec
import Text.ParserCombinators.Parsec

decode :: String -> String
decode s = case parse (many nChars) "" s of
    Right parsed -> concat parsed
    _ -> ""

nChars :: GenParser Char st String
nChars = do
    nums <- read <$> option "0" (many1 digit)
    replicate (if nums > 0 then nums else 1) <$> (letter <|> space)

pack :: String -> [String]
pack [] = []
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)

runLength :: String -> String
runLength s = let strLen = length s in if strLen > 1 then show strLen else ""

encode :: String -> String
encode = concatMap (\s -> runLength s ++ [head s]) . pack
