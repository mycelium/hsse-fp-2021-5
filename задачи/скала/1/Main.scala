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
    var int: Int = 0
    var res: Int = 0


    if ((c == r) || (c == 0))
      int = 1
    else if ((c == 1))  int = c+r-1
    else if ((c >= 2) && (c == r-1)) int = r
    else if ((c >= 2) || (c == r-2))
      int = pascal(c,r-1) + pascal(c-1,r-1)
    return int

  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    var sk1: Int = 0
    var sk2: Int = 0

    if (chars.head == '(') sk1 = sk1+1
    else if (chars.head == ')') sk2 = sk2+1
      else return false

    for (i <- chars.tail)
    if (i == '(') sk1 = sk1+1
    else if (i == ')') sk2 = sk2+1
    else return false

    if(sk1-sk2 == 0) return true
      else return false
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {

    var res: Int = 0;
    res = res + sum(money, coins, 0)
    return res
  }

  var cnt: Int = 0
  def sum(money: Int, coins: List[Int], n: Int): Int = {
    //var cnt: Int = n
    var mon: Int = money

    var min: Int = coins.min

    //for (i <- 0 to mon by min) {
      for (coin <- coins) {
        if (money - coin >= 0 && money != 0) {
          sum(money - coin, coins.filter(elem => elem <= coin), cnt)

        } else if (money == 0) {
          //print (coin)
          cnt += 1
          return cnt
        } else { if (money - coin < 0)
           cnt += 0}
      }
    return cnt
  }
}
