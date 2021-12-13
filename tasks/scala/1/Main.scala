/**
Program output:
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
1
7
42
*/
object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(balance("(d+(w-x))".toList))
    println(balance("(d+(((s-x))".toList))
    println(balance("((()()))".toList))
    println(countChange(5, List(2,3)))
    println(countChange(5, List(1,2,3,4,5)))
    println(countChange(10, List(1,2,3,4,5,6,7,8,9,10)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if(c==0 || r==0 || r==c) {
      1
    } else {
      pascal(c, r-1) + pascal(c-1, r-1)
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count_recoursive(chars: List[Char], balance: Int): Boolean = {
      if(chars.isEmpty) {
        balance == 0
      } else if (chars.head == '(') {
        count_recoursive(chars.tail, balance +1)
      } else if (chars.head == ')') {
        count_recoursive(chars.tail, balance -1)
      } else {
        count_recoursive(chars.tail, balance)
      }
    }
    count_recoursive(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money <0 || coins.isEmpty) {
      0
    } else if (money == 0) {
      1
    } else {
      countChange(money, coins.tail) + countChange(money - coins.head, coins)
    }
  }
}
