module RobotName

let rand = new System.Random()
let upperCaseAlpha = { 'A' .. 'Z' }
let digits = { 0 .. 9 }
let mutable existingNames : Set<string> = Set.empty

let shuffleTakeString (rng : System.Random) (len : int) (inputSeq : seq<'a>) =
    inputSeq
    |> Seq.sortBy (fun _ -> rng.Next())
    |> Seq.take len
    |> System.String.Concat

let newName (rng : System.Random) = 
    let alphaPrefix = shuffleTakeString rng 2 upperCaseAlpha
    let numericSuffix = shuffleTakeString rng 3 digits
    alphaPrefix + numericSuffix

let rec endlessNameGenerator =
    seq { 
        yield newName rand
        yield! endlessNameGenerator 
    }

let mkRobot() =
    endlessNameGenerator
    |> Seq.pick (fun n ->
        match n with
        | _ when existingNames.Contains n ->
            printfn "%A" n
            None
        | _ -> 
            existingNames <- existingNames.Add n
            Some n)

let name robot =
    robot

let reset robot =
    mkRobot()