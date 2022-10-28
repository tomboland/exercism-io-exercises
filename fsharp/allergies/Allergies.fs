module Allergies

open System

type Allergen = 
    | Eggs = 1
    | Peanuts = 2
    | Shellfish = 4
    | Strawberries = 8
    | Tomatoes = 16
    | Chocolate = 32
    | Pollen = 64
    | Cats = 128

let allergicTo codedAllergies (allergen : Allergen) =
    (enum codedAllergies) &&& allergen = allergen

let list codedAllergies =
    Enum.GetValues(typeof<Allergen>)
    |> Seq.cast<Allergen>
    |> Seq.filter (allergicTo codedAllergies)
    |> Seq.toList