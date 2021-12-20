package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(union(singletonSet(10), x => x < 5 && x > -5))
  printSet(diff(x => x > 5 && x < 15, x => x > 10))
  printSet(intersect(x => x > 0,  x => x < 5))
  printSet(filter(x => x < 5 && x > -5, x => x > 0))
  println(forall(x => x < 5 && x > -5, x => x < 5 && x > -5))
  println(exists(x => x < 5 && x > -5, x => x > 5))
  printSet(map(x => x < 5 && x > -5, x => 2*x))
}