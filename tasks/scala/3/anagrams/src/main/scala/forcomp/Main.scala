package forcomp


object Main extends App {
  import Anagrams._
  println(sentenceAnagrams(List("olive", "oil")))
  println(sentenceAnagrams(List("I", "love", "you")))
}
/**
Program output:
List(List(i, oil, love), List(i, oil, love), List(i, love, oil), List(i, love, oil), List(oil, i, love), List(oil, love, i), List(oil, olive), List(oil, i, love), List(oil, love, i), List(oil, olive), List(love, i, oil), List(love, i, oil), List(love, oil, i), List(love, oil, i), List(olive, oil), List(olive, oil))
List(List(you, i, love), List(you, love, i), List(you, olive), List(i, you, love), List(i, love, you), List(love, you, i), List(love, i, you), List(olive, you))
*/