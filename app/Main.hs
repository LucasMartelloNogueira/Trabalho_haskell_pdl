module Main where

import Grafo
import Operacao
import Data.List.Split
import Utils
import Executor

main ::IO()
main = do
 
    let g = Grafo {
        vertices = ["a", "b", "c", "d", "e"], 
        arestas = [("a", "b", "alfa"), ("b", "c", "beta"), ("a", "d", "delta"), ("c", "e", "gama"), ("d", "f", "sigma")]
    }

    -- ilustracao grafo         
    --          a
    --    alfa / \ delta
    --        b    d
    --  beta /     
    --      c
    --  gama \ 
    --        e


    -- TESTE 1
    let pdl1 = ";(a b)"
    let op1 = getOperacao pdl1
    print(getOperador op1)
    print(getOperandos op1)

    print("-----------------")

    -- TESTE 2
    let pdl2 = "U(;(a b) ;(c d))"
    let op2 = getOperacao pdl2
    print(getOperador op2)
    print(getOperandos op2)

    print("-----------------")

    -- TESTE 3
    let pdl3 = "U(;(a b) U(;(c d ) ;(e f)))"
    let op3 = getOperacao pdl3
    print(getOperador op3)
    print(getOperandos op3)

    print("-----------------")

    -- TESTE 4
    let pdl4 = "*(a)"
    let op4 = getOperacao pdl4
    print(getOperador op4)
    print(getOperandos op4)

    print("-----------------")

    -- Algumas funções interessantes

    -- exemplos de execução sequencial
    print("execucao sequencial")
    -- exemplo de sucesso
    let relacoes1 = ["alfa", "beta", "gama"]
    let vertice1 = "a"
    print(temExeSequencial (getArestas g) vertice1 relacoes1)

    -- exemplo de falha
    let relacoes2 = ["alfa", "sigma"]
    let vertice2 = "a"
    print(temExeSequencial (getArestas g) vertice2 relacoes2)

    print("escolha n deterministica")

    -- exemplos de escolha não determinística
    -- exemplo de sucesso
    let relacoes3 = ["alfa", "delta"]
    let vertice3 = "a"
    print(temEscolhaNaoDet (getArestas g) vertice3 relacoes3)

    -- exemplo de falha
    let relacoes4 = ["omega", "gama"]
    let vertice4 = "a"
    print(temEscolhaNaoDet (getArestas g) vertice4 relacoes4)


    print("escolha loop nao deterministico")

    -- exemplos de escolha não determinística
    -- exemplo de sucesso
    let relacao5 = "alfa"
    let vertice5 = "a"
    print(temIteracaoNaoDet (getArestas g) vertice5 relacao5)

    -- exemplo de falha
    let relacao6 = "ro"
    let vertice6 = "a"
    print(temIteracaoNaoDet (getArestas g) vertice6 relacao6)

    -- OUTRAS FUNÇÕES INTERESSANTES
    print("funcao se existe caminho")
    print(temCaminho (getArestas g) "a" "e")
    

    
    