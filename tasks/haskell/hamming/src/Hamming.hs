module Hamming (distance) where

import Control.Monad

distance :: String -> String -> Maybe Int
distance xs ys = 
    if xs == [] && ys == [] then Just 0
    else if length xs /= length ys then Nothing
    else if head xs == head ys then distance (tail xs) (tail ys)
    else fmap(+1) (distance (tail xs) (tail ys))