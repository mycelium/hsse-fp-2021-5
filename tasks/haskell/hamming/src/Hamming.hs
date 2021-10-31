module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = if length xs == length ys 
                 then Just (calculateDistance xs ys)
                 else Nothing

calculateDistance :: String -> String -> Int
calculateDistance (xh:xtail) (yh:ytail) = fromEnum(xh /= yh) + calculateDistance xtail ytail
calculateDistance _ _ = 0
