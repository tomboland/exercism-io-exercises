object Twofer {
  def twofer(): String =
    s"One for you, one for me."

  def twofer(name: String): String = {
    s"One for $name, one for me."
  }
}
