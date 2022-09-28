countIf :: (Int -> Bool) -> [Int] -> Int
countIf f [] = 0
countIf f (x:xs) 
    | f x == True = 1 + countIf f xs
    | otherwise = countIf f xs

pam :: [Int] -> [Int -> Int] -> [[Int]]
pam xs fs = map (`map` xs) fs

pam2 :: [Int] -> [Int -> Int] -> [[Int]]
pam2 xs fs = map (\x -> map ($ x) fs) xs

filterFoldl :: (Int -> Bool) -> (Int -> Int -> Int) -> Int -> [Int] -> Int
filterFoldl testf op el l = foldl op el $ filter testf l

insert :: (Int -> Int -> Bool) -> [Int] -> Int -> [Int]
insert f xs y = takeWhile (not.f y) xs ++ y:dropWhile (not.f y) xs

insertionSort :: (Int -> Int -> Bool) -> [Int] -> [Int]
insertionSort func [] = []
insertionSort func (x:xs) = insert func ( insertionSort func xs ) x
