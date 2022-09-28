absValue :: Int -> Int
absValue x
    | x < 0 = -x
    | otherwise = x

power :: Int -> Int -> Int
power x 0 = 1
power x 1 = x
power x m = x * power x (m-1)

isDivisor :: Int -> Int -> Bool
isDivisor x m
    | m*m > x = False
    | mod m x == 0 = True
    | otherwise = isDivisor x (m+1)

isPrime :: Int -> Bool
isPrime x = not (isDivisor x 2)

slowFib :: Int -> Int
slowFib 0 = 0
slowFib 1 = 1
slowFib n = slowFib(n-1) + slowFib(n-2)

calculateFib :: Int -> (Int, Int)
calculateFib 0 = (0, 1)
calculateFib 1 = (1, 1)
calculateFib n = (seg, res)
    where x = calculateFib $ n - 1 
          seg = snd x
          res = ( fst x ) + ( snd x )

quickFib :: Int -> Int
quickFib n = fst $ calculateFib n
