flatten :: [[Int]] -> [Int]
flatten [] = []
flatten [x] = x
flatten (x:xs) = x ++ flatten xs

myLength :: String -> Int
myLength s = last $ zipWith f s (iterate (+1) 1)
    where f a b = b

myReverse :: [Int] -> [Int]
myReverse [] = []
myReverse x = foldr f [] x
    where f a b = b ++ [a]

countIn :: [[Int]] -> Int -> [Int]
countIn [] y = []
countIn x y = map (f y) x
    where f y x = length $ filter ( == y ) x

firstWord :: String -> String
firstWord [] = []
firstWord x = takeWhile (/= ' ') $ dropWhile (==' ') x
