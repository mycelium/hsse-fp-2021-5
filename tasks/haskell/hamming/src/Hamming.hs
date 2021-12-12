module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
    | length xs /= length ys  = Nothing
    | otherwise = distanceForCorrect xs ys 0

distanceForCorrect :: String -> String -> Int -> Maybe Int
distanceForCorrect [] [] counter = Just counter
distanceForCorrect  xs ys counter
    |(head xs /= head ys) = distanceForCorrect (tail xs) (tail ys) (counter+1)
    |otherwise = distanceForCorrect (tail xs) (tail ys) counter
