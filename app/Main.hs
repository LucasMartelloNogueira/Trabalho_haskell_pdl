module Main where

-- import Grafo
import Operacao
import Data.List.Split
import Utils

main ::IO()
main = do
    -- let g = Grafo {vertices = ["a", "b", "c", "d", "e"], arestas = [("a", "b", "alfa"), ("b", "c", "beta"), ("a", "d", "delta"), ("c", "e", "gama")]}

    -- ilustracao grafo
    --          a
    --    alfa / \ delta
    --        b    d
    --  beta /     
    --      c
    --  gama \ 
    --        e

    -- arestas do grafo
    -- let arestas = getArestas g

    -- teste com execução sequencial (ex: vendo se tem no grafo a pdl: (alfa;beta;gama) )
    -- let seq = ["alfa", "beta", "gama"]
    -- let vertice = "a"
    -- let teste = temExeSequencial arestas vertice seq
    -- print(teste)

    --  teste com execução de escolha não deterministica (ex: vendo se tem no grafo a pdl: alfa U delta)
    -- let possiveis = ["beta", "gama"]
    -- let vertice = "a"
    -- let teste = temEscolhaNaoDet arestas vertice possiveis
    -- print(teste)

    -- teste com execucao de iteracao nao deterministica (ex: (alfa)*)
    -- let rotulo = "alfa"
    -- let vertice = "a"
    -- let teste = temIteracaoNaoDet arestas vertice rotulo
    -- let rotasDif =  [(v1, v2, rot) | (v1, v2, rot) <- (getDifRotas arestas vertice), rot/=rotulo]
    -- print(teste)

    
    -- teste com lista em Haskell
    -- let x = splitOn ";" "(a;b)"
    -- print(x)

    -- let str = "(a;b)"
    -- let chars = ['(', ')']
    -- let char = '('

    -- let c = removeChar char str
    -- print(c)

    -- let d = removeChars chars str
    -- print(d)
    
    -- let newStr = slice 2 ((length pdl) - 2) pdl
    -- let list = endBy ") " newStr
    -- print(list)
    -- print(length list)
    -- print(list)
    -- let pdl = ";(a b)"
    let pdl = "U(;(a b) ;(c d))"
    let operacao = getOperacao pdl
    print(getOperador operacao)
    let operandos = getOperandos operacao
    print(operandos)
    print(length operandos)
    -- let operandos = getOperandos operacao
    -- let fixed = fixOperandos operandos
    -- print(fixed)
    -- print(length fixed)




    -- Testes com novo modelo: Operacao

    -- let operacao1 = Operacao {operador = ";", operandos = ["a", "b"]}
    -- print(getOperador operacao1)
    -- print(getOperandos operacao1)
    -- print(isAtomica operacao1)

    -- let operacao2 = Operacao {operador = ";", operandos = ["(a;b)", "(c;d)"]}
    -- print (getOperador operacao2)
    -- print (getOperandos operacao2)
    -- print (isAtomica operacao2)