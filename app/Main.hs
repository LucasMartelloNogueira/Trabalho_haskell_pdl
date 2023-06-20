module Main where

import Grafo
import Operacao
import Data.List.Split
import Utils
import Text.Printf

main ::IO()
main = do
    let g = Grafo {vertices = ["a", "b", "c", "d", "e"], arestas = [("a", "b", "alfa"), ("b", "c", "beta"), ("a", "d", "delta"), ("c", "e", "gama")]}

    -- ilustracao grafo         a -> (a, a) / (a, b) / (a, d)
    --          a
    --    sigma/ \ delta
    --        b    d
    --  beta /     
    --      c
    --  gama \ 
    --        e

    -- arestas do grafo
    -- let arestasG = getArestas g
    -- let ra = getRelacoes a "alfa"

    -- pdl : U;ab;cd
    -- let pdl = "a;b;c"
    -- let sep = ';'
    -- let newStr = sep : filter (\x -> x /= sep) pdl
    -- print(newStr)
    -- let pdl = "U;ab;cd"
    -- let pdlRev = reverse pdl
    -- print(pdlRev)

    -- let isPath = temCaminho arestasG "e" "a"
    -- print(isPath)

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


    -- (x?;alfa -x?;Beta) -> notação pre fixada -> U(alfa beta)

    -- TESTE 1: ";(a b)" 
    -- let pdl  = ";(a b)"
    -- let op = getOperacaoV2 pdl
    -- print(getOperador op)
    -- print(getOperandos op)
    -- print(length (getOperandos op))

    -- TESTE 2: ";(a ;(f g) c d e)"
    -- let pdl  = ";(a ;(f g) c d e)"
    -- let op = getOperacaoV2 pdl
    -- print(getOperador op)
    -- print(getOperandos op)
    -- print(length (getOperandos op))

    -- TESTE 3: "U(;(a b) ;(c d))"
    -- let pdl  = "U(;(a b) ;(c d))"
    -- let op = getOperacaoV2 pdl
    -- print(getOperador op)
    -- print(getOperandos op)
    -- print(length (getOperandos op))

    -- TESTE 4: "U(;(a b c) U(;(c d) ;(e f)))"
    -- let pdl  = "U(;(a b c) U(;(c d) ;(e f)))"
    -- let op = getOperacaoV2 pdl
    -- print(getOperador op)
    -- print(getOperandos op)
    -- print(length (getOperandos op))


    -- let pdl = "alfa"
    let nome = "Lucas"
    print("meu nome eh " ++ nome)
    
    -- let pdl = ";(alfa beta)"
    -- let op = getOperacao pdl g
    -- print(getSetResultante op)
    -- print(getOperador op)
    -- print(getOperandos op)


    -- let pdl = "a ;(f g) c d e"
    -- let lista = parseExeSeq pdl
    -- print(lista)
    -- let pdl = ";(a b c) ;(e f g)"
    -- print(parseUniao pdl)
    -- let pdl = "U(;(a b c) U(;(c d) ;(e f)))"
    -- let pdl = "U(;(a b c)) (U(;(c d)) (;(e f)))"  -- "(a;b;c) U ((c;d) U (e;f))"
    -- let len = length pdl
    -- let i = indexDoSplit pdl
    -- let op1 = slice 1 (i-1) pdl
    -- let op2 = slice (i+1) (len-1) pdl
    -- print(op1)
    -- print(op2)
    -- let operacao = getOperacao pdl
    -- print(getOperador operacao)
    -- let operandos = getOperandos operacao
    -- print(operandos)
    -- print(length operandos)
    -- print(isAtomica operacao)
    -- let operandos = getOperandos operacao
    -- let fixed = fixOperandos operandos
    -- print(fixed)
    -- print(length fixed)

    -- let arestasG = getArestas g
    -- let relacoesAlfa = getRelacoes arestasG "alfa"
    -- print(relacoesAlfa)
    -- let relacoesBeta = getRelacoes arestasG "beta"
    -- print(relacoesBeta)
    -- let relacoesNovas = getNovasRelacoes relacoesAlfa relacoesBeta
    -- print(relacoesNovas)

    -- let relA = [("a", "b"), ("b", "c"), ("c", "d")]
    -- let nova = getLoopRelacao relA
    -- print(nova)

    


    -- Testes com novo modelo: Operacao

    -- let operacao1 = Operacao {operador = ";", operandos = ["a", "b"]}
    -- print(getOperador operacao1)
    -- print(getOperandos operacao1)
    -- print(isAtomica operacao1)

    -- let operacao2 = Operacao {operador = ";", operandos = ["(a;b)", "(c;d)"]}
    -- print (getOperador operacao2)
    -- print (getOperandos operacao2)
    -- print (isAtomica operacao2)