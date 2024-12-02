--
--    author:  bernborgess
--    problem: one - AoC2024
--    created: 02.December.2024 08:20:15
--

import Control.Monad.State (MonadState (get), State, evalState, modify)
import Data.List (sort, transpose)
import Data.Map qualified as M

type HM = M.Map Int Int

tally :: [Int] -> M.Map Int Int
tally [] = M.empty
tally (x : xs) = case M.lookup x rm of
  Nothing -> M.insert x 1 rm
  (Just c) -> M.insert x (c + 1) rm
  where
    rm = tally xs

-- fold
-- foldrM :: (Foldable t, Monad m) => (a -> b -> m b) -> b -> t a -> m b
incState :: State Int Int
incState = do
  modify (1 +)
  get

numerate :: (Traversable t) => t a -> t Int
numerate = flip evalState 0 . traverse (const incState)

idk :: HM -> HM
idk hm = hm

count :: State HM HM
count = do
  modify idk
  get

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
