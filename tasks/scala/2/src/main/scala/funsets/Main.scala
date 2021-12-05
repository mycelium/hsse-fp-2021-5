package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  
  printSet(union(x => x >= 0 && x <= 6, x => x >= 0 && x <= 3))
  printSet(intersect(x => x >= -6 && x <= 6, x => x >= 0 && x <= 3))
  printSet(diff(x => x >= -6 && x <= 6, x => x >= 0 && x <= 6))
  printSet(filter(x => x > 0 && x <= 6, x => x % 2 != 0))
  
  println(forall(x => x > -1 && x <= 6, x => x > 0))
  println(forall(x => x > 0 && x <= 6, x => x > 0))

  println(exists(x => x > -1 && x <= 6, x => x > 0))
  println(exists(x => x > -1 && x <= 0, x => x > 0))

  printSet(map(x => x >= 0 && x <= 6, x => x * x))
}
