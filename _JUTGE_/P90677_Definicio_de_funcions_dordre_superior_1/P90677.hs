myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ a [] = a
myFoldl f a (b:bs) = myFoldl f ( f a b ) bs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ b [] = b
myFoldr f b (a:as) = f a (myFoldr f b as)

myIterate :: (a -> a) -> a -> [a]
myIterate f a = a:(myIterate f (f a))

myUntil :: (a -> Bool) -> (a -> a) -> a -> a
myUntil cf f a 
    | cf a = a
    | otherwise = myUntil cf f (f a)

myMap :: (a -> b) -> [a] -> [b]
myMap f xs = myFoldr(\c i -> (f c):i) [] xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = myFoldr (\c i -> if f c then c:i else i) [] xs

myAll :: (a -> Bool) -> [a] -> Bool
myAll f a = and $ myMap f a 

myAny :: (a -> Bool) -> [a] -> Bool
myAny f a = or $ myMap f a

myZip :: [a] -> [b] -> [(a,b)]
myZip [] [] = []
myZip x [] = []
myZip [] y = []
myZip (x:xs) (y:ys) = (x, y):(myZip xs ys)

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f a b = myFoldr (\(x, y) a -> (f x y):a) [] (myZip a b)
