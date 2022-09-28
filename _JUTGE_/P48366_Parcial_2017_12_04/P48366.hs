eval1 :: String -> Int
eval1 s = calculate1 ( words s ) []

calculate1 :: [String] -> [Int] -> Int
calculate1 [] [x] = x
calculate1 (s:xs) [] = calculate1 xs [read s]
calculate1 (s:xs) [x] = calculate1 xs ([read s] ++ [x])
calculate1 (s:xs) (x1:x2:x)
    | s == "+" = calculate1 xs ([x2 + x1] ++ x) 
    | s == "-" = calculate1 xs ([x2 - x1] ++ x) 
    | s == "*" = calculate1 xs ([x2 * x1] ++ x) 
    | s == "/" = calculate1 xs ([div x2 x1] ++ x) 
    | otherwise = calculate1 xs ([read s] ++ [x1] ++ [x2] ++ x)

eval2 :: String -> Int
eval2 s = head $ foldl calculate2 [] (words s)
    where
        calculate2 :: [Int] -> String -> [Int]
        calculate2 (x1:x2:x) "+" = [x1+x2] ++ x
        calculate2 (x1:x2:x) "-" = [x2-x1] ++ x
        calculate2 (x1:x2:x) "*" = [x1*x2] ++ x
        calculate2 (x1:x2:x) "/" = [div x2 x1] ++ x
        calculate2 x s = [read s] ++ x

fsmap :: a -> [a -> a] -> a
fsmap a b = foldl (\x y -> (y x)) a b

divideNconquer :: (a -> Maybe b) -> (a -> (a, a)) -> (a -> (a, a) -> (b, b) -> b) -> a -> b