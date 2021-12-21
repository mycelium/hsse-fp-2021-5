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
  def pascal(c: Int, r: Int): Int = 
  {
      if(c<0||r<0)
    {
    throw new IllegalArgumentException("c and r must be greater than 0. ")
    }
    else if(c>r)
    {
    throw new IllegalArgumentException("r must be greather than c.")
    }
    if(c==0 || c ==r) 1
    else
    {
    pascal(c-1,r-1)+pascal(c,r-1)
    }
  }
  

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(voicechars:List[Char]):Boolean=
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
    IndexParth(voicechars ,0) ==0
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
