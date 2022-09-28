data Tree a = Empty | Node a (Tree a) (Tree a)
data Forest a = Forest [Tree a] deriving (Show)

instance Show a => Show (Tree a) where 
    show Empty = "()"
    show (Node a t1 t2) = "(" ++ (show t1) ++ "," ++ (show a) ++ "," ++ (show t2) ++ ")"

instance Functor (Tree) where
    fmap f Empty = Empty
    fmap f (Node a t1 t2) = Node (f a) (fmap f t1) (fmap f t2)

doubleT :: Num a => Tree a -> Tree a 
doubleT t = fmap (*2) t

instance Functor (Forest) where
    fmap f (Forest []) = Forest []
    fmap f (Forest as) = (Forest (fmap (f) <$> as))

doubleF :: Num a => Forest a -> Forest a
doubleF t = fmap (*2) t