package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  println(contains(singletonSet(2), 1))
  printSet(union(singletonSet(2), singletonSet(3)))
  printSet(union(union(singletonSet(1), singletonSet(2)), union(singletonSet(2), singletonSet(3))))
  printSet(intersect(union(singletonSet(1), singletonSet(2)), union(singletonSet(2), singletonSet(3))))
  printSet(diff(union(singletonSet(1), singletonSet(2)), union(singletonSet(2), singletonSet(3))))
}