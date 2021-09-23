module Hamming (distance) where

import Control.Monad (liftM2)

distance :: String -> String -> Maybe Int
distance xs ys 
    | length xs /= length ys = Nothing
    | xs == [] = Just 0
    | head xs /= head ys = liftM2 (+) (Just 1) (distance (tail xs) (tail ys))
    | otherwise = distance (tail xs) (tail ys)