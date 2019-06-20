module School (School, add, empty, grade, sorted) where

import           Data.List       (insert)
import qualified Data.Map.Strict as M

-- we could do this with just [(Int, [String])]
-- but i'm feeling lazy
type School = M.Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student = M.insertWith (insert . head) gradeNum [student]

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade = M.findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = M.toAscList
