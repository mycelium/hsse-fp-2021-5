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
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == c) {
      return 1
    }
    return pascal(c, r-1) + pascal(c-1, r-1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def rec_balance(chars: List[Char], counter: Int): Boolean = {
      if (counter < 0) return false
      if (chars.isEmpty) return counter == 0
      else
        chars.head match {
          case '(' => rec_balance(chars.tail, counter+1)
          case ')' => rec_balance(chars.tail, counter-1)
          case _ => rec_balance(chars.tail, counter)
        }
    }
    return rec_balance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def rec_change(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty) return 0
      if (money == 0) return 1
      return rec_change(money, coins.tail) + rec_change(money-coins.head, coins)
    }
    return rec_change(money, coins)
  }
}
