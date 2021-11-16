module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys | length xs /= length ys = Nothing
               | null xs && null ys = Just 0
               | head xs /= head ys = fmap (+1) tl
                              | otherwise = tl
    where tl = distance (tail xs) (tail ys)
