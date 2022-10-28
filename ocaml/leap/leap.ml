let leap_year y = 
    let modY x = y mod x == 0 in
    modY 4 && not (modY 100) || modY 4 && modY 400
