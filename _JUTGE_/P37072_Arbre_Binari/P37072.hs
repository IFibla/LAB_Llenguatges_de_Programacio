data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

size :: Tree a -> Int
size Empty = 0
size (Node _ l r) = 1 + size l + size r

height :: Tree a -> Int
height Empty = 0
height (Node _ l r) = 1 + max (height l) (height r)

equal :: Eq a => Tree a -> Tree a -> Bool
equal Empty Empty = True
equal Empty (Node _ l r) = False
equal (Node _ l r) Empty = False
equal (Node n1 l1 r1) (Node n2 l2 r2) = (n1 == n2) && equal l1 l2 && equal r1 r2

isomorphic :: Eq a => Tree a -> Tree a -> Bool
isomorphic Empty Empty = True
isomorphic _ Empty = False
isomorphic Empty _ = False
isomorphic (Node t1 lt1 rt1) (Node t2 lt2 rt2) =
    t1 == t2 &&
    ((isomorphic lt1 lt2) && (isomorphic rt1 rt2) || (isomorphic lt1 rt2) && (isomorphic rt1 lt2))


preOrder :: Tree a -> [a]
preOrder Empty = []
preOrder (Node n1 l1 r1) = n1:( preOrder l1 ) ++ preOrder r1

postOrder :: Tree a -> [a]
postOrder Empty = []
postOrder (Node n1 l1 r1) = (postOrder l1) ++ (postOrder r1) ++ [n1]

inOrder :: Tree a -> [a]
inOrder Empty = []
inOrder (Node n1 l1 r1) = (inOrder l1) ++ [n1] ++ (inOrder r1)

breadthFirst :: Tree a -> [a]
breadthFirst t = bf [t]
    where 
        bf [] = []
        bf (Empty:ts) = bf ts
        bf ((Node x l r):ts) = x:bf (ts ++ [l,r])

build :: Eq a => [a] -> [a] -> Tree a
build [] [] = Empty
build p@(px : pxs) i = Node px (build lp li) (build rp ri)
  where (li,_:ri) = span (/=px) i
        (lp,rp) = splitAt (length li) pxs

overlap :: (a -> a -> a) -> Tree a -> Tree a -> Tree a
overlap _ Empty Empty = Empty
overlap _ t1 Empty = t1
overlap _ Empty t2 = t2
overlap f (Node t1 lt1 rt1) (Node t2 lt2 rt2) = Node (f t1 t2) (overlap f lt1 lt2) (overlap f rt1 rt2)
