module Hamming (distance) where

import Data.Char

distance :: String -> String -> Maybe Int
distance xs ys =
    -- Проверка на то, что строки одинаковой длины, содержат только символы и символы в строке в верхнем регистре.
    if length xs == length ys  && all isLetter (xs ++ ys) && all isUpper  (xs ++ ys)
    then
		  -- С помощью zipWith сравниваем символы на неравенство.
		  -- --  ПРИМЕР: zipWith (/=) "ABC" "ABB" [False,False,True] -- -- 
          -- После фильтруем значения только для True и считаем количество полученных True
        Just ( length (filter (==True) (zipWith (/=) xs ys)) )
    else
        Nothing