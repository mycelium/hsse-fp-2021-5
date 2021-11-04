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
    println()

    println("Balance")
    println(balance("".toList))
    println(balance("()".toList))
    println(balance("(7+2)".toList))
    println(balance("6+(3+1)*(2-9)".toList))
    println(balance("(5+3)))".toList))
    println(balance("(()".toList))
    println(balance("((()))".toList))

    println()
    println("Count Change")
    println(countChange(-9, List(1,2,3,4)))
    println(countChange(0, List(1,2,3,4)))
    println(countChange(4, List()))
    println(countChange(4, List(1,2,3,4)))
  }

  /**
   * Exercise 1
   * Функция, возвращающая значение элемента треугольника Паскаля
   * по номеру колонки и строки
   */
  def pascal(c: Int, r: Int): Int = {
    assert(r >= c && c >= 0)
    if (c == 0 || c == r) 1
    else
      pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   * Функция, подсчитывающая баланс скобок в выражении
   * (по открытым и закрытым скобкам)
   */
  def balance(chars: List[Char]): Boolean = {
    def count(chars: List[Char], counter: Int) : Boolean = {
      if (chars.isEmpty) counter == 0
      else chars.head match {
          case '(' => count(chars.tail, counter + 1)
          case ')' => count(chars.tail, counter - 1)
          case _ => count(chars.tail, counter)
        }
    }
    count(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   *
   * Функция, определяющая количество возможных вариантов размена суммы (money)
   * монетами номиналом (coins)
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def count(money: Int, coins: List[Int], sum: Int): Int = {
      if (coins.isEmpty || money <= 0 || sum > money) 0
      else if (money == sum) 1
      else count(money, coins, sum + coins.head) + count(money, coins.tail, sum)
    }
    count(money, coins, 0)
  }
}
