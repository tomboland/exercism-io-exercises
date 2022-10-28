pub fn is_armstrong_number(num: u32) -> bool {
    let ns: String = num.to_string();
    let nlen = ns.len();
    ns.chars()
        .fold(0, |acc, c| acc + c.to_digit(10).unwrap().pow(nlen as u32))
        == num
}
