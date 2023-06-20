module Operacao where

import Utils
import Data.List.Split
import Grafo

data Operacao = Operacao {
    operador :: String,
    operandos :: [String],
    valido :: Bool,
    divergencias :: [String],
    setResultante :: [(String, String)]
}

-- construtor
-- getOperacao :: String -> Operacao
-- getOperacao str = 
--     let 
--         _operador = (take 1 str) !! 0
--         tempStr = removeChar _operador str
--         newStr = slice 1 ((length tempStr)-2) tempStr
--     in
--         if (elem '(' newStr) || (elem ')' newStr) then
--             Operacao {operador = [_operador], operandos = fixOperandos (endBy ") " newStr), valido = True, divergencias = []}
--         else
--             Operacao {operador = [_operador], operandos = splitOn " " newStr, valido = True, divergencias = []}



-- findSpaceIndex :: String -> Int
-- findSpaceIndex [] = 0
-- findSpaceIndex (x:xs)
--     | x == ' ' = 0
--     | otherwise = 1 + findSpaceIndex xs 




-- construtor
getOperacaoComposta :: String -> Operacao
getOperacaoComposta str = 
    let
        _operador = head str
        len = length str
        strOperandos = slice 2 (len-2) str
    in
        if _operador == ';' then
            Operacao {operador = [_operador], operandos = (parseExeSeq strOperandos), valido = True, divergencias = [], setResultante = []}
        else if _operador == 'U' then
            Operacao {operador = [_operador], operandos = (parseUniao strOperandos), valido = True, divergencias = [], setResultante = []}
        else
            Operacao {operador = [_operador], operandos = [strOperandos], valido = True, divergencias = [], setResultante = []}


-- funcao que cria uma relacao a partir de um string pdl (rótulo) 
-- nesse caso, seria só um rótulo, ex: alfa
-- não teria operador e nem operandos
-- só teria o conjunto de arestas do grafo com aquele rotulo
getOperacaoBase :: String -> Grafo -> Operacao
getOperacaoBase str grafo = 
    let
        arestas = [(v1, v2) | (v1, v2, rot) <- getArestas grafo, rot == str]
    in
        Operacao {operador = "", operandos = [], valido = True, divergencias = [], setResultante = arestas}



getOperacao :: String -> Grafo -> Operacao
getOperacao pdl grafo = 
    let
        temParenteses = (elem '(' pdl) || (elem ')' pdl)
    in
        if temParenteses == True then
            getOperacaoComposta pdl
        else
            getOperacaoBase pdl grafo


-- funcao auxiliar para consertar formatacao de operandos na lista
-- fixOperandos :: [String] -> [String]
-- fixOperandos [] = []
-- fixOperandos (x:xs) = 
--     let 
--         errado = not (elem ')' x)
--     in
--         if errado == True then
--             [x ++ ")"] ++ fixOperandos xs
--         else
--             [x] ++ fixOperandos xs


getOperador :: Operacao -> String
getOperador Operacao {operador = op} = op

getOperandos :: Operacao -> [String]
getOperandos Operacao {operandos = ops} = ops

getValidez :: Operacao -> Bool
getValidez Operacao {valido = val} = val

getDivergencias :: Operacao -> [String]
getDivergencias Operacao {divergencias = div} = div

getSetResultante :: Operacao -> [(String, String)]
getSetResultante Operacao {setResultante = set} = set


-- funcao que confere se todos os operandos do operacao sao atomicos
-- arg 1 : Operacao
-- retorno : True se todos os operandos da operacao sao atomicos. False caso contrario
-- DEPRECADO
-- isAtomica :: Operacao -> Bool
-- isAtomica operacao = and [not (elem '(' op) && not (elem ')' op) | op <- (getOperandos operacao)]

isAtomica :: Operacao -> Bool
isAtomica operacao = (getOperador operacao == "") && (getOperandos operacao == [])
