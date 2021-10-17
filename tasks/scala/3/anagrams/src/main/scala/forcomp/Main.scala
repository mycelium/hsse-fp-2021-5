package Main


object Main extends App {
  import Anagrams._
  println(sentenceAnagrams(List("hello", "world")))
  println(wordAnagrams("people"))
}
