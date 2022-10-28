pub fn map<T, U>(input: Vec<T>, mut function: impl FnMut(T) -> U) -> Vec<U> {
    let mut output = Vec::<U>::new();
    for x in input {
        output.push(function(x));
    }
    output
}