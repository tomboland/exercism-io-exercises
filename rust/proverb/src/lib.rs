pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 {
        return String::new();
    }
    let mut lines: Vec<String> = Vec::new();
    let all_for_the_want_of_a = list[0];
    for pair in list.windows(2) {
        lines.push(format!("For want of a {} the {} was lost.", pair[0], pair[1]));
    }
    lines.push(format!("And all for the want of a {}.", all_for_the_want_of_a));
    lines.join("\n")
}
