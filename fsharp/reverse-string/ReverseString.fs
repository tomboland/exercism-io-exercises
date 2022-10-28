module ReverseString

let reverse (input: string): string =
    match input with
    | "" -> ""
    | _ -> 
        Seq.foldBack (fun c acc -> acc + System.Char.ToString(c)) input ""