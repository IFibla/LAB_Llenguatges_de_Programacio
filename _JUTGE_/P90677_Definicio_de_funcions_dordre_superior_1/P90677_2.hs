myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl func init [] = init
myFoldl func init (x:xs) = myFoldl func ( func init x ) xs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr func init [] = init
myFoldr func init (x:xs) = func x ( myFoldr func init xs )

myIterate :: (a -> a) -> a -> [a]
myIterate f a = a:(myIterate f $ f a)

myUntil :: (a -> Bool) -> (a -> a) -> a -> a
myUntil fcheck factive a 
    | fcheck a == False = myUntil fcheck factive $ factive a
    | otherwise = a

myMap :: (a -> b) -> [a] -> [b]
myMap func x = myFoldr(\c i -> (func c):i) [] x

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = myFoldr (\c i -> if f c then c:i else i) [] xs

myAll :: (a -> Bool) -> [a] -> Bool
myAll func a = and $ myMap func a

myAny :: (a -> Bool) -> [a] -> Bool
myAny func a = or $ myMap func a

myZip :: [a] -> [b] -> [(a,b)]
myZip [] [] = []
myZip [] (b:bs) = []
myZip (a:as) [] = []
myZip (a:as) (b:bs) = [(a,b)] ++ myZip as bs

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith func [] [] = []
myZipWith func [] (b:bs) = []
myZipWith func (a:as) [] = []
myZipWith func (a:as) (b:bs) = [y] ++ myZipWith func as bs
    where y = func a b
