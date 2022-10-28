open Base
open Batteries

type bracket_type = Parens | Square | Braces
type orientation = Opening | Closing

let bracket_type_from_char = function
    | '(' -> Some (Parens, Opening)
    | ')' -> Some (Parens, Closing)
    | '[' -> Some (Square, Opening)
    | ']' -> Some (Square, Closing)
    | '{' -> Some (Braces, Opening)
    | '}' -> Some (Braces, Closing)
    | _ -> None

let check_next_char (b : bracket_type list option) (c : char) = match b, c with
    | None, _ -> None
    | (Some []), c -> (match bracket_type_from_char c with
        | Some (btype, Opening) -> Some [btype]
        | Some (_, Closing) -> None
        | None -> Some [])
    | Some (h :: t), c -> (match bracket_type_from_char c with
        | Some (btype, Opening) -> Some (btype :: h :: t)
        | Some (btype, Closing) -> if (phys_equal btype h) then Some t else None
        | None -> Some (h :: t))

let are_balanced s =
    let res = List.fold_left check_next_char (Some []) (String.to_list s) in
    match res with
    | Some [] -> true
    | _ -> false
