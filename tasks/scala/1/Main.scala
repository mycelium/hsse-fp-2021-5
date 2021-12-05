package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("Parentheses Balancing")
    println(balance("".toList))
    println(balance("(".toList))
    println(balance("()".toList))
    println(balance("(abc(abc))".toList))
    println(balance("((())a)".toList))

    println("Counting Change")
    println(countChange(-2, List(1, 2, 3, 4)))
    println(countChange(0, List(1, 2, 3, 4)))
    println(countChange(4, List(1, 2, 3)))
    println(countChange(5, List(2, 3)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == r || c == 0) 1
    else
      pascal(c, r - 1) + pascal(c - 1, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
   def count(chars: List[Char], parenthesesCount: Int): Boolean = {
    if (chars.isEmpty) parenthesesCount == 0
    else chars.head match {
      case ')' => count(chars.tail, parenthesesCount - 1)
      case '(' => count(chars.tail, parenthesesCount + 1)
      case _ => count(chars.tail, parenthesesCount)
    }
   }

   count(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0) 1
    else if (coins.isEmpty || money < 0) 0
    else
      countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }
}
