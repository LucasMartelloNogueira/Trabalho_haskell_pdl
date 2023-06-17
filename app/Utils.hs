module Utils where

removeChar :: Char -> String -> String
removeChar char str = filter (\i -> i /= char) str

removeChars :: [Char] -> String -> String
removeChars [] str = str
removeChars (ch:chs) str = 
    let newStr = removeChar ch str
    in removeChars chs newStr


-- realiza o slicing de strings
-- obs: limite inferior e superior inclusos
slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

