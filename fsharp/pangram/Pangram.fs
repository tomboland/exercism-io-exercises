module Pangram
let alphabet = "abcdefghijklmnopqrstuvwxyz"
let isPangram (input: string): bool =
    let numUniqueCharacters =
        input.ToLower()
        |> Seq.filter alphabet.Contains
        |> Seq.distinct
        |> Seq.length
    numUniqueCharacters = alphabet.Length