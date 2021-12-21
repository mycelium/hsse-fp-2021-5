module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] []=Ham 0
distance(x:xs)(y:ys)= if length xs/=length ys then
Nothing else Ham(counter (x:xs) (y:ys))
                          where counter [] [] =0
                                counter(x:xs) (y:ys)= if x/= y then(+) 1 ((counter) xs ys)
                                else (counter) xs ys
