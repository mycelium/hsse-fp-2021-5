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
   * функция возвращающая значение элемента треугольника Паскаля по номеру колонки и строки
   */
  def pascal(c: Int, r: Int): Int = {
    assert(c >= 0 && r >= 0)
    (c, r) match {
      case (_, 0) =>
        1
      case (c, r) if c == 0 || c == r =>
        1
      case (c, r) if c < r =>
        pascal(c - 1, r - 1) + pascal(c, r - 1)
      case _ =>
        throw new IllegalStateException("Invalid state")
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   * функция, подсчитывающая баланс скобок в выражении (по открытым и закрытым скобкам)
   */
  def balance(chars: List[Char]): Boolean = {
    def countParentheses(chars: List[Char], acc: Int = 0): Boolean = {
      chars.headOption match {
        case None => acc == 0
        case Some('(') => countParentheses(chars.tail, acc + 1)
        case Some(')') => countParentheses(chars.tail, acc - 1)
        case _ => countParentheses(chars.tail, acc)
      }
    }

    countParentheses(chars)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.

   * функция, определяющая количество возможных вариантов размена суммы (money) монетами номиналом (coins)
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def countCombinations(money: Int, coins: List[Int], currentSum: Int = 0): Int = {
      assert(money > 0)
      if (money == currentSum) 1
      else if (currentSum > money || coins.isEmpty) 0
      else countCombinations(money, coins, currentSum + coins.head) + countCombinations(money, coins.tail, currentSum)
    }

    countCombinations(money, coins)
  }
}
