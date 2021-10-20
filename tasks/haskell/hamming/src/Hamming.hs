module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if length xs /= length ys then Nothing else Just (recCalculate xs ys)

recCalculate :: String -> String -> Int
recCalculate (char1:[]) (char2:[]) = if char1 /= char2 then 1 else 0
recCalculate (h1:t1) (h2:t2) = recCalculate [h1] [h2] + recCalculate t1 t2
recCalculate [] [] = 0
