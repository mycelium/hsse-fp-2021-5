package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(union(singletonSet(1),singletonSet(2)))
  printSet(intersect(union(singletonSet(1),singletonSet(2)),union(singletonSet(2),singletonSet(3))))
  printSet(diff(union(singletonSet(1),singletonSet(2)),singletonSet(1)))
  printSet(filter(union(singletonSet(1),singletonSet(2)),singletonSet(1)))

  //output
  /*
  sbt:funsets> run
  [info] running (fork) funsets.Main 
  [info] true
  [info] {1,2}
  [info] {2}
  [info] {2}
  [info] {1}
  */
}
