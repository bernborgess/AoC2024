--
--    author:  bernborgess
--    problem: two - AoC2024
--    created: 02.December.2024 14:42:07
--
import Lean.Data.HashMap

open IO List Std

def getLine : IO String := return (←(←getStdin).getLine).trim

def List.sort [LT α] [DecidableRel ((·<·) : α → α → Prop)] : List α → List α :=
  Array.toList ∘ flip Array.qsort (·<·) ∘ Array.mk

def List.sum [Add α] [OfNat α 0] : List α → α := foldl (·+·) 0

def List.sequence [Monad M] : List (M α) → M (List α) := List.mapM id

partial def readCols : IO ((List Int × List  Int)) := do
  let rec loop := do
    let nums := (←getLine).split Char.isWhitespace
                  |>.filter (· != "")
                  |>.map String.toInt?
                  |>.sequence
    if let some [x,y] := nums then
      let (l1,l2) ← loop
      return (x::l1,y::l2)
    return ([],[])
  loop

abbrev HM := HashMap Int Int

-- Iterate on list, update on hashmap
def tally' : List Int → HM
| [] => .empty
| x::xs =>
  let tr := tally' xs
  tr.insert x (tr.getD x 0 + 1)

-- Using State Monad
def tally : List Int → StateM HM Unit
| [] => return
| x::xs => do
  tally xs
  let tr ← get
  set <| tr.insert x (tr.getD x 0 + 1)

def main : IO Unit := do
  let (l1,l2) ← readCols
  -- let tl : HashMap Int Int := tally' l2
  let tl : HashMap Int Int := StateT.run  (tally l2) HashMap.empty |>.2
  println <| l1.map (λ x => x * tl.getD x 0) |>.sum
