divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], mod n x == 0]

nbDivisors :: Int -> Int
nbDivisors n = length $ divisors n

moltCompost :: Int -> Bool
moltCompost n = not $ or ([x | xs <- [1..n-1], x <- intToBool (nbDivisors xs) y])
    where y = nbDivisors n

intToBool :: Int -> Int -> [Bool]
intToBool n y
    | n >= y = [True]
    | otherwise = [False]