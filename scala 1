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
   */
  
 object main{
def main(args: Array[String]) {
  for (row <- 0 to 10) {
  for (col <- 0 to row)
    print(pascal(col, row) + " ")
    println()
  }
}
def pascal(c: Int, r: Int): Int = {
  var o =c+1
  var p = r+1
  val count = (p*(p+1))/2
  var tmp = new Array[Int](count)
  for( y <- 1 to p){
    for(x <- 1 to p ) {
      if (x == 1 || y == 1 || y == x) {
        var num = (y * (y + 1)) / 2
        tmp(num - y + x - 1) = 1
      } 
      else {
        var x1 = x - 1
        var x2 = x
        var y1 = y - 1
        var num1 = (y * (y - 1)) / 2
        var num = (y * (y + 1)) / 2
        tmp(num - y + x-1) = tmp(num1 - y1 + x2-1) + tmp(num1 - y1 + x1-1)
        }
       }
      }
   tmp(count -p+o-1)
  }
}

  
  /**
   * Exercise 2 Parentheses Balancing
   */
   
   def balance(intchars:List[Char]):Boolean=
  {
    def IndexParth(chars:List[Char],ParthBalance:int):int=
    {
        if(chars.isEmpty||ParthBalance<0) 
        parthBalance
        else if(chars.begin == ')') 
        IndexParth(char.end,ParthBalance -1)
        else if(chars.begin =='(')
        IndexParth(char.end,ParthBalance +1)
        else
        IndexParth(char.end,ParthBalance)
    }
    IndexParth(intchars ,0) ==0
   }
                

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = 
                {
  def change(money：Int,coins:List[Int]):Int =
    {
        if (money < 0||coins.isEmpty) 0
        else if(money == 0) 1
        else change(money,coins.end)+change(money-coins.begin,coins)
     }
    change(money,coins)
  }
}
