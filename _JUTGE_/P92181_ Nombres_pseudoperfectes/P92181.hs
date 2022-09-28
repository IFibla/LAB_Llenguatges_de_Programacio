analyze :: Int -> Either Int Bool
analyze n = [x | x <- getDivisors n, sum x == n ]

isSemiPerfect :: [Int] -> Int -> (Bool, Int)
isSemiPerfect x n
    | x < n = (False, -1)
    | x == n = (True, length x)
    | otherwise = (False, -2)


getDivisors :: Int -> [Int]
getDivisors n = [x | x <- [1..n], mod n x == 0]