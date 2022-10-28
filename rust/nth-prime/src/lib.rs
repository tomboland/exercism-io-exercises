pub struct Primes {
    curr: u32,
    next: u32
}

impl Primes {
    pub fn new() -> Primes {
        Primes { curr: 1, next: 2 }
    }
    pub fn is_prime(n: u32) -> bool {
        match n {
            2|3 => return true,
            _ if n % 3 == 0 || n % 2 == 0 => return false,
            _ => ()
        }
        let sqrt_of_n_plus_one = (n as f64).sqrt() as u32 + 1;
        if (3..sqrt_of_n_plus_one).step_by(2).any(|x| n % x == 0) {
            return false;
        }
        true
    }
}

impl Iterator for Primes {
    type Item = u32;
    fn next(&mut self) -> Option<u32> {
        self.curr = self.next;
        let mut i = self.curr + 1;
        while !Primes::is_prime(i) {
            i += 1;
        }
        self.next = i;
        Some(self.curr)
    }
}

pub fn nth(n: u32) -> u32 {
    let p = Primes::new();
    p.skip(n as usize).next().unwrap()
}
