use rayon::prelude::{IntoParallelRefIterator, ParallelIterator};
use std::collections::HashMap;

pub fn frequency(input: &[&str], _worker_count: usize) -> HashMap<char, usize> {
    input
        .par_iter()
        .fold(HashMap::new, |mut acc, s| {
            for c in s.to_lowercase().chars() {
                if c.is_alphabetic() {
                    *acc.entry(c).or_insert(0) += 1;
                }
            }
            acc
        })
        .reduce(HashMap::new, |mut acc, add| {
            for (charkey, charcount) in add.iter() {
                *acc.entry(*charkey).or_insert(0) += *charcount;
            }
            acc
        })
}
