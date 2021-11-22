module Hamming (distance) where

import Data.Maybe

distance :: String -> String -> Maybe Int
distance xs ys = 
    if length xs /= length ys then Nothing
    else if null xs || null ys then Just 0
    else if head xs == head ys then distance (tail xs) (tail ys)
    else Just (sum . catMaybes $ [Just 1, distance (tail xs) (tail ys)])
