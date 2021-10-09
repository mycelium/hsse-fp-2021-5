module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if length xs == length ys then Just $ distanceEqLen xs ys else Nothing
distanceEqLen :: String -> String -> Int
distanceEqLen (x : xs) (y : ys) = (if x == y then 0 else 1) + distanceEqLen xs ys
distanceEqLen [] [] = 0