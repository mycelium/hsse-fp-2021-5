module Hamming (distance) where

import Data.Char

distance :: String -> String -> Maybe Int
distance xs ys =
    --  строки одинаковой длины, содержат только символы и символы в строке в верхнем регистре.
    if length xs == length ys  && all isLetter (xs ++ ys) && all isUpper  (xs ++ ys)
    then
		  --  сравниваем символы на неравенство и фильтруем значения только для True, считаем их кол-во
        Just ( length (filter (==True) (zipWith (/=) xs ys)) )
    else
        Nothing
