import Text.Regex.Posix

get :: AllTextMatches [] String -> [] String
get = getAllTextMatches

solve :: String -> String
solve input =
  let toks = get $ input =~ "mul\\([0-9]{1,3},[0-9]{1,3}\\)"
      sns = map (\tok -> get $ tok =~ "[0-9]+") toks
   in show $ sum $ map (product . map read) sns

main = interact solve
