--
--    author:  bernborgess
--    problem: tolerate - AoC2024
--    created: 03.December.2024 21:43:00
--

tol :: (Int -> Int -> Int) -> Int -> [Int] -> Bool
tol f t (x : y : xs) = safe || t > 0 && skip
  where
    safe = f x y `elem` [1 .. 3] && tol f t (y : xs)
    skip = tol f (t - 1) (x : xs)
tol _ _ _ = True

-- It may be needed to eliminate the first element
tolerate :: [Int] -> Bool
tolerate (x : xs) = or $ do
  f <- [(-), flip (-)]
  (t, ys) <- [(1, x : xs), (0, xs)]
  return $ tol f t ys
tolerate _ = True

solve :: String -> String
solve input =
  let xxs :: [[Int]] = map read . words <$> lines input
      k :: Int = length $ filter tolerate xxs
   in show k ++ "\n"

main :: IO ()
main = interact solve
