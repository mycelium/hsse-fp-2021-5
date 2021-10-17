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
    if (c ==  0 || r == c) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balancePar(chars: List[Char], par: Int): Int = {
      if (chars.isEmpty || par < 0) par
      else if (chars.head == ')') balancePar(chars.tail, par - 1)
      else if (chars.head == '(') balancePar(chars.tail, par + 1)
      else balancePar(chars.tail, par)
   }        
   balancePar(expressionChars, 0) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
     def changeAct(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty && money > 0) 0
      else if (money == 0) 1
      else changeAct(money, coins.tail) + changeAct(money - coins.head, coins)
    }
    changeAct(money, coins)
  }
}
