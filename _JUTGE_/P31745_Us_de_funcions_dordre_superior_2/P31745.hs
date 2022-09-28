flatten :: [[Int]] -> [Int]
flatten x = foldl (++) [] x

myLength :: String -> Int
myLength [] = 0
myLength x = last $ zipWith (f) x (iterate (+1) 1)
    where f a b = b

myReverse :: [Int] -> [Int]
myReverse x = foldr (f) [] x
    where f a b = (++) b [a]

countIn :: [[Int]] -> Int -> [Int]
countIn x y = map (f y) x
    where f a b = length $ filter ( == a ) b
 
firstWord :: String -> String
firstWord x = takeWhile (/= ' ') $ dropWhile (== ' ') x
{-
    FUNCTION TAKEWHILE
        Creates a list from another one, it inspects the original list and takes from it its elements
        to the moment when the condition fails, then it stops processing.
        Example:
            Input: takeWhile (<3) [1,2,3,4,5]
            Output: [1,2]

            Input: takeWhile odd [1,3,5,7,9,10,11,13,15,17]
            Output: [1,3,5,7,9]
 -}

{-
    FUNCTION DROPWHILE
        Creates a list from another one, it inspects the original list and takes from it its elements
        from the moment when the condition fails for the first time till the end of the list. 
        Example:
            Input: dropWhile (<3) [1,2,3,4,5]
            Output: [3,4,5]

            Input: dropWhile ('w'>) "hello, world"
            Output: "world"
 -}
