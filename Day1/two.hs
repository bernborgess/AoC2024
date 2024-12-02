--
--    author:  bernborgess
--    problem: one - AoC2024
--    created: 02.December.2024 08:20:15
--

import Data.List (sort, transpose)
import Data.Map qualified as M

tally :: [Int] -> M.Map Int Int
tally [] = M.empty
tally (x : xs) = case M.lookup x rm of
  Nothing -> M.insert 1 x rm
  (Just c) -> M.insert (c + 1) x rm
  where
    rm = tally xs

solve :: String -> String
solve input =
  let ws = map (map read . words) (lines input)
      [l1, l2] = map sort $ transpose ws
      mp = tally l2
      coef x = case M.lookup x mp of
        Nothing -> 0
        (Just c) -> x * c
      ans = sum $ map coef l1
   in show ans

main :: IO ()
main = interact solve
