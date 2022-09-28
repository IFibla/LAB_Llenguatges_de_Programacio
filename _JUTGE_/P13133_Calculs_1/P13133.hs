sumMultiples35 :: Integer -> Integer
sumMultiples35 n = foldl (+) 0 [x | x <- [0..n-1], (mod x 3 == 0 || mod x 5 == 0)]

fibonacci :: Int -> Integer
fibonacci n = snd $ fastfibonacci (0, 1) (n-1)

fastfibonacci :: (Integer, Integer) -> Int -> (Integer, Integer)
fastfibonacci (a, b) 0 = (a, b)
fastfibonacci (a, b) n = fastfibonacci (b, a+b) (n-1)

sumEvenFibonaccis :: Integer -> Integer
sumEvenFibonaccis n = foldl (+) 0 [x | x <- (fibonacciList (0, 1) n), mod x 2 == 0]

fibonacciList :: (Integer, Integer) -> Integer -> [Integer]
fibonacciList (a, b) n 
    | n < b = []
    | otherwise = [b] ++ fibonacciList (b, a+b) n

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = last $ primes n

primes :: Int -> [Int]
primes n = [x | x <- [1..n], isPrime x, mod n x == 0]

isPalindromic :: Integer -> Bool
isPalindromic n = n1 == n2 
    where
        n1 = take m $ show n
        n2 = take m $ reverse $ show n
        m = div (digits n) 2

digits :: Integer -> Int
digits n
  | n < 10 = 1
  | otherwise = 1 + digits (div n 10)

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime x = not (hasDivisors x 2)

hasDivisors :: Int -> Int -> Bool
hasDivisors x n
    | n*n > x = False
    | mod x n == 0 = True
    | otherwise = hasDivisors x (n+1)
