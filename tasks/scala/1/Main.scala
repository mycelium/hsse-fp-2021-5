object Main {
  def main(args: Array[String]): Unit = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Balance of brackets")
    println(balance("(1 + 1)".toList))
    println(balance("1 + 1)".toList))
    println(balance("(1 + 1".toList))
    println(balance("((1 + 1))".toList))
    println(balance("(1 + 1))".toList))
    println(balance("((1 + 1)".toList))
  }

  /**
   * Exercise 1
   Реализация с использованием биномиальных коэффициентов не прошла по памяти.
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }
  
  /**
     Pascal's Triangle
     1
     1 1
     1 2 1
     1 3 3 1
     1 4 6 4 1
     1 5 10 10 5 1
     1 6 15 20 15 6 1
     1 7 21 35 35 21 7 1
     1 8 28 56 70 56 28 8 1
     1 9 36 84 126 126 84 36 9 1
     1 10 45 120 210 252 210 120 45 10 1
   */
  
  /**
   * Exercise 2 Parentheses Balancing
   */
  
  def calculOfCount(chars: List[Char], symbol: Char, count: Int): Int = {
     if (chars.isEmpty) count
     else if (chars.head == symbol) calculOfCount(chars.tail, symbol, count + 1)
     else calculOfCount(chars.tail, symbol, count)
  }

  def balance(chars: List[Char]): Boolean = {
      calculOfCount(chars, '(', 0) == calculOfCount(chars, ')', 0)
  }

}
