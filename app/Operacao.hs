module Operacao where

import Utils
import Data.List.Split

data Operacao = Operacao {
    operador :: String,
    operandos :: [String]
}


getOperacao :: String -> Operacao
getOperacao str = 
    let 
        _operador = (take 1 str) !! 0
        tempStr = removeChar _operador str
        newStr = slice 1 ((length tempStr)-2) tempStr
    in
        if (elem '(' newStr) || (elem ')' newStr) then
            Operacao {operador = [_operador], operandos = fixOperandos (endBy ") " newStr)}
        else
            Operacao {operador = [_operador], operandos = splitOn " " newStr}
    
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


-- funcao que confere se todos os operandos do operacao sao atomicos
-- arg 1 : Operacao
-- retorno : True se todos os operandos da operacao sao atomicos. False caso contrario
isAtomica :: Operacao -> Bool
isAtomica operacao = and [not (elem '(' op) && not (elem ')' op) | op <- (getOperandos operacao)]
