data Expr = Val Int | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr

eval1 :: Expr -> Int
eval1 (Val i) = i
eval1 (Add v1 v2) = eval1 v1 + eval1 v2
eval1 (Sub v1 v2) = eval1 v1 - eval1 v2
eval1 (Mul v1 v2) = eval1 v1 * eval1 v2
eval1 (Div v1 v2) = eval1 v1 `div` eval1 v2

eval2 :: Expr -> Maybe Int
eval2 (Val x) = Just x
eval2 (Add x y) = do 
    a <- eval2 x
    b <- eval2 y
    return (a + b)
eval2 (Sub x y) = do 
    a <- eval2 x
    b <- eval2 y
    return (a - b)
eval2 (Mul x y) = do 
    a <- eval2 x
    b <- eval2 y
    return (a * b)
eval2 (Div x y) = do 
    a <- eval2 x
    b <- eval2 y
    if b == 0 then Nothing
    else return (div a b)

eval3 :: Expr -> Either String Int
eval3 (Val x) = Right x
eval3 (Add x y) = do 
    a <- eval3 x
    b <- eval3 y
    return (a + b)
eval3 (Sub x y) = do 
    a <- eval3 x
    b <- eval3 y
    return (a - b)
eval3 (Mul x y) = do 
    a <- eval3 x
    b <- eval3 y
    return (a * b)
eval3 (Div x y) = do 
    a <- eval3 x
    b <- eval3 y
    if b == 0 then Left "div0"
    else return (div a b)
