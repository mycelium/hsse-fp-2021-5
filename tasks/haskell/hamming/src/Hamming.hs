module Hamming (distance) where

import Data.Char

distance :: String -> String -> Maybe Int
distance xs ys =
    -- Проверка на то, что строки одинаковой длины, содержат только символы и символы в строке в верхнем регистре.
    if length xs == length ys  && all isLetter (xs ++ ys) && all isUpper  (xs ++ ys)
    then
          -- количество неравных элементов xs и ys
        Just ( length (filter (==True) (zipWith (/=) xs ys)) )
    else
        Nothing