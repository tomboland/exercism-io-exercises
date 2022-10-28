module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse nucleotideDnaToRna

nucleotideDnaToRna :: Char -> Either Char Char
nucleotideDnaToRna 'G' = Right 'C'
nucleotideDnaToRna 'C' = Right 'G'
nucleotideDnaToRna 'T' = Right 'A'
nucleotideDnaToRna 'A' = Right 'U'
nucleotideDnaToRna c = Left c