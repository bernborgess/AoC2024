--
--    author:  bernborgess
--    problem: one - AoC2024
--    created: 02.December.2024 08:20:15
--

import Data.List (sort, transpose)

solve :: String -> String
solve input =
  let ws = map (map read . words) (lines input)
      [l1, l2] = map sort $ transpose ws
      ans = sum $ map abs $ zipWith (-) l1 l2
   in show ans

main :: IO ()
main = interact solve
