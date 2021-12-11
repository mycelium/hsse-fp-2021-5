package funsets

import funsets.FunSets.toString

object Main extends App {

  import FunSets._

  val setA = union(singletonSet(1), union(singletonSet(2), singletonSet(3)))
  val setB = union(singletonSet(3), union(singletonSet(4), singletonSet(5)))
  val unionAB = union(setA, setB)
  val intersectionAB = intersect(setA, setB)
  val differenceAB = diff(setA, setB)
  val filteredOdd = filter(setA, x => x % 2 != 0)
  val setAContainsEven = exists(setA, x => x % 2 == 0)
  val setASquared = map(setA, x => x * x)

  println(s"A: ${FunSets.toString(setA)}")
  println(s"B: ${FunSets.toString(setB)}")
  println(s"union: ${FunSets.toString(unionAB)}")
  println(s"intersection: ${FunSets.toString(intersectionAB)}")
  println(s"difference: ${FunSets.toString(differenceAB)}")
  println(s"filtered odd: ${FunSets.toString(filteredOdd)}")
  println(s"A contains even: ${setAContainsEven}")
  println(s"map squared: ${FunSets.toString(setASquared)}")
}
