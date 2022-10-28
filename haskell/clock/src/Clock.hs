module Clock (addDelta, fromHourMin, toString) where
import Text.Printf (printf)

data Hour = Hour Int

data Minute = Minute Int

data Clock = Clock Hour Minute
instance Eq Clock where
    (Clock (Hour xHour) (Minute xMinute)) == (Clock (Hour yHour) (Minute yMinute)) = xHour == yHour && xMinute == yMinute

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = Clock (Hour $ ((hour + (minute `div` 60)) `mod` 24)) (Minute $ minute `mod` 60)

toString :: Clock -> String
toString (Clock (Hour hour) (Minute minute)) = printf "%02d" hour ++ ":" ++ printf "%02d" minute

addDelta :: Int -> Int -> Clock -> Clock
addDelta hourDelta minuteDelta (Clock (Hour hour) (Minute minute)) = fromHourMin (hour + hourDelta) (minute + minuteDelta)
