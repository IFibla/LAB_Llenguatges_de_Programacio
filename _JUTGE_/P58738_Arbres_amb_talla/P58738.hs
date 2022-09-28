data STree a = Nil | Node Int a (STree a) (STree a) deriving (Show)

isOk :: STree a -> Bool
isOk (Node n x t1 t2)
    | n == (1 + getNumNodes t1 + getNumNodes t2) = True
    | otherwise = False

getNumNodes :: STree a -> Int
getNumNodes Nil = 0
getNumNodes (Node n x Nil Nil) = 1
getNumNodes (Node n x t1 Nil) = 1 + getNumNodes t1
getNumNodes (Node n x Nil t2) = 1 + getNumNodes t2
getNumNodes (Node n x t1 t2) = 1 + getNumNodes t1 + getNumNodes t2

nthElement :: STree a -> Int -> Maybe a
nthElement a n
    | ((length y) >= n) && (isOk a) = Just (y !! (n-1))
    | otherwise = Nothing
        where y = inOrder a

inOrder :: STree a -> [a]
inOrder Nil = []
inOrder (Node n x Nil Nil) = [x]
inOrder (Node n x t1 Nil) = inOrder t1 ++ [x]
inOrder (Node n x Nil t2) = [x] ++ inOrder t2
inOrder (Node n x t1 t2) = inOrder t1 ++ [x] ++ inOrder t2

mapToElements :: (a -> b) -> STree a -> [Int] -> [Maybe b]
mapToElements f a v = map  (auxFunc f) ( map (nthElement a) v )

auxFunc :: (a -> b) -> Maybe a -> Maybe b
auxFunc f Nothing = Nothing
auxFunc f (Just x) = Just (f x)

instance Functor (STree) where
    fmap f Nil = Nil 
    fmap f (Node i n rn ln) = Node i (f n) (fmap f rn) (fmap f ln)
