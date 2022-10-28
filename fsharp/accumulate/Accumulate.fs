module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list =
    let rec accumulate' acc = function 
        | [] -> List.rev acc
        | x::xs -> accumulate' (func x::acc) xs
    accumulate' [] input