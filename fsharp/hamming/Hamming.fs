module Hamming

let distance (strand1: string) (strand2: string): int option =
    if strand1.Length <> strand2.Length then 
        None
    else
        Seq.zip strand1 strand2
        |> Seq.filter (fun p -> fst p <> snd p)
        |> Seq.length
        |> Some