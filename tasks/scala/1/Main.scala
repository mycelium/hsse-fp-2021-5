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

    println("Balance parentheses")
    val test1: List[Char] = List('(', '(', '(', ')')
    println(balance(test1))

    val test2: List[Char] = List('(', '(', '(', ')', ')' , ')')
    println(balance(test2))

    val test3: List[Char] = List('(', '{', '}', ')')
    println(balance(test3))

    val test4: List[Char] = List('(', '[', '{', '}', ')')
    println(balance(test4))

    val test5: List[Char] = List('(', '[', '{', '}', ')', ']')
    println(balance(test5))

    println(countChange(100, List(1, 2, 5, 10, 50, 100)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r)) {
      1
    } else {
      pascal(c - 1, r - 1) + pascal(c, r - 1)
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count(char: Char) : Int = chars.count(c => c == char)
    def checkParentheses(right: Int, left: Int ) : Boolean = {
      if (right == left) {
        return true
      }
      false
    }
    if ((chars.contains('(') || chars.contains(')')) && checkParentheses(count('('), count(')'))) {
      balance(chars.filter(c => c != '(' && c != ')'))
    }

    if ((chars.contains('{') || chars.contains('}')) && checkParentheses(count('{'), count('}'))) {
      balance(chars.filter(c => c != '{' && c != '}'))
    }

    if ((chars.contains('[') || chars.contains(']')) && checkParentheses(count('['), count(']'))) {
      balance(chars.filter(c => c != '[' && c != ']'))
    }
    true
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    coins match {
      case Nil => 0
      case head::tail => countChange(money - head, coins) + countChange(money, tail)
    }
  }
}