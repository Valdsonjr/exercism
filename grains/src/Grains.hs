module Grains (square, total) where

square :: Integer -> Maybe Integer
square n = if 0 < n && n < 65 then Just $ 2 ^ (n - 1) else Nothing

total :: Integer
total = 2 ^ 64 - 1
