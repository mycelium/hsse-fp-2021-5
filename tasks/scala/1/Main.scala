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

    println(balance(List('[', '(', ')', '{', '}', ']')))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (r < 0 && c < 0)
        return 0
    else if (r == c ||  c == 0)
      return 1
    else
      return pascal(c, r - 1) + pascal(c - 1, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
   val map = Map('(' -> ')', '{' -> '}', '[' -> ']')
   def balanceInternal(chars: List[Char], st: List[Char]): List[Char] = {
      if (chars.isEmpty) {
        return st
      }
      else if (map.contains(chars.head)) {
        return balanceInternal(chars.tail, st :+ chars.head)
      }
      else if (map.get(st.last) == Some(chars.head)) {
        return balanceInternal(chars.tail, st.dropRight(1))
      }
      else {
        return balanceInternal(chars.tail, st)
      }
   }
   return balanceInternal(chars, List()).length == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def changeInternal(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty && money > 0) 0
      else if (money == 0) 1
      else changeInternal(money, coins.tail) + changeInternal(money - coins.head, coins)
    }
    changeInternal(money, coins)
  }
}
