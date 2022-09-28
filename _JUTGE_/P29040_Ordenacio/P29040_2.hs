insert :: [Int] -> Int -> [Int]
insert [] x = [x]
insert (x:xs) y
    | y < x = y:(x:xs)
    | otherwise = x:(insert xs y)

isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert ( isort xs ) x

remove :: [Int] -> Int -> [Int]
remove [] y = []
remove (x:xs) y
    | x == y = xs
    | otherwise = x:(remove xs y)

ssort :: [Int] -> [Int]
ssort [] = []
ssort [x] = [x]
ssort (x:xs) 
    | x <= minimum xs = x:(ssort xs)
    | otherwise = ssort ( xs ++ [x] )

merge :: [Int] -> [Int] -> [Int]
merge [] [] = []
merge [] y = y
merge x [] = x
merge (x:xs) (y:ys)
    | x < y = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)

msort :: [Int] -> [Int] 
msort [] = []
msort [x] = [x]
msort (x:xs) = merge [x] ( msort xs )

quickSort :: [Int] -> Int -> ([Int], [Int])
quickSort [] y = ([], [])
quickSort (x:xs) y
    | x < y = (x:(fst $ qS), snd $ qS)
    | otherwise = (fst $ qS, x:(snd $ qS))
    where qS = quickSort xs y

qsort :: [Int] -> [Int] 
qsort [] = []
qsort (x:xs) = (qsort(fst $ y)) ++ x:(qsort(snd $ y))
    where y = quickSort xs x

genQuickSort :: Ord a => [a] -> a -> ([a], [a])
genQuickSort [] y = ([], [])
genQuickSort (x:xs) y
    | x < y = (x:(fst $ qS), snd $ qS)
    | otherwise = (fst $ qS, x:(snd $ qS))
    where qS = genQuickSort xs y

genQsort :: Ord a => [a] -> [a]
genQsort [] = []
genQsort (x:xs) = (genQsort(fst $ y)) ++ x:(genQsort(snd $ y))
     where y = genQuickSort xs x
