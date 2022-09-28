multEq :: Int -> Int -> [Int]
multEq v1 v2 = iterate (*n) 1
    where n = v1 * v2

selectFirst :: [Int] -> [Int] -> [Int] -> [Int]
selectFirst l1 l2 l3 = [x | x <- l1, (belongs x l2) && ((not $ belongs x l3) || ((position x l2) < (position x l3)))]
    where 
        belongs :: Int -> [Int] -> Bool
        belongs x [] = False
        belongs v (x:xs)
            | v == x = True
            | otherwise = belongs v xs
        
        position :: Int -> [Int] -> Int
        position v (x:xs)
            | v == x = 0
            | otherwise = 1 + position v xs

myIterate :: (a -> a) -> a -> [a]
myIterate f v = scanl (\x _ -> f x)  n [1..]
