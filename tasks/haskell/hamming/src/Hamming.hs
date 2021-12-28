module Hamming (distance) where
import Data.Char

distance :: String -> String -> Maybe Int
distance xs ys =
    if length xs == length ys  && all isLetter (xs ++ ys) && all isUpper  (xs ++ ys)
    then
        Just ( length (filter (==True) (zipWith (/=) xs ys)) )
    else
        Nothing