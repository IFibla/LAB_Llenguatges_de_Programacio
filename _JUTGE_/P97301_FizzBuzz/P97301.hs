fizzBuzz :: [Either Int String]
fizzBuzz = map fb [0..]

fb :: Int -> Either Int String
fb x
    | mod x 15 == 0 = Right "FizzBuzz"
    | mod x 3 == 0 = Right "Fizz"
    | mod x 5 == 0 = Right "Buzz"
    | otherwise = Left x
