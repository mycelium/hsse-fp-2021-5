package funsets

object Main extends App {
  import FunSets._
  val s = Set(1, 2, 3, 42, 78)
  val t = Set(1, 2, 6, 9, 14)

  println(contains(singletonSet(1), 1))
  printSet(union(s,t))
  printSet(intersect(s,t))
  printSet(diff(s,t))
  printSet(filter(s, t))
  println(exists(t, elem => elem > 5))
  printSet(map(s, elem => elem + 3))
}
