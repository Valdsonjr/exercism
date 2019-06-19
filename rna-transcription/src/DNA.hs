module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM rna
    where
        rna 'G' = Just 'C'
        rna 'C' = Just 'G'
        rna 'T' = Just 'A'
        rna 'A' = Just 'U'
        rna  _  = Nothing
