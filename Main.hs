module Main where

import Grafo

main ::IO()
main = do
    let g = Grafo {vertices = ["a", "b", "c", "d", "e"], arestas = [("a", "b", "alfa"), ("b", "c", "beta"), ("a", "d", "alfa"), ("c", "e", "gama")]}
    let arestas = getArestas g

    -- teste com execução sequencial (ex: vendo se tem no grafo a pdf(alfa;beta;gama))
    let seq = ["alfa", "beta", "gama"]
    let vertice = "a"
    let teste = temExeSequencial arestas vertice seq
    print(teste)