data Queue a = Queue [a] [a]
    deriving (Show)

create :: Queue a
create = Queue [] []

push :: a -> Queue a -> Queue a
push x (Queue as bs) = Queue as (x:bs)

pop :: Queue a -> Queue a
pop (Queue [] []) = Queue [] []
pop (Queue [] bs) = Queue (reverse (init bs)) []
pop (Queue (x:xs) bs) = Queue xs bs

top :: Queue a -> a
top (Queue [] [x]) = x
top (Queue [] (x:xs)) = top $ Queue [] xs
top (Queue (x:xs) bs) = x

empty :: Queue a -> Bool
empty (Queue [] []) = True
empty x = False

instance Eq a => Eq (Queue a)
    where (Queue as1 bs1) == (Queue as2 bs2) = (as1 ++ reverse bs1) == (as2 ++ reverse bs2)
