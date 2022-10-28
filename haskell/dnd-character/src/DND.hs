module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, choose, vectorOf)
import           Data.List

data Character = Character
  { strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier = flip div 2 . subtract 10

ability :: Gen Int
ability = sum . drop 1 . sortBy (flip compare) <$> dice 4

character :: Gen Character
character = do
  let str = ability
  let dex = ability
  con <- ability
  let int = ability
  let wis = ability
  let chr = ability
  let hp = modifier con + 10
  Character
    <$> str <*> dex <*> pure con <*> int <*> wis <*> chr <*> pure hp

die :: Gen Int
die = choose (1, 6)

dice :: Int -> Gen [Int]
dice x = vectorOf x die
