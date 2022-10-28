object Leap {
  def leapYear(year: Int): Boolean =
    if (year % 4 == 0 && year % 100 != 0) true 
    else if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) true
    else false
}
