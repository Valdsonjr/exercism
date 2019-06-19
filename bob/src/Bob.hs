module Bob (responseFor) where

import Data.Char (isLetter, isSpace, isLower)

responseFor :: String -> String
responseFor xs
{- This ordering is important:
    
    'isNothing' must come before 'isAsking' because of the null case
        (otherwise 'isAsking' may crash because of 'last').
    
    'isYelling' must come before 'isAsking' because "ARE YOU OUT OF YOUR MIND?"
    is supposed to be yelling instead of asking.
-}
    | isNothing xs = "Fine. Be that way!"
    | isYelling xs = "Whoa, chill out!"
    | isAsking  xs = "Sure."
    | otherwise    = "Whatever."
    where
        -- removes any Unicode space character, 
        -- and the control characters \t, \n, \r, \f, \v.
        removeWS = filter (not . isSpace)

        -- isYelling is true if there are letters 
        -- and every letter is uppercased.
        isYelling = (&&) <$> any isLetter <*> not . any isLower

        -- isNothing is true if there are no letters, numbers or punctuation.
        isNothing = null . removeWS

        -- isAsking is true if the last non-space character is a '?'.
        isAsking = (== '?') . last . removeWS
