package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(map(union(x => x == 5, y=> y == 6), z => z + 3))
  /*
  [info] true
  [info] {8,9}
  */
}
