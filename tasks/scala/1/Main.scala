import scala.collection.IterableOnce.iterableOnceExtensionMethods
import scala.collection.mutable.ListBuffer


object Main {
  def main(args: Array[String]) {
    /**
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    */

      /**
    val test_lists = List[List[Char]](
      List('(', 'F', ')'),
      List('(', ')', ')'),
      List('(', ')', '(', '(', ')', '(', ')', ')'),
      List(')', ')', '(', '(', ')', '(', ')', '('),
    )
    for (chars <- test_lists){
      println(chars)
      if (balance(chars)) println("Balanced") else println("Unbalanced")
    }
    */


    /**
     * Task 3. COINS
     */
    println(countChange(5, List[Int](2, 3))) //2 ways to give change: (2, 3) and (3, 2)
    println(countChange(5, List[Int](1)))
    println(countChange(4, List[Int](2)))
  }


  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0) 1
    else if (r == 0) 1
    else if (r == c) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */

  def balance(chars: List[Char]): Boolean = {

    val char_buf = ListBuffer[Char]()
    for (char <- chars) {
      if ((char == ')') | (char == '(')) char_buf.append(char)
    }
    val clear_chars = char_buf.toList
    // so we built list of only brackets

    def recursive_checker(chars: List[Char], counter: Int): Boolean = {
      if (counter < 0) return false
      if (chars.isEmpty){
        if (counter == 0) return true
        else return false
      }
      if (chars.head == '(') recursive_checker(chars.tail, counter + 1)
      else recursive_checker(chars.tail, counter - 1)
    }

    recursive_checker(clear_chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomination
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    //println(s"money: $money ; coins $coins")
    if (money == 0) return 1
    else if (money < 0) return 0
    else return coins.map(x => money - x).map(countChange(_, coins)).sum
  }
}
