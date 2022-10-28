module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Enum, Eq, Show)

data Robot = Robot
    { _bearing :: Bearing
    , _coordinates :: (Integer, Integer)
    }


bearing :: Robot -> Bearing
bearing = _bearing

coordinates :: Robot -> (Integer, Integer)
coordinates = _coordinates

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction location = Robot { _bearing = direction, _coordinates = location }

move :: Robot -> String -> Robot
move = foldl _move

_move :: Robot -> Char -> Robot
_move robot instruction = case instruction of
    'R' -> robot { _bearing = toEnum ((fromEnum (bearing robot) + 1) `mod` 4) }
    'L' -> robot { _bearing = toEnum ((fromEnum (bearing robot) - 1) `mod` 4) }
    'A' -> case bearing robot of
        North -> robot { _coordinates = let (x, y) = coordinates robot in (x, y + 1)}
        South -> robot { _coordinates = let (x, y) = coordinates robot in (x, y - 1)}
        East -> robot { _coordinates = let (x, y) = coordinates robot in (x + 1, y)}
        West -> robot { _coordinates = let (x, y) = coordinates robot in (x - 1, y)}
    _ -> robot