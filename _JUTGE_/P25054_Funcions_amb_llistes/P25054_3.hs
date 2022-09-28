myLength :: [Int] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myMaximum :: [Int] -> Int
myMaximum [x] = x
myMaximum (x:xs)
    | x < y = y
    | otherwise = x
    where y = myMaximum xs

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

intToFloat :: Int -> Float
intToFloat n = fromInteger ( toInteger n )

average :: [Int] -> Float
average [] = 0
average x = intToFloat ( mySum x ) / intToFloat ( myLength x )

buildPalindrome :: [Int] -> [Int]
buildPalindrome x = ( reverse x ) ++ x

isInList :: Int -> [Int] -> Bool
isInList x [] = False
isInList x (y:ys)
    | x == y = True
    | otherwise = isInList x ys

remove :: [Int] -> [Int] -> [Int]
remove [] [] = []
remove x [] = x
remove [] y = []
remove (x:xs) y
    | isInList x y = remove xs y
    | otherwise = x:(remove xs y)

flatten :: [[Int]] -> [Int]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

oddsNevens :: [Int] -> ([Int], [Int])
oddsNevens [] = ([], [])
oddsNevens (x:xs)
    | mod x 2 == 0 = ( fst y, x:( snd y ) )
    | otherwise = ( x:( fst y ), snd y )
    where y = oddsNevens xs

isDivisor :: Int -> Int -> Bool
isDivisor x y 
    | mod x y == 0 = True
    | otherwise = False

calculateDivisors :: Int -> Int -> [Int]
calculateDivisors x it
    | (x `div` 2) < it = []
    | calculateDivisors it 2 /= [] = calculateDivisors x (it+1)
    | isDivisor x it == True = it:(calculateDivisors x (it+1))
    | otherwise = calculateDivisors x (it+1)


primeDivisors :: Int -> [Int]
primeDivisors x = calculateDivisors x 2

