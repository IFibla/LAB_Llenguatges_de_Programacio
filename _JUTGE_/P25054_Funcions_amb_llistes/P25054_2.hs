myLength :: [Int] -> Int
myLength [] = 0
myLength [x] = 1
myLength (x:xs) = 1 + myLength xs

myMaximum :: [Int] -> Int
myMaximum [x] = x
myMaximum (x:xs) 
    | x < m = m
    | otherwise = x
    where m = myMaximum xs

listSum :: [Int] -> Int
listSum [] = 0
listSum (x:xs) = x + (listSum xs)

intToFloat :: Int -> Float
intToFloat x = fromInteger ( toInteger x )

average :: [Int] -> Float
average [] = 0
average x = (intToFloat (listSum x)) / (intToFloat (myLength x))

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
flatten (x:xs) = x ++ flatten xs

oddsNevens :: [Int] -> ([Int], [Int])
oddsNevens [] = ([], [])
oddsNevens (x:xs) 
    | mod x 2 == 1 = (x:( fst y ), snd y)
    | otherwise = ( fst y, x:( snd y ))
    where y = oddsNevens xs

isMultiple :: Int -> Int -> Bool
isMultiple x y
    | mod x y == 0 = True
    | otherwise = False

hasDivisors :: Int -> Int -> Bool
hasDivisors x y
    | (y * y) > x = False
    | isMultiple x y = True
    | otherwise = hasDivisors x ( y + 1 )

isPrime :: Int -> Bool
isPrime x = not $ hasDivisors x 2

getPrimeDivisors :: Int -> Int -> [Int]
getPrimeDivisors x y
    | y > x = []
    | ( isPrime y ) && ( isMultiple x y ) = y:(getPrimeDivisors x ( y + 1 ))
    | otherwise = getPrimeDivisors x ( y + 1 )

primeDivisors :: Int -> [Int]
primeDivisors x = getPrimeDivisors x 2
