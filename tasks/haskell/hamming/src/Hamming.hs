module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = inner xs ys 0

inner :: String -> String -> Int -> Maybe Int
inner [] [] n = Just n
inner xs [] n = Nothing
inner [] ys n = Nothing
inner (x:xs) (y:ys) n
    | (x /= y) = inner xs ys (n + 1)
    | otherwise = inner xs ys n
