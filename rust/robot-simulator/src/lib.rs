#[derive(PartialEq, Debug)]
pub enum Direction {
    North,
    East,
    South,
    West,
}

#[derive(PartialEq, Debug)]
pub struct Robot {
    direction: Direction,
    x: i32,
    y: i32
}

impl Robot {
    pub fn new(x: i32, y: i32, d: Direction) -> Self {
        Robot { direction: d, x, y }
    }

    pub fn turn_right(self) -> Self {
        match self.direction() {
            Direction::North => Robot { direction: Direction::East, ..self },
            Direction::East => Robot { direction: Direction::South, ..self },
            Direction::South => Robot { direction: Direction::West, ..self },
            Direction::West => Robot { direction: Direction::North, ..self }
        }
    }

    pub fn turn_left(self) -> Self {
        match self.direction() {
            Direction::North => Robot { direction: Direction::West, ..self },
            Direction::West => Robot { direction: Direction::South, ..self },
            Direction::South => Robot { direction: Direction::East, ..self },
            Direction::East => Robot { direction: Direction::North, ..self }
        }
    }

    pub fn advance(self) -> Self {
        match self.direction() {
            Direction::North => Robot { y: self.y + 1, ..self },
            Direction::West => Robot { x: self.x - 1, ..self },
            Direction::South => Robot { y: self.y - 1, ..self },
            Direction::East => Robot { x: self.x + 1, ..self }
        }
    }

    pub fn exec_instruction(self, instruction: char) -> Self {
        match instruction {
            'A' => self.advance(),
            'R' => self.turn_right(),
            'L' => self.turn_left(),
            _ => self
        }
    }

    pub fn instructions(self, instructions: &str) -> Self {
        instructions.chars().fold(self, |acc, instruction| acc.exec_instruction(instruction))
    }

    pub fn position(&self) -> (i32, i32) {
        (self.x, self.y)
    }

    pub fn direction(&self) -> &Direction {
        &self.direction
    }
}
