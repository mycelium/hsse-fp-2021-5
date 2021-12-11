package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(union(Set(1,3,5), Set(2,4,6)))
  printSet(intersect(Set(1,2,3,4), Set(2,4)))
  printSet(diff(Set(1,2,3,4), Set(2,4)))
  printSet(filter(Set(1,2,4,5), (elem: Int) => elem > 3))
  println(exists(Set(1,2,4,5), (elem: Int) => elem == 2))
  println(exists(Set(1,4,5), (elem: Int) => elem == 2))
  var s = Set(1,2,3,4,5)
  printSet(map(s, (elem: Int) => elem * 5))
}

/**
 true
 {1,2,3,4,5,6}
 {2,4}
 {1,3}
 {4,5}
 true
 false
 {5,10,15,20,25}
*/