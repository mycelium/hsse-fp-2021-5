package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    val balanced = "((2+3)*5+(5+2)/4)".toList
    val notBalanced = "(((2+5)".toList
    println(s"balance good: ${balance(balanced)}\nbalance bad: ${balance(notBalanced)}")

    val coins = List(3, 5)
    println(s"change: ${countChange(10, coins)}")
    println(s"change: ${countChange(15, coins)}")
  }

  /**
   * Exercise 1
   */
  def pascal(column: Int, row: Int): Int = {
    if (column < 0 || row < 0) {
      throw new IllegalArgumentException("Column and row must be positive.")
    } else if (column > row) {
      throw new IllegalArgumentException("Row number must be greater than column.")
    }

    if (column == 0 || column == row) 1
    else pascal(column - 1, row - 1) + pascal(column, row - 1)
  }


  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(expressionChars: List[Char]): Boolean = {
    def indexParentheses(chars: List[Char], parenthesesBalance: Int): Int = {
      if (chars.isEmpty || parenthesesBalance < 0) parenthesesBalance
      else if (chars.head == ')') indexParentheses(chars.tail, parenthesesBalance - 1)
      else if (chars.head == '(') indexParentheses(chars.tail, parenthesesBalance + 1)
      else indexParentheses(chars.tail, parenthesesBalance)
    }

    indexParentheses(expressionChars, 0) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def change(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty) 0
      else if (money == 0) 1
      else change(money, coins.tail) + change(money - coins.head, coins)
    }

    change(money, coins)
  }
}
