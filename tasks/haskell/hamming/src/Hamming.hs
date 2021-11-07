module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = 
  if length xs /= length ys = just nothing
  else if null xs || null ys = just 0
  else Just (length (filter id (zipWith (/=) xs ys)))
