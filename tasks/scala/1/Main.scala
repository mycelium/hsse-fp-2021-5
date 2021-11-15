package recfun

//import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println(balance("a * (c + d) / (e - f)".toList))
    println(balance("(a - (c + d)) / (e - f)".toList))
    println(balance("()())(".toList))
    println(balance("()())".toList))
    println(balance("(()()".toList))
    println(balance("(()))(()".toList))

    println(countChange(10, List(2, 3, 5)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    assert(c >= 0 && c <= r)
    if (c == 0 || c == r )
       return 1
    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    check_balance(chars, 0)
  }

  def check_balance(chars: List[Char], balance: Int): Boolean = {
    if (balance < 0) return false
    if (chars.isEmpty) return balance == 0
    else
      chars.head match {
        case '(' => check_balance(chars.tail, balance + 1)
        case ')' => check_balance(chars.tail, balance - 1)
        case _ => check_balance(chars.tail, balance)
      }
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if(money <= 0) 0
    else findChange(money, coins, 0)
  }

  def findChange(money: Int, coins: List[Int], workIndex: Int): Int = {
    if(money == 0) return 1
    if (money < 0 || coins.length == workIndex) return 0
    val sameCoin = findChange(money - coins.apply(workIndex), coins, workIndex)
    val biggerCoin = findChange(money, coins, workIndex + 1)
    sameCoin + biggerCoin
  }
}
