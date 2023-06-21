module Utils where

import Data.List 

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
slice from to xs
    | (from > to) = []
    | otherwise = take (to - from + 1) (drop from xs)


indexDoSplit :: String -> Int
indexDoSplit str = indexDoSplitAux str 0 0


indexDoSplitAux :: String -> Int -> Int -> Int
indexDoSplitAux [] _ _ = 0
indexDoSplitAux (x:xs) ca cf
    |(ca == cf) && x == ' ' = 0
    |x == '(' = 1 + indexDoSplitAux xs (ca+1) cf 
    |x == ')' = 1 + indexDoSplitAux xs ca (cf+1)
    |otherwise = 1 + indexDoSplitAux xs ca cf

parseExeSeq :: String -> [String]
parseExeSeq [] = []
parseExeSeq str = 
    let 
        proxIndex = indexDoSplit str
        operando = slice 0 (proxIndex-1) str
        len = length str
        resto = slice (proxIndex+1) (len-1) str
    in
        if (resto /= []) then
            [operando] ++ parseExeSeq resto
        else
            [operando]

parseUniao :: String -> [String]
parseUniao [] = []
parseUniao str = 
    let 
        index = indexDoSplit str
        operando1 = slice 0 (index-1) str
        len = length str
        operando2 = slice (index+1) (len-1) str
    in
        [operando1, operando2]



uniaoSet :: (Eq a) => [a] -> [a] -> [a]
uniaoSet x [] = x
uniaoSet [] y = y
uniaoSet [] [] = []
uniaoSet z (x:xs)
    | elem x z == True = uniaoSet z xs
    | otherwise = uniaoSet (x:z) xs


getUniaoMatrizEmSet :: (Eq a) => [[a]] -> [a]
getUniaoMatrizEmSet [] = []
getUniaoMatrizEmSet [x] = x
getUniaoMatrizEmSet (x:y:matriz)
    | y == [] = uniaoSet x y
    | otherwise = uniaoSet (uniaoSet x y) (getUniaoMatrizEmSet matriz)



addItemMatrix :: (Eq a) => a -> [[a]] -> [[a]]
addItemMatrix item matrix = [[item] ++ lista | lista <- matrix]


listaParaStr :: [String] -> String
listaParaStr = concat . intersperse " "