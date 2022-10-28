module Gigasecond

let gigasecond = System.TimeSpan(0, 0, 1000000000)

let add (beginDate : System.DateTime) : System.DateTime =
    beginDate + gigasecond