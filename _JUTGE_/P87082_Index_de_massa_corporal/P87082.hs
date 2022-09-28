main = do
    input <- getLine
    if input /= "*" then do
        let ws = words input
        let name = ws !! 0
        let pes = read $ ws !! 1
        let altura = read $ ws !! 2
        putStrLn ( name ++ ": " ++ ( message $ index pes altura ))
        main
    else
        return ()

index pes altura = pes / (altura ^2 )

message index 
    | index < 18 = "magror"
    | index < 25 = "corpulencia normal"
    | index < 30 = "sobrepes"
    | index < 40 = "obesitat"
    | otherwise = "obesitat morbida"
