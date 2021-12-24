module Main where

import Hamming

main :: IO ()
main = putStrLn (show (distance "AAFF" "ABFY"))