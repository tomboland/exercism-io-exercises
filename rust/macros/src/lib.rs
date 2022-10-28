#[macro_export]
macro_rules! hashmap {
    ($( $k:expr => $v:expr ),* $(,)* ) => {{
            let mut temp_hmap = std::collections::HashMap::new();
            $( temp_hmap.insert($k, $v); )*
            temp_hmap
        }};
}
