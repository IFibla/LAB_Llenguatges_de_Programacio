import Data.List

degree :: Eq a => [(a, a)] -> a -> Int
degree [] n = 0
degree (x:xs) n
    | ((fst $ x) == n) || ((snd $ x) == n) = 1 + degree xs n
    | otherwise = degree xs n

degree' :: Eq a => [(a, a)] -> a -> Int
degree' xlist n = foldl (\ z (x, y) -> if x == n || y == n then z + 1 else z ) 0 xlist

neighbors :: Ord a => [(a, a)] -> a -> [a]
neighbors xs n = sort $ map (\ (x, y) -> if x == n then y else x) $ filter (\ (x, y) -> if x == n || y == n then True else False ) xs
