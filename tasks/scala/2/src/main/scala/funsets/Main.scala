package funsets

object Main extends App {
  import FunSets._
  def f(x : Int) : Int = x + 1
  val s = Set(1)
  val t = Set(3)
  val m = union(s, t)
  val st = map(m, f)
  printSet(st)
}
