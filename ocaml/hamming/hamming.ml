open Base
type nucleotide = A | C | G | T

let hamming_distance x y =
  let f acc xz yz = match xz, yz with 
    | xz, yz when not (phys_equal xz yz) -> acc + 1
    | _ -> acc
    in match (List.fold2 ~init:0 ~f:f x y) with
    | Ok len -> Ok len
    | Unequal_lengths -> match x, y with 
      | x, _ when phys_equal (List.length x) 0 ->
        Error "left strand must not be empty"
      | _, y when phys_equal (List.length y) 0 ->
        Error "right strand must not be empty"
      | _ ->
        Error "left and right strands must be of equal length"