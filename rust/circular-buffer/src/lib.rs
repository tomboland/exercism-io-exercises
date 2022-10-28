use std::fmt::Debug;

#[derive(Debug)]
pub struct CircularBuffer<T> where T: Default+Clone+Debug {
    buf: Vec<T>,
    start: usize,
    end: usize,
    full: bool,
    empty: bool
}

#[derive(Debug, PartialEq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

impl<T> CircularBuffer<T> where T: Default+Clone+Debug {
    pub fn new(capacity: usize) -> Self {
        CircularBuffer {
            buf: vec![T::default(); capacity],
            start: 0,
            end: 0,
            full: false,
            empty: true
        }
    }
        
    pub fn write(&mut self, element: T) -> Result<(), Error> 
        where T: Default+Clone+Debug {
        if self.full {
            Err(Error::FullBuffer)
        } else {
            self.buf[self.end] = element;
            self.end = (self.end + 1) % self.buf.len();
            if self.end == self.start {
                self.full = true;
            }
            self.empty = false;
            Ok(())
        }
    }

    pub fn read(&mut self) -> Result<T, Error> 
        where T: Default+Clone {
        if self.empty {
            Err(Error::EmptyBuffer)
        } else {
            let ret = self.buf[self.start].clone();
            self.start = (self.start + 1) % self.buf.len();
            self.full = false;
            if self.start == self.end {
                self.empty = true;
            }
            Ok(ret)
        }
    }

    pub fn clear(&mut self) {
        self.start = 0;
        self.end = 0;
        self.empty = true;
        self.full = false;
    }

    pub fn overwrite(&mut self, element: T) {
        if !self.full {
            self.write(element).unwrap();
        } else {
            self.buf[self.start] = element;
            self.start = (self.start + 1) % self.buf.len();
            self.end = self.start;
        }
    }
}
