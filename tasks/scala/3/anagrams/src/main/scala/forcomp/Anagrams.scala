package forcomp

import scala.language.postfixOps
import common._

object Anagrams {

  /** A word is simply a `String`. */
  type Word = String

  /** A sentence is a `List` of words. */
  type Sentence = List[Word]

  /** `Occurrences` is a `List` of pairs of characters and positive integers saying
   *  how often the character appears.
   *  This list is sorted alphabetically w.r.t. to the character in each pair.
   *  All characters in the occurrence list are lowercase.
   *  
   *  Any list of pairs of lowercase characters and their frequency which is not sorted
   *  is **not** an occurrence list.
   *  
   *  Note: If the frequency of some character is zero, then that character should not be
   *  in the list.
   */

  type Occurrences = List[(Char, Int)]

  type OccurrencesMap = Map[Char, Int]

  def getOccurrencesList(map: OccurrencesMap): Occurrences = map.toList.sortBy(_._1)

  /** The dictionary is simply a sequence of words.
   *  It is predefined and obtained as a sequence using the utility method `loadDictionary`.
   */
  val dictionary: List[Word] = loadDictionary

  /** Converts the word into its character occurence list.
   *
   *  Note: the uppercase and lowercase version of the character are treated as the
   *  same character, and are represented as a lowercase character in the occurrence list.
   */
  def customGet(map: OccurrencesMap, ch: Char): Int = if (map.contains(ch)) map(ch) else 0

  def wordOccurrencesMap(w: Word): OccurrencesMap = {
    def inner (w: List[Char], occ: OccurrencesMap): OccurrencesMap = w match {
      case ch :: tail => inner(tail, occ + (ch -> customGet(occ, ch).+(1))) // why 'occ(ch) + 1' not work ??
      case Nil => occ
    }
    inner(w.filter(_.isLetter).toLowerCase.toList, Map[Char, Int]())
  }

  def wordOccurrences(w: Word): Occurrences = wordOccurrencesMap(w).toList.sortBy(_._1)

  def mergeMaps(map1: OccurrencesMap, map2: OccurrencesMap): OccurrencesMap = (map1.keySet ++ map2.keySet) map { key => key -> customGet(map1, key).+(customGet(map2, key)) } toMap

  /** Converts a sentence into its character occurrence list. */
  def sentenceOccurrencesMap(s: Sentence): OccurrencesMap = {
    def inner (s: Sentence, map: OccurrencesMap): OccurrencesMap = s match {
      case word :: tail => inner(tail, mergeMaps(map, wordOccurrencesMap(word)))
      case Nil => map
    }
    inner(s, Map[Char, Int]())
  }

  def sentenceOccurrences(s: Sentence): Occurrences = sentenceOccurrencesMap(s).toList.sortBy(_._1)


  /** The `dictionaryByOccurrences` is a `Map` from different occurrences to a sequence of all
   *  the words that have that occurrence count.
   *  This map serves as an easy way to obtain all the anagrams of a word given its occurrence list.
   *
   *  For example, the word "eat" has the following character occurrence list:
   *
   *     `List(('a', 1), ('e', 1), ('t', 1))`
   *
   *  Incidentally, so do the words "ate" and "tea".
   *
   *  This means that the `dictionaryByOccurrences` map will contain an entry:
   *
   *    List(('a', 1), ('e', 1), ('t', 1)) -> Seq("ate", "eat", "tea")
   *
   */
  lazy val dictionaryByOccurrences: Map[Occurrences, List[Word]] = { for (word <- dictionary) yield (wordOccurrences(word), word) } groupBy(_._1) map { case (key, value) => (key, value.map(_._2)) }

  /** Returns all the anagrams of a given word. */
  def wordAnagrams(word: Word): List[Word] = dictionaryByOccurrences(wordOccurrences(word))

  /** Returns the list of all subsets of the occurrence list.
   *  This includes the occurrence itself, i.e. `List(('k', 1), ('o', 1))`
   *  is a subset of `List(('k', 1), ('o', 1))`.
   *  It also include the empty subset `List()`.
   * 
   *  Example: the subsets of the occurrence list `List(('a', 2), ('b', 2))` are:
   *
   *    List(
   *      List(),
   *      List(('a', 1)),
   *      List(('a', 2)),
   *      List(('b', 1)),
   *      List(('a', 1), ('b', 1)),
   *      List(('a', 2), ('b', 1)),
   *      List(('b', 2)),
   *      List(('a', 1), ('b', 2)),
   *      List(('a', 2), ('b', 2))
   *    )
   *
   *  Note that the order of the occurrence list subsets does not matter -- the subsets
   *  in the example above could have been displayed in some other order.
   */
  def combinationsSet(occurrences: Occurrences): Set[Occurrences] = {
    def inner (occurrences: Occurrences, occurrencesSet: Set[OccurrencesMap]): Set[OccurrencesMap] = occurrences match {
      case Nil => occurrencesSet
      case (ch, n) :: tail if n == 0 => inner(tail, occurrencesSet)
      case (ch, n) :: tail => inner((ch, n - 1) :: tail, { for (occMap <- occurrencesSet) yield mergeMaps(occMap, Map[Char, Int]((ch, 1))) } ++ occurrencesSet)
    }
    { for (occurrences <- inner(occurrences, Set[OccurrencesMap](Map[Char, Int]()))) yield getOccurrencesList(occurrences) }
  }

