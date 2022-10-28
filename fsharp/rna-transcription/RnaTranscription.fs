module RnaTranscription

let toRna (dna: string): string =
    dna
    |> Seq.fold (fun acc c ->
        match c with
        | 'G' -> 'C'
        | 'C' -> 'G'
        | 'T' -> 'A'
        | 'A' -> 'U'
        |> System.Char.ToString
        |> (+) acc) ""
