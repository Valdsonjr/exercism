module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
          | otherwise = Just . fromIntegral . length . takeWhile (/= 1) $ iterate aux n
    where
    aux x | even x = x `div` 2
          | otherwise = (3 * x) + 1
