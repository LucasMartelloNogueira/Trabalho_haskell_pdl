module Executor where

import Operacao
import Grafo


funcFinal :: String -> Grafo -> Operacao
funcFinal strPdl = 
    let
        operacao = getOperacao strPdl
        _operador = getOperador operacao
        _operandos = getOperandos operacao
        _setResultante = getSetResultante operacao
    in
        if (isAtomica operacao) == True then
            if setResultante == [] then
                Operacao {
                    operador = _operador,
                    operandos = _operandos,
                    valido = False,
                    divergencias = ["Nao tem a existencia de uma execucao de " ++ strPdl],
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
            -- todo
