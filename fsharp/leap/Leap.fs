module Leap

let leapYear (year: int): bool =
    match year with
    | _ when year % 4 = 0 && year % 100 <> 0 -> true
    | _ when year % 4 = 0 && year % 100 = 0 && year % 400 = 0 -> true
    | _ -> false