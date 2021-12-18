module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if length xs /= length ys then Nothing
  else Just (sum[1 | p <- zip xs ys, fst p /= snd p])
