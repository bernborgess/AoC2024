--
--    author:  bernborgess
--    problem: one - AoC2024
--    created: 02.December.2024 08:55:59
--

open IO List

def getLine : IO String :=
  return (←(←getStdin).getLine).trim

def sort [LT α] [DecidableRel ((·<·) : α → α → Prop)] : List α → List α :=
  Array.toList ∘ flip Array.qsort (·<·) ∘ Array.mk

def getList : IO (List Int) :=
  return sort <| (←getLine).split Char.isWhitespace |>.map String.toInt!

def sum [Add α] [OfNat α 0] : List α → α := foldl (·+·) 0

def main : IO Unit := do
  let l₁ ← getList
  let l₂ ← getList
  print <| sum <| zipWith (·-·|>.natAbs) l₁ l₂
