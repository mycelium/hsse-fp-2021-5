package recfun
import scala.annotation.tailrec

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Balance")
    println(balance("(())".toList))
    println(balance("(()".toList))
    println(balance("(*_*)".toList))
    println(balance(":-(".toList))

    println("Count Change")
    println(countChange(5, List(2,3)))
    println(countChange(0, List(1,2,3)))
    println(countChange(6, List(1,2,3)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @tailrec
    def loop(chars: List[Char], parentheses: Int): Boolean = chars match {
      case Nil => parentheses == 0
      case ')' :: tail => if(parentheses==0) false else loop(tail, parentheses-1)
      case '(' :: tail  => loop(tail, parentheses+1)
      case head :: tail  => loop(tail, parentheses)
    }
    loop(chars,0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
      def loop(money: Int, coins: List[Int], ways:Int): Int = coins match {
      case Nil => ways
      case _ if money == 0 => ways+1
      case _ if(money - coins.head < 0 || coins.isEmpty) => 0
      case _ => loop(money-coins.head, coins, ways) +   loop(money, coins.tail, ways)
    }
    val sortedCoins = coins.sorted
    loop(money, sortedCoins, 0)
  }
}
