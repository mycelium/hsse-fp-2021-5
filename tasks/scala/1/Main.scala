package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(balance("((x+y)+(x-y))".toList))
    println(balance("(x+(y-y)".toList))
    println(balance("()()()".toList))

    println(countChange(-1, List(1, 2, 3, 4)))
    println(countChange(0, List(1, 2, 3, 4)))
    println(countChange(5, List(2, 3)))
    println(countChange(4, List(1, 2, 2, 3)))
    println(countChange(5, List(3)))
    println(countChange(10, List(2, 3, 5, 5, 2, 3)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == c) 1
    else pascal(c, r - 1) + pascal(c - 1, r - 1)
  }

  def balance(expressionChars: List[Char]): Boolean = {
    def countBalance(chars: List[Char], parenthesesBalance: Int): Int = {
      if (chars.isEmpty || parenthesesBalance < 0) parenthesesBalance
      else if (chars.head == ')') countBalance(chars.tail, parenthesesBalance - 1)
      else if (chars.head == '(') countBalance(chars.tail, parenthesesBalance + 1)
      else countBalance(chars.tail, parenthesesBalance)
    }

    countBalance(expressionChars, 0) == 0
  }

  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0 && coins.isEmpty) 1
    else if (money < 0 || coins.isEmpty) 0
    else countChange(money - coins(0), coins.tail) + countChange(money, coins.tail)
  }
}

