package Main


  object Main extends App {

    import forcomp._

    println(Anagrams.sentenceAnagrams(List("Yes", "man")))
    println(Anagrams.sentenceOccurrencesMap(List("Yes", "man")) == Anagrams.sentenceOccurrencesMap(List("Yms", "ean")))
  }

