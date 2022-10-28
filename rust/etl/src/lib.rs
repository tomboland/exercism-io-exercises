use std::collections::BTreeMap;


pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    h.iter().fold(BTreeMap::new(), |mut acc, (k, v)| {
        v.iter().for_each(|&c| {
            acc.insert(c.to_ascii_lowercase(), *k);
        });
        acc
    })
}
