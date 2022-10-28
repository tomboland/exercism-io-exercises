module SpaceAge (Planet(..), ageOn) where

data Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune deriving (Eq, Show)

planetOrbitalPeriod :: Planet -> Float
planetOrbitalPeriod = period
    where
        period Earth = earthYearSeconds
        period Mercury = earthYearSeconds * 0.2408467
        period Venus = earthYearSeconds * 0.61519726
        period Mars = earthYearSeconds * 1.8808158
        period Jupiter = earthYearSeconds * 11.862615
        period Saturn = earthYearSeconds * 29.447498
        period Uranus = earthYearSeconds * 84.016846
        period Neptune = earthYearSeconds * 164.79132
        earthYearSeconds = 31557600.0


ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / planetOrbitalPeriod planet