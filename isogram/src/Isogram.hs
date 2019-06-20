module Isogram (isIsogram) where

import           Data.Char (isLetter, toLower)
import           Data.List (group, sort)

isIsogram :: String -> Bool
isIsogram = all (null . drop 1) . group . sort . map toLower . filter isLetter
