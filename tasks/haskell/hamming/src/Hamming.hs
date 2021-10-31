module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance _ [] = Just 0
distance [] _ = Just 0
distance xs ys =
  if length xs /= length ys
    then Nothing
    else Just (hamming xs ys)

hamming :: String -> String -> Int
hamming [] [] = 0
hamming (x : xs) (y : ys) =
  if x == y
    then hamming xs ys
    else 1 + hamming xs ys
