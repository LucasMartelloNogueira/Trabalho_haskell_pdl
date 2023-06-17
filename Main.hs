module Main where

import Grafo

main ::IO()
main = do
    let g = Grafo {vertices = ["a", "b", "c", "d", "e"], arestas = [("a", "b", "alfa"), ("b", "c", "beta"), ("a", "d", "delta"), ("c", "e", "gama")]}

    -- ilustracao grafo
    --          a
    --    alfa / \ delta
    --        b    d
    --  beta /     
    --      c
    --  gama \ 
    --        e

    -- arestas do grafo
    let arestas = getArestas g

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
    let rotulo = "alfa"
    let vertice = "a"
    let teste = temIteracaoNaoDet arestas vertice rotulo
    -- let rotasDif =  [(v1, v2, rot) | (v1, v2, rot) <- (getDifRotas arestas vertice), rot/=rotulo]
    print(teste)