package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    assert(c <= r, "Column shouldn't be grater than row")
    if (c == 0 || r == c) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
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
    def countCombinations(money: Int, coins: List[Int], currentSum: Int = 0): Int = {
      if (money == currentSum) 1
      else if (currentSum > money || coins.isEmpty) 0
      else countCombinations(money, coins, currentSum + coins.head) + countCombinations(money, coins.tail, currentSum)
    }

    countCombinations(money, coins)
  }
}
