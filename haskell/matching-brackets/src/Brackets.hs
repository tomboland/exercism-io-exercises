module Brackets
    ( arePaired
    )
where

data BracketType = Parens | Square | Braces deriving (Eq)
data Orientation = Open | Close
data Bracket = Bracket BracketType Orientation

bracketType :: Char -> Maybe Bracket
bracketType '(' = Just $ Bracket Parens Open
bracketType ')' = Just $ Bracket Parens Close
bracketType '[' = Just $ Bracket Square Open
bracketType ']' = Just $ Bracket Square Close
bracketType '{' = Just $ Bracket Braces Open
bracketType '}' = Just $ Bracket Braces Close
bracketType _   = Nothing

arePaired :: String -> Bool
arePaired cs = case foldl checkNextChar (Just []) cs of
    Just [] -> True
    _       -> False

checkNextChar :: Maybe [BracketType] -> Char -> Maybe [BracketType]
checkNextChar Nothing   _ = Nothing
checkNextChar (Just []) c = case bracketType c of
    Just (Bracket btype Open ) -> Just [btype]
    Just (Bracket _     Close) -> Nothing
    Nothing                    -> Just []
checkNextChar (Just (a : acc)) c = case bracketType c of
    Just (Bracket btype Open ) -> Just (btype : a : acc)
    Just (Bracket btype Close) -> if btype == a then Just acc else Nothing
    Nothing                    -> Just (a : acc)
