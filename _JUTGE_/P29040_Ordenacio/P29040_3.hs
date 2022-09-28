insert :: [Int] -> Int -> [Int]
insert [] y = [y]
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
    | m < x = m:(ssort (x:remove xs m))
    | otherwise = x:(ssort xs)
    where m = minimum xs

merge :: [Int] -> [Int] -> [Int]
merge [] [] = []
merge [] (y:ys) = (y:ys)
merge (x:xs) [] = (x:xs)
merge (x:xs) (y:ys)
    | x < y = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)

msort :: [Int] -> [Int]
msort [] = []
msort [x] = [x]
msort xs = merge(msort primeraMeitat) (msort segonaMeitat)
        where primeraMeitat = take (length xs `div` 2) xs
              segonaMeitat  = drop (length xs `div` 2) xs

splitList :: [Int] -> Int -> ([Int], [Int])
splitList [] y = ([], [])
splitList (x:xs) y
    | x < y = (x:(fst $ slt), snd $ slt)
    | otherwise = (fst $ slt, x:(snd $ slt))
    where slt = splitList xs y

qsort :: [Int] -> [Int]
qsort [] = []
qsort [x] = [x]
qsort (x:xs) = qsort ( fst $ slt ) ++ x:( qsort ( snd $ slt ))
    where slt = splitList xs x

genSplitList :: Ord a => [a] -> a -> ([a], [a])
genSplitList [] y = ([], [])
genSplitList (x:xs) y
    | x < y = (x:(fst $ slt), snd $ slt)
    | otherwise = (fst $ slt, x:(snd $ slt))
    where slt = genSplitList xs y

genQsort :: Ord a => [a] -> [a]
genQsort [] = []
genQsort [x] = [x]
genQsort (x:xs) = genQsort ( fst $ slt ) ++ x:( genQsort ( snd $ slt ))
    where slt = genSplitList xs x
