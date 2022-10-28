module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where
import System.Random

decodeChar :: Char -> Char -> Char
decodeChar k c = toEnum $ (((fromEnum c - 97) - (fromEnum k - 97)) `mod` 26) + 97

encodeChar :: Char -> Char -> Char
encodeChar k c = toEnum $ (((fromEnum k - 97) + (fromEnum c - 97)) `mod` 26) + 97

caesarDecode :: String -> String -> String
caesarDecode key = zipWith decodeChar (cycle key)

caesarEncode :: String -> String -> String
caesarEncode key = zipWith encodeChar (cycle key)

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom text = do
    r <- newStdGen
    let key = take 100 $ randomRs ('a', 'z') r
    return (key, caesarEncode key text)
