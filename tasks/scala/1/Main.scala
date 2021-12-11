object Main {
  def main(args: Array[String]): Unit = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Balance of brackets")
    println(balance("1 + 1".toList))
    println(balance(")1 + 1)".toList))
    println(balance("(1 + 1(".toList))
    println(balance(")1 + 1(".toList))
    println(balance("(1 + 1)".toList))
    println(balance("1 + 1)".toList))
    println(balance("(1 + 1".toList))
    println(balance("((1 + 1))".toList))
    println(balance("(1 + 1))".toList))
    println(balance("((1 + 1)".toList))
    println(balance("{1 + 1)".toList))
    println(balance("]1 + 1)".toList))
    println(balance("[1 + 1]".toList))
    println(balance("{1 + 1}".toList))
    println("Counting change")
    println(countChange(5, List()))
    println(countChange(2, List(5)))
    println(countChange(5, List(2, 3)))
    println(countChange(3, List(1, 2)))
    println(countChange(5, List(1, 2, 3)))
  }

  /**
   * Exercise 1
   Реализация с использованием биномиальных коэффициентов не прошла по памяти.
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
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
   */
  
  /**
   * Exercise 2 Parentheses Balancing
   */
  def calculOfDelta(chars: List[Char], open: Char, close: Char, delta: Int): Int = {
    if (chars.isEmpty) delta
    else if (chars.head == open) calculOfDelta(chars.tail, open, close, delta + 1)
    else if (chars.head == close) {
      if (delta > 0) calculOfDelta(chars.tail, open, close, delta - 1)
      else -1
    }
    else calculOfDelta(chars.tail, open, close, delta)
  }

  def balance(chars: List[Char]): Boolean = {
    calculOfDelta(chars, '(', ')', 0) == 0 
    && calculOfDelta(chars, '[', ']', 0) == 0
    && calculOfDelta(chars, '{', '}', 0) == 0
  }

  /**
     Balance of brackets
     true
     false
     false
     false
     true
     false
     false
     true
     false
     false
     false
     false
     true
     true
   */
  
  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (coins.isEmpty && money > 0) 0
    else if (money == 0) 1
    else if (money > 0) countChange(money - coins.head, coins) + countChange(money, coins.tail)
    else 0
  }

  /**
     Counting change
     0
     0
     1
     2
     5
   */
}
