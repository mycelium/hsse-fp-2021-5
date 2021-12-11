module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance (x:xs) (y:ys) = if length xs /= length ys then Nothing else Just (helper (x:xs) (y:ys))
                         where helper [] [] = 0
                               helper (x:xs) (y:ys) = if x /= y then (+) 1 ((helper) xs ys) else (helper) xs ys