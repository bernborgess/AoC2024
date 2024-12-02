--
--    author:  bernborgess
--    problem: one - AoC2024
--    created: 02.December.2024 08:20:15
--

import Data.List (sort)

getList :: IO [Int]
getList = sort . map read . words <$> getLine

main :: IO ()
main = do
  l1 <- getList
  l2 <- getList
  print $ sum $ map abs $ zipWith (-) l1 l2