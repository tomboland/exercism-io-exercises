use std::fmt;
extern crate num_integer;
use num_integer::Integer;

#[derive(Debug)]
struct Hours(i32);
#[derive(Debug)]
struct Minutes(i32);

#[derive(Debug)]
pub struct Clock {
    hours: Hours,
    minutes: Minutes,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            hours: Hours((hours + (minutes.div_floor(&60))).mod_floor(&24)),
            minutes: Minutes(minutes.mod_floor(&60)),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let Minutes(old_minutes) = self.minutes;
        let Hours(old_hours) = self.hours;
        Clock::new(old_hours,old_minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours.0, self.minutes.0)
    }
}

impl std::cmp::PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hours.0 == other.hours.0 && self.minutes.0 == other.minutes.0
    }
}