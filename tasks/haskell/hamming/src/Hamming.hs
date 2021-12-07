module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = 
    if xs == [] && ys == [] then Just 0
    if head xs == head ys then distance (tail xs) (tail ys)

