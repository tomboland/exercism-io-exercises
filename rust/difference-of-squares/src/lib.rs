extern crate num;

use num::{PrimInt};

pub fn square_of_sum<T: PrimInt>(n: T) -> T {
    let sqr_of_sum: T = num::range_inclusive(T::one(), n)
        .fold(T::zero(), |total, next| total + next);
    sqr_of_sum * sqr_of_sum
}

pub fn sum_of_squares<T: PrimInt>(n: T) -> T {
    num::range_inclusive(T::one(), n)
        .fold(T::zero(), |total, next| total + next*next)
}

pub fn difference<T: PrimInt>(n: T) -> T {
    square_of_sum(n) - sum_of_squares(n)
}
