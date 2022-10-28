{-# LANGUAGE TemplateHaskell #-}

module Person
  ( Address (..)
  , Born    (..)
  , Name    (..)
  , Person  (..)
  , bornStreet
  , renameStreets
  , setBirthMonth
  , setCurrentStreet
  ) where

import Data.Time.Calendar
import Control.Lens

data Person = Person { _name    :: Name
                     , _born    :: Born
                     , _address :: Address
                     }

data Name = Name { _foreNames :: String
                 , _surName   :: String
                 }

data Born = Born { _bornAt :: Address
                 , _bornOn :: Day
                 }

data Address = Address { _street      :: String
                       , _houseNumber :: Int
                       , _place       :: String
                       , _country     :: String
                       }

$(makeLenses ''Person)
$(makeLenses ''Name)
$(makeLenses ''Born)
$(makeLenses ''Address)

bornStreet :: Born -> String
bornStreet = (^. bornAt . street)

setCurrentStreet :: String -> Person -> Person
setCurrentStreet = (address . street .~)

setBirthMonth :: Int -> Person -> Person
setBirthMonth month = over (born . bornOn) (setMonth month)

setMonth :: Int -> Day -> Day
setMonth month day = let (y, m, d) = _2 .~ month $ toGregorian day in fromGregorian y m d

renameStreets :: (String -> String) -> Person -> Person
renameStreets f = over (address . street) f . over (born . bornAt . street) f
