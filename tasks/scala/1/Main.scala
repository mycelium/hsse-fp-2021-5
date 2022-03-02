object Main {
  def main(args: Array[String]) {
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println()
    println("Exercise 1 Pascal's Triangle")
    println(pascal(4, 5)) // 5
    println(pascal(5, 8)) // 56
    println()

    println("Exercise 2 Parentheses Balancing")
    println(balance("(".toList))  // false
    println(balance("(()))".toList))  // false
    println(balance("((1-4) * 5)".toList))  // true
    println()

    println("Exercise 3 Counting Change")
    println(countChange(10, List(1, 2, 4))) // 12
    println(countChange(-1, List(10, 20)))  // 0
    println(countChange(6, List(1, 2))) // 4
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c < 0 || r < 0) {
      throw new IllegalArgumentException("Column and row must be positive.")
    } else if (c > r) {
      throw new IllegalArgumentException("Row number must be greater than column.")
    }
    if (c == 0 || c == r)
      1
    else
      pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balanced(chars: List[Char], open: Int): Boolean = {
      if (chars.isEmpty) open == 0
      else
        if (chars.head == '(') balanced(chars.tail,open + 1)
        else
          if (chars.head == ')') open > 0 && balanced(chars.tail,open - 1)
          else balanced(chars.tail,open)
    }
    balanced(chars,0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0 || coins.isEmpty)
      0
    else if (money == 0)
      1
    else
      countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
}