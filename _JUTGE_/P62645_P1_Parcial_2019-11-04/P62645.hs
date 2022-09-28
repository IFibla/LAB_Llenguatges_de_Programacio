main = do 
    contents <- getContents
    let _contents = words contents
    let res = foldl (+) 0 (map (read) _contents :: [Int])
    putStr $ (show $ res) ++ "\n"