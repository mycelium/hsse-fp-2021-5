object Main {
  def main(args: Array[String]): Unit = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row).toString + " ")
      println()
    }
    print(balance("1 + 2".toList))
    println()
    print(balance("1 + 2)".toList))
    println()
    print(balance("(1 + 2)".toList))
    println()
    print(balance("((1 + 2)".toList))
    println()
    print(balance("(1 + 2))".toList))
    println()
    print(countChange(5, List(2, 3)))
    println()
    print(countChange(4, List(1, 2, 3)))
  }

  /**
    Pascal's Triangle
    1 
    1 1
    1 2 1
    1 3 3 1
    1 4 6 4 1
    1 5 10 10 5 1
    1 6 15 20 15 6 1
    1 7 21 35 35 21 7 1
    1 8 28 56 70 56 28 8 1
    1 9 36 84 126 126 84 36 9 1
    1 10 45 120 210 252 210 120 45 10 1
    true
    false
    true
    false
    false
    1
    4
  */

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == c) {
      return 1
    } else {
      return pascal(c, r-1) + pascal(c-1, r-1)
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balanceRecursive(chars: List[Char], bracketsCount: Int): Boolean = {
      if (chars.isEmpty) {
        return bracketsCount == 0
      }
      if (chars.head == '(') {
        return balanceRecursive(chars.tail, bracketsCount + 1)
      }
      if (chars.head == ')') {
        if (bracketsCount == 0) {
          return false
        } else {
          return balanceRecursive(chars.tail, bracketsCount - 1)
        }
      }
      return balanceRecursive(chars.tail, bracketsCount)
    }
    balanceRecursive(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0 || (coins.isEmpty && money > 0)) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    return countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
}
