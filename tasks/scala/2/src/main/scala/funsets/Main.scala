package funsets

object Main extends App {
  import FunSets._
  val s = Set(2, 5, 6, 9, 4)
  val t = Set(1, 2, 4, 11, 7)

  println(contains(singletonSet(1), 1))              // true
  printSet(union(s,t))                               // {1,2,4,5,6,7,9,11}
  printSet(intersect(s,t))                           // {2,4}
  printSet(diff(s,t))                                // {5,6,9}
  printSet(filter(s, t))                             // {2,4}
  println(exists(s, elem => elem > 0))               // true
  printSet(map(s, elem => elem * 2))                 // {4,8,10,12,18}
}