  def combinations(occurrences: Occurrences): List[Occurrences] = combinationsSet(occurrences).toList

  /** Subtracts occurrence list `y` from occurrence list `x`.
   * 
   *  The precondition is that the occurrence list `y` is a subset of
   *  the occurrence list `x` -- any character appearing in `y` must
   *  appear in `x`, and its frequency in `y` must be smaller or equal
   *  than its frequency in `x`.
   *
   *  Note: the resulting value is an occurrence - meaning it is sorted
   *  and has no zero-entries.
   */

  def subtract(x: Occurrences, y: Occurrences): Occurrences = y match {
    case Nil => x
    case (ch, n) :: tail => {
      val elemInX = x.indexWhere(_._1 == ch)
      if (x(elemInX)._2 > n) subtract(x.updated(elemInX, (x(elemInX)._1, x(elemInX)._2 - n)), tail)
      else subtract(x.filter(_._1 != ch), tail)
    }
  }

  /** Returns a list of all anagram sentences of the given sentence.
   *  
   *  An anagram of a sentence is formed by taking the occurrences of all the characters of
   *  all the words in the sentence, and producing all possible combinations of words with those characters,
   *  such that the words have to be from the dictionary.
   *
   *  The number of words in the sentence and its anagrams does not have to correspond.
   *  For example, the sentence `List("I", "love", "you")` is an anagram of the sentence `List("You", "olive")`.
   *
   *  Also, two sentences with the same words but in a different order are considered two different anagrams.
   *  For example, sentences `List("You", "olive")` and `List("olive", "you")` are different anagrams of
   *  `List("I", "love", "you")`.
   *  
   *  Here is a full example of a sentence `List("Yes", "man")` and its anagrams for our dictionary:
   *
   *    List(
   *      List(en, as, my),
   *      List(en, my, as),
   *      List(man, yes),
   *      List(men, say),
   *      List(as, en, my),
   *      List(as, my, en),
   *      List(sane, my),
   *      List(Sean, my),
   *      List(my, en, as),
   *      List(my, as, en),
   *      List(my, sane),
   *      List(my, Sean),
   *      List(say, men),
   *      List(yes, man)
   *    )
   *
   *  The different sentences do not have to be output in the order shown above - any order is fine as long as
   *  all the anagrams are there. Every returned word has to exist in the dictionary.
   *  
   *  Note: in case that the words of the sentence are in the dictionary, then the sentence is the anagram of itself,
   *  so it has to be returned in this list.
   *
   *  Note: There is only one anagram of an empty sentence.
   */
  def addToAllElemInSet(varSet: Set[List[OccurrencesMap]], newElem: OccurrencesMap): Set[List[OccurrencesMap]] = { for (sentence <- varSet) yield sentence.appended(newElem) }

  def allCombinations(sentSet: List[Sentence], wordList: List[Word]): List[Sentence] = sentSet match {
    case Nil => { for (word <- wordList) yield List(word) }
    case _ => { for (sentence <- sentSet; word <- wordList) yield sentence.appended(word) }
  }

  def mapListToSentenceList(inputList: List[OccurrencesMap], outputList: List[Sentence]): List[Sentence] = inputList match {
    case map :: tail => mapListToSentenceList(tail, allCombinations(outputList, dictionaryByOccurrences(map.toList.sortBy(_._1))))
    case Nil => outputList
  }

  def sentenceAnagrams(sentence: Sentence): List[Sentence] = {
    def inner(occurrencesList: List[Occurrences], occurrences: Occurrences, varSet: Set[List[OccurrencesMap]]): Set[List[OccurrencesMap]] = occurrencesList match {
      case Nil => varSet
      case occ :: tail if dictionaryByOccurrences.contains(occ) => {
        val newOccurrences = subtract(occurrences, occ)
        inner(combinations(newOccurrences), newOccurrences, addToAllElemInSet(varSet, occ.toMap)) ++ inner(tail, occurrences, varSet)
      }
      case occ :: tail => inner(tail, occurrences, varSet)
    }
    // find all variants of sentences represented in lists of OccurrencesMap
    val varSet = { for (sent <- inner(combinations(sentenceOccurrences(sentence)), sentenceOccurrences(sentence), Set(List())) if sent.foldLeft(Map[Char, Int]())(mergeMaps(_, _)) == sentenceOccurrencesMap(sentence)) yield sent }
    // List[OccurrencesMap] -> List[Sentence]
    val resultSet = { for (sent <- varSet) yield mapListToSentenceList(sent, List()) }
      resultSet.toList.foldLeft(List[Sentence]())(_ ::: _)
    }
}
