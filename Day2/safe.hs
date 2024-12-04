--
--    author:  bernborgess
--    problem: safe - AoC2024
--    created: 03.December.2024 21:43:00
--

ranged :: Int -> Int -> Bool
ranged x y = abs (x - y) `elem` [1 .. 3]

safe :: [Int] -> Bool
safe l@(h : t) =
  let pass f = and $ zipWith f l t
      up = pass (<)
      down = pass (>)
      comp = pass (\x y -> abs (x - y) `elem` [1 .. 3])
   in comp && (up || down)
safe _ = True

solve :: String -> String
solve input =
  let xxs :: [[Int]] = map read . words <$> lines input
      k :: Int = length $ filter safe xxs
   in show k ++ "\n"

main :: IO ()
main = interact solve
