use std::collections::HashSet;


pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    factors
    .iter()
    .filter(|&f| *f != 0)
    .fold(HashSet::new(), |mut acc, f| {
        (1..limit)
        .filter(|&x| x % *f == 0)
        .for_each(|pf| { acc.insert(pf); } );
        acc
    })
    .iter()
    .sum()
}