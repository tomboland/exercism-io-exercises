open Base
open Angstrom

let empty = Map.empty (module String)
let is_nonword = function | '\n' | '!' | ':' | ',' | ' ' | '\t' | '\'' -> true  | _ -> false
let is_walpha = function | 'a' .. 'z' | 'A' .. 'Z' -> true | _ -> false

let apostraphe = char '\'' >>= fun _ -> peek_char_fail >>= function
  | c when is_walpha c -> advance 1 >>| fun () -> true
  | _ -> return false

let is_word = 
  take_while is_walpha 
  >>= fun w ->
  apostraphe 
  >>= function
  | false -> return w
  | true -> take_while is_walpha 
    >>= fun w2 ->
    return (w ^ "\'" ^ w2)

let word = take_while is_nonword *> is_word
let words = many word

let word_count s =
  let parsed = match parse_string words s with
  | Ok ws -> ws
  | Error _ -> failwith "fail"
  in
  List.fold ~f:(fun acc w ->
    Map.change acc (String.lowercase w) ~f:(fun v -> Some (1 + Option.value ~default:0 v)))
    ~init:empty parsed