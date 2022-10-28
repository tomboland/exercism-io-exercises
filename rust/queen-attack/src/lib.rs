#[derive(Debug)]
pub struct ChessPosition {
    rank: i32,
    file: i32
}

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}


impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        match (rank, file) {
            (x, y) if (0..8).contains(&x) && (0..8).contains(&y) => Some(ChessPosition { rank, file }),
            _ => None
        }
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Queen { position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        ((self.position.rank - other.position.rank).abs() == (self.position.file - other.position.file).abs())
        || self.position.file == other.position.file || self.position.rank == other.position.rank
    }
}
