module Executor where

import Operacao
import Grafo
import Utils


-- funcao que dada um lista de operacoes, retorna uma operacao final
-- a operacao final combina os fatores resultantes como validez e pontos de inconsistencia
getOperacaoResultante :: [Operacao] -> Operacao
getOperacaoResultante listaOps = 
    let
        validez = and [getValidez op | op <- listaOps]
        _setArestas = getUniaoMatrizEmSet [getSetResultante op | op <- listaOps]
        _divergencias = getUniaoMatrizEmSet [getDivergencias op | op <- listaOps]
    in 
        Operacao {operador = "", operandos = [], valido = validez, divergencias = _divergencias, setResultante = _setArestas}


-- funao para pegar a relacao resultante da execução de programas
-- arg 1: grafo
-- arg 2: operador
-- agr 3: operandos
getResultadoOperacaoAtomica :: Grafo -> String -> [String] -> [(String, String)] 
getResultadoOperacaoAtomica grafo operador operandos
    | operandos == [] = []
    | operador == ";" = getExeSequencial operandos (getArestas grafo)
    | operador == "U" = getUniaoRelacoes (getRelacoesBinarias (getArestas grafo) (operandos !! 0)) (getRelacoesBinarias (getArestas grafo) (operandos !! 1))
    | otherwise = getLoopRelacao (getRelacoesBinarias (getArestas grafo) (operandos !! 0))



getExeOperacao :: String -> Grafo -> Operacao
getExeOperacao strPdl grafo = 
    let
        operacao = getOperacao strPdl
        _operador = getOperador operacao
        _operandos = getOperandos operacao
        _setResultante = getResultadoOperacaoAtomica grafo _operador _operandos
    in
        if (isAtomica operacao) == True then
            
            if _setResultante == [] then
                Operacao {
                    operador = _operador,
                    operandos = _operandos,
                    valido = False,
                    divergencias = ["tem uma inconsistencia entre os operandos " ++ (listaParaStr _operandos) ++ " com a operacao " ++ _operador],
                    setResultante = _setResultante
                }
            else
                Operacao {
                    operador = _operador,
                    operandos = _operandos,
                    valido = True,
                    divergencias = [],
                    setResultante = _setResultante
                }
        else
            getOperacaoResultante [getExeOperacao op grafo | op <- _operandos]


