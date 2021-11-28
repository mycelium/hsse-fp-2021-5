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
    println(balance("(2+3)*4+(7*(9-4))".toList))
    println(balance("(2+3)*4)(".toList))
    println(balance("(2+3(*4)".toList))
    println(countChange(5, List(2,3) ))
    println(countChange(5, List(2,3,1) ))
    println(countChange(37, List(1, 5, 10, 25) ))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    assert(c >= 0 && c <= r)
    if (c == 0 || c == r)
      return 1
    return pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
   def balance(chars: List[Char]): Boolean = {
        return checkBalance(chars, 0)
   }

  def checkBalance(chars: List[Char], counter: Int): Boolean = {
    if(chars.isEmpty){
      return counter==0
    }
    if(counter<0) {
      return false
    }
    if(chars.head=='(') {
      return checkBalance(chars.tail, counter+1)
    }
    if(chars.head==')') {
      return checkBalance(chars.tail, counter-1)
    }
    return checkBalance(chars.tail, counter)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    val sortedCoins = coins.sortWith(_ > _)
    if (money < 0 || coins.isEmpty) return 0;
    if (money == 0) return 1;
    return countChange(money, sortedCoins.tail) + countChange(money - sortedCoins.head, sortedCoins)
  }

}
