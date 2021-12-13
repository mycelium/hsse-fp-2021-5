module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance la lb = if length la == length lb then Just $ distanceBetween la lb else Nothing
distanceBetween :: String -> String -> Int
distanceBetween (x : xs) (y : ys) =
    case (distanceBetween xs ys) of
        -1 -> 0
        d -> ((if x == y then 0 else 1) + d)
distanceBetween [] [] = 0
distanceBetween [] _ = -1
distanceBetween _ [] = -1