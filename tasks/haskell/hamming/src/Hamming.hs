module Hamming (distance) where

import Data.List

distance :: String -> String -> Maybe Int
distance xs ys
    | length xs /= length ys = Nothing
    | otherwise = Just (length (filter id (zipWith (/=) xs ys)))
-- zipWith (/=) xs ys -> convert two strings to list of bools where non-equal are true
-- filter id -> get only True values
-- length -> take length of True's list