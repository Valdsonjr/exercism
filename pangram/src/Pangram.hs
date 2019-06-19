module Pangram (isPangram) where

import           Data.Char (toLower)
import           Data.Set  (fromList, isSubsetOf, fromAscList)

--     Checks if the english alphabet is a subset of the input.
isPangram :: String -> Bool
isPangram = (alphabet `isSubsetOf`) . input -- O (n + m)
    where
        alphabet = fromAscList ['a' .. 'z'] -- O (m) (m = 26)
        input    = fromList . map toLower   -- O (n * log n)
