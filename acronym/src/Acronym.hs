module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper, isPunctuation)

abbreviate :: String -> String
abbreviate = concatMap camelCase . words . hyphenated
    where
        camelCase (h:t) = toUpper h : filter isUpper t
        hyphenated = map (\x -> if isPunctuation x then ' ' else x)
