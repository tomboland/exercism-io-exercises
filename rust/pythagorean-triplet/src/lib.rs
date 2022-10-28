use std::collections::HashSet;

pub fn euclid_find(sum: u32) -> HashSet<[u32; 3]> {
    let mut triples: HashSet<[u32; 3]> = HashSet::new();
    let sqrt = (sum as f64).sqrt() as u32 + 1;
    for n in 1..=sqrt {
        for m in n+1..=sqrt {
            let mut triple = [m*m - n*n, 2 * m * n, m*m + n*n];
            let this_triple_sum: u32 = triple.iter().sum();
            if this_triple_sum == sum {
                triple.sort();
                triples.insert(triple);
            }
        }
    }
    triples
}

pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    let mut triples: HashSet<[u32; 3]> = HashSet::new();
    for x in 2..=sum {
        for y in 1..sum {
            match y {
                _ if y >= x => break,
                _ if x*x + y*y > sum => break,
                _ => {
                    let a = x*x - y*y;
                    let b = 2 * x*y;
                }
            }
        }
    }
    triples
}