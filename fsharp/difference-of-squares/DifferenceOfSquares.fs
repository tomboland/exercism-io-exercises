module DifferenceOfSquares

let squareOfSum (number: int): int =
    seq [ 0 .. number ]
    |> Seq.sum
    |> fun x -> x * x

let sumOfSquares (number: int): int =
    seq [ 0 .. number ]
    |> Seq.fold (fun state x -> state + (x * x)) 0 

let differenceOfSquares (number: int): int =
    (squareOfSum number) - (sumOfSquares number)