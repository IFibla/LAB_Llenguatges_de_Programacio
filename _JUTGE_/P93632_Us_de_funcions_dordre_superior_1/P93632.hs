eql :: [Int] -> [Int] -> Bool
eql x y = (length x == length y) && (and $ zipWith (==) x y)
{-
    FUNCTION ZIPWITH
        Makes a list, its elements are calculated from the function and the elements of input lists 
        occuring at the same positions in both lists
        Example: 
            Input. zipWith (+) [1,2,3] [3,2,1]
            Output. [4,4,4]
            
            Input. zipWith (\x y -> 2*x + y) [1,2,3,4] [5,6,7,8]
            Output. [7, 10, 13, 16]
-}

prod :: [Int] -> Int
prod x = foldl (*) 1 x
{-
    FUNCTION FOLDL
        It takes the second argument and the first item of the list and applies the function to them,
        then feeds the function with this result and the second argument and so on.
        Example:
            Input. foldl (/) 64 [4,2,4]
            Output: 2.0
            
            Input. foldl (\x y -> 2*x + y) 4 [1,2,3]
            Output. 43
-}

prodOfEvens :: [Int] -> Int
prodOfEvens x = prod $ filter even x
{- 
    FUNCTION FILTER
        Returns a list constructed from members of a list ( the second argument ) fulfilling a 
        condition given by the first argument
        Example:
            Input: filter (>5) [1,2,3,4,5,6,7,8]
            Output: [6,7,8]

            Input: filter odd [3,6,7,9,12,14]
            Output: [3,7,9]
-}

powersOf2 :: [Int]
powersOf2 = iterate (*2) 1
{-
    FUNCTION ITERATE
        Creates an infinite list where the first item is calculated by applying the function on the
        second argument, the second item by applying the function on the previous result and so on.
        Example:
            Input: take 10 ( iterate (2*) 1 )
            Output: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]

            Input: take 3 ( iterate (\x -> (x+3) * 2 ) 
            Output: [1, 8, 22]
-}

scalarProduct :: [Float] -> [Float] -> Float
scalarProduct x y = sum $ zipWith(*) x y
