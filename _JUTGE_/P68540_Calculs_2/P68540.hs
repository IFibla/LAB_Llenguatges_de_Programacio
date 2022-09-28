diffSqrs :: Integer -> Integer
diffSqrs n = (getSqrSum n) - (getSumSqr n)

getSqrSum :: Integer -> Integer
getSqrSum n = (foldl (+) 0 [x | x <- [0..n]]) ^ 2

getSumSqr :: Integer -> Integer
getSumSqr n = (foldl (+) 0 (map (^2) [x | x <- [0..n]]))

 
pythagoreanTriplets :: Int -> [(Int, Int, Int)]
pythagoreanTriplets n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], 
                        ((x^2) + (y^2) == (z^2)), ((x + y + z) == n),
                        x <= y, y <= z]

tartaglia :: [[Integer]]
tartaglia = iterate next [1]
    where next xs = zipWith (+) ([0] ++ xs) (xs ++ [0])

sumDigits :: Integer -> Integer
sumDigits n = foldl (+) 0 (digits n)

digits :: Integer -> [Integer]
digits n
  | n < 10 = [n]
  | otherwise = digits (div n 10) ++ [mod n 10]

digitalRoot :: Integer -> Integer
digitalRoot n = 1 + mod ( n - 1 ) 9  