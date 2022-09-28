myLength :: [Int] -> Int
myLength n = length(n)

myMaximum :: [Int] -> Int
myMaximum [n] = n
myMaximum (x:xs)
	| x > m = x
	| otherwise = m
	where m = myMaximum xs
	
sumLen :: [Int] -> (Int, Int)
sumLen [] = (0, 0)
sumLen(x:xs) = (x+m, 1+n)
	where y = sumLen xs
	      m = fst y
	      n = snd y 

intToFloat :: Int -> Float
intToFloat n = fromInteger ( toInteger n )

average :: [Int] -> Float
average x = intToFloat ( m ) / intToFloat ( n )
 	where y = sumLen x
              m = fst y
              n = snd y

buildPalindrome :: [Int] -> [Int]
buildPalindrome x = ( reverse x ) ++ x

esDins :: [Int] -> Int -> Bool
esDins [] x = False
esDins (y:ys) x
	| y == x = True
	| otherwise = esDins ys x

remove :: [Int] -> [Int] -> [Int]
remove [] [] = []
remove [] y = []
remove x [] = x
remove (x:xs) y
	| not $ esDins y x = (x:(remove xs y))
	| otherwise = remove xs y

flatten :: [[Int]] -> [Int]
flatten [] = []
flatten (xs:ys) = xs ++ flatten ys

oddsNevens :: [Int] -> ([Int], [Int])
oddsNevens [] = ([], [])
oddsNevens (x:xs)
	| (mod x 2) /= 0 = (x:(fst y), snd y)
	| otherwise = (fst y, x:(snd y))
		where y = oddsNevens xs

esMultiple :: [Int] -> Int -> Bool
esMultiple [] _ = False
esMultiple (x:xs) y
	| ((mod y x) /= 0) = esMultiple xs y
	| otherwise = True

garbell :: Int -> [Int]
garbell n = foldl f[2] $ takeWhile ( n >=) $ iterate (+1) 3
	where f x y
		| not $ esMultiple x y = x ++ (y:[])
		| otherwise = x

primers :: [Int]
primers = primes 3 [2]

primes :: Int -> [Int] -> [Int]
primes n [] = takeWhile (<= n) $ primes 3 [2]
primes 3 [2] = 2:(3:(primes 5 [2,3]))
primes x y
	| not $ esMultiple y x = x:(primes (x+1) (y ++ (x:[])))
	| otherwise = primes (x+1) y

primeDivisors :: Int -> [Int]
primeDivisors n = filter ( f n ) $ primes n []
	where f x y = ( mod x y ) == 0
