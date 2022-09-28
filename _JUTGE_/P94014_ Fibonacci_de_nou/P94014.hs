fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = snd $ fastfibonacci (0, 1) (n-1)

fastfibonacci :: (Integer, Integer) -> Int -> (Integer, Integer)
fastfibonacci (a, b) 0 = (a, b)
fastfibonacci (a, b) n = fastfibonacci (b, a+b) (n-1)