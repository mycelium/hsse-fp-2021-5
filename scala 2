package funsets
import funsets.Funsets.toString

object Main extends App {
  import FunSets._
  
  val setA= union(singtonSet(1),union(singtonSet(2),singtonSet(3)))
  val setB= union(singtonSet(4),union(singtonSet(5),singtonSet(6)))
  val unionC = union(setA,setB)
  val intersectC= intersect(setA,setB)
  val diffC =diff(setA,setB)
  val filterC=filter(setA,x=>x%2 !=0)
  val existsC= exists(setA,x=>x%2 == 0)
  val mapC= map(setA,x=>x*x)
  
  println(s"A:${FunSets.toString(setA)}")
  println(s"B:${FunSets.toString(setB)}")
  println(s"union:${FunSets.toString(unionC)}")
  println(s"intersection:${FunSets.toString(intersectC)}")
  println(s"difference:${FunSets.toString(diffC)}")
  println(s"filtered:${FunSets.toString(filterC)}")
  println(s"existed:${FunSets.toString(existsC)}")
  println(s"map squared:${FunSets.toString(mapC)}")
}
