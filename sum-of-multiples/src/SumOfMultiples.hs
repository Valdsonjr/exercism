module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = foldr aux 0 [1 .. limit - 1]
    where
        aux n acc = if any ((== 0) . mod n) factors
                then n + acc
                else acc
