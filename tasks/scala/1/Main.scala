package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("Parentheses Balancing")
    val s1 = "((A+B)+C)"
    println(s1 + "  " + balance(s1.toList).toString)
    val s2 = "(((A+B)+C)"
    println(s2 + "  " + balance(s2.toList).toString)
    val s3 = "((A+B)+C))"
    println(s3 + "  " + balance(s3.toList).toString)

    println("Counting Change")
    val money1 = 8
    val coins1 = List(2, 3, 4, 1)
    println(s"As coin list: money = $money1, coins = $coins1, change vars = ${countChangeWithCoins(money1, coins1)}")
    println(s"As coin denominations list: money = $money1, coins = $coins1, change vars = ${countChangeWithDenoms(money1, coins1)}")
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = c match {
    case 0 => 1
    case `r` => 1
    case _ => pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count(c: List[Char], counter: Int): Boolean = c match {
      case Nil => counter == 0
      case '(' :: tail => count(tail, counter + 1)
      case ')' :: tail if counter < 1 => false
      case ')' :: tail => count(tail, counter - 1)
      case _ :: tail => count(tail, counter)
    }
    count(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */

  //For list of coins (not unique)
  def countChangeWithCoins(money: Int, coins: List[Int]): Int = coins match {
    case _ if money == 0 => 1
    case Nil if money != 0 => 0
    case coin :: tail if money - coin < 0 => countChangeWithCoins(money, tail)
    case coin :: tail => countChangeWithCoins(money - coin, tail) + countChangeWithCoins(money, tail)
  }

  //For list of coin denominations (unique)
  def countChangeWithDenoms(money: Int, coins: List[Int]): Int = coins match {
    case _ if money == 0 => 1
    case Nil if money != 0 => 0
    case coin :: tail if money - coin < 0 => countChangeWithDenoms(money, tail)
    case coin :: tail => countChangeWithDenoms(money - coin, coins) + countChangeWithDenoms(money, tail)
  }
}
