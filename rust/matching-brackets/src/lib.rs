#[derive(PartialEq, Copy, Clone)]
enum BType {
    Square,
    Brace,
    Parentheses,
}

enum Op {
    Open,
    Close,
}

struct BracketOp {
    btype: BType,
    op: Op,
}

fn try_char_brackop(c: char) -> Option<BracketOp> {
    match c {
        '{' => Some(BracketOp {
            btype: BType::Brace,
            op: Op::Open,
        }),
        '}' => Some(BracketOp {
            btype: BType::Brace,
            op: Op::Close,
        }),
        '[' => Some(BracketOp {
            btype: BType::Square,
            op: Op::Open,
        }),
        ']' => Some(BracketOp {
            btype: BType::Square,
            op: Op::Close,
        }),
        '(' => Some(BracketOp {
            btype: BType::Parentheses,
            op: Op::Open,
        }),
        ')' => Some(BracketOp {
            btype: BType::Parentheses,
            op: Op::Close,
        }),
        _ => None,
    }
}


pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = Vec::<BType>::new();
    let brachars: Vec<BracketOp> = string
        .chars()
        .map(try_char_brackop)
        .filter_map(|c| c)
        .collect();

    let result: Result<Vec<_>, _> = brachars
        .into_iter()
        .map(|c| match c {
            BracketOp {
                btype,
                op: Op::Open,
            } => {
                stack.push(btype);
                Ok(c)
            }
            BracketOp {
                btype,
                op: Op::Close,
            } => {
                if stack.is_empty() || stack.last() != Some(&btype) {
                    Err(c)
                } else {
                    stack.pop();
                    Ok(c)
                }
            }
        })
        .collect();
    result.is_ok() && stack.is_empty()
}
