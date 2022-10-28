module Queens (boardString, canAttack) where
import Data.List.Split

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = 
    unlines $ map (unwords . chunksOf 1) $ chunksOf 8 $ concat
    [ if pieceAtPos white x then "W"
      else if pieceAtPos black x then "B"
      else "_"
    | x <- [0 .. 63]
    ]

pieceAtPos :: Maybe (Int, Int) -> Int -> Bool
pieceAtPos (Just (x, y)) i = x * 8 + y == i
pieceAtPos Nothing _ = False

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (rA, fA) (rB, fB) =
    rA == rB || fA == fB || abs (rA - rB) == abs (fA - fB)
