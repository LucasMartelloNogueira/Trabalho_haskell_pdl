module Operacao where

import Utils
import Data.List.Split

data Operacao = Operacao {
    operador :: String,
    operandos :: [String],
    valido :: Bool,
    divergencias :: [String]
}

-- construtor
getOperacao :: String -> Operacao
getOperacao str = 
    let 
        _operador = (take 1 str) !! 0
        tempStr = removeChar _operador str
        newStr = slice 1 ((length tempStr)-2) tempStr
    in
        if (elem '(' newStr) || (elem ')' newStr) then
            Operacao {operador = [_operador], operandos = fixOperandos (endBy ") " newStr), valido = True, divergencias = []}
        else
            Operacao {operador = [_operador], operandos = splitOn " " newStr, valido = True, divergencias = []}



-- findSpaceIndex :: String -> Int
-- findSpaceIndex [] = 0
-- findSpaceIndex (x:xs)
--     | x == ' ' = 0
--     | otherwise = 1 + findSpaceIndex xs 




-- construtor
getOperacaoV2 :: String -> Operacao
getOperacaoV2 str = 
    let
        _operador = head str
        len = length str
        strOperandos = slice 2 (len-2) str
    in
        if _operador == ';' then
            Operacao {operador = [_operador], operandos = (parseExeSeq strOperandos), valido = True, divergencias = []}
        else if _operador == 'U' then
            Operacao {operador = [_operador], operandos = (parseUniao strOperandos), valido = True, divergencias = []}
        else
            Operacao {operador = [_operador], operandos = [strOperandos], valido = True, divergencias = []}




-- funcao auxiliar para consertar formatacao de operandos na lista
fixOperandos :: [String] -> [String]
fixOperandos [] = []
fixOperandos (x:xs) = 
    let 
        errado = not (elem ')' x)
    in
        if errado == True then
            [x ++ ")"] ++ fixOperandos xs
        else
            [x] ++ fixOperandos xs


getOperador :: Operacao -> String
getOperador Operacao {operador = op} = op

getOperandos :: Operacao -> [String]
getOperandos Operacao {operandos = ops} = ops

getValidez :: Operacao -> Bool
getValidez Operacao {valido = val} = val

getDivergencias :: Operacao -> [String]
getDivergencias Operacao {divergencias = div} = div


-- funcao que confere se todos os operandos do operacao sao atomicos
-- arg 1 : Operacao
-- retorno : True se todos os operandos da operacao sao atomicos. False caso contrario
isAtomica :: Operacao -> Bool
isAtomica operacao = and [not (elem '(' op) && not (elem ')' op) | op <- (getOperandos operacao)]
