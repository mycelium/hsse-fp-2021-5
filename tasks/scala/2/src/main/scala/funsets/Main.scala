package funsets

object Main extends App {
  import FunSets._

  val s = Set(1,2,3,4)
  val t = Set(7,6,5,4,3)

  println(contains(singletonSet(1), 1))
  printSet(union(s,t))
  printSet(intersect(s,t))
  printSet(diff(s,t))
  printSet(filter(s, elem => elem < 3))
  println(exists(s, elem => elem < 3))
  printSet(map(t, elem => elem * 2))
}
