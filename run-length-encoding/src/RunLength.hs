module RunLength (decode, encode) where

import           Data.Bool     (bool)
import           Data.Char     (isDigit)
import           Data.Function (on)
import           Data.List     (group, groupBy)


-- I couldn't think of a clean way to do this.

{-
    groupBy ((&&) `on` isDigit) -> groups adjacent digits
        since groupBy won't return empty strings I felt free to use head/tail
            without fear of crashing. (it can return [] but never [""])

    aux updates the expansion number or expands a given [char]

-}
decode :: String -> String
decode = snd . foldl aux (1, "") . groupBy ((&&) `on` isDigit)
    where 
        aux (num, str) list
            | isDigit (head list) = (read list, str)
            | otherwise           = (1, str ++ concat (replicate num list))


encode :: String -> String
encode = concatMap (aux <$> length <*> head) . group
    where
        aux n v = bool "" (show n) (n > 1) ++ [v]
