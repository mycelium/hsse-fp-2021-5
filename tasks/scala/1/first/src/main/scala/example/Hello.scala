object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(pascal(2,2))
    println(pascal(1,6))
    println(pascal(2,3))
    println(balance("(1 + 1".toList))
    println(balance("1) + (1".toList))
    println(balance("(1 + 1)".toList))

    println(countChange(5, List(3,1,2)))

  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if(c == 0 || (c == r)) 1
    else pascal(c , r - 1) + pascal(c - 1, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
      def countParentheses(chars: List[Char], acc: Int = 0): Boolean = {
        if (chars.isEmpty) acc == 0
          else if ("(".contains(chars.head)) countParentheses(chars.tail, acc + 1)
          else if (")".contains(chars.head)) acc > 0 && countParentheses(chars.tail, acc - 1)
          else countParentheses(chars.tail, acc)
      }
      countParentheses(chars)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */

    def countChange(money: Int, coins: List[Int]): Int = {
      if (money < 0 || (coins.isEmpty && money > 0)) return 0
      if (money == 0) return 1
      return countChange(money, coins.tail) + countChange(money - coins.head, coins)
    }

}

