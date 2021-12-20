package lab1

object Main {
  def main(args: Array[String]) = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println(balance("()()(".toList)) // false
    println(balance("((()()))".toList)) // true
    println(balance("((((((()".toList)) // false

    println(countChange(5, List(1, 2))) // 3
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) return 1

    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = numericBalance(chars)

  def numericBalance(chars: List[Char], counter: Int = 0): Boolean = {
    if (chars.isEmpty) return counter == 0
    if (counter < 0) return false

    chars.head match {
        case '(' => numericBalance(chars.tail, counter + 1)
        case ')' => numericBalance(chars.tail, counter - 1)
        case _ => numericBalance(chars.tail, counter)
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
    if (coins.isEmpty) throw new IllegalArgumentException("Empty list of coins variations!")
    if (money < 0) throw new IllegalArgumentException("Money can't be less then 0!")

    if (money == 0) return 0
    else
      changing(money, coins)
  }

  def changing(money: Int, coins: List[Int]): Int = {
    if (money == 0) return 1
    else if (coins.isEmpty || money < 0) return 0
    else
      changing(money, coins.tail) + changing(money - coins.head, coins)
  }
}
