module Main where

import Grafo

main ::IO()
main = do
    let g = Grafo {vertices = ["a", "b", "c"], arestas = [("a", "b", "alfa"), ("b", "c", "beta")]}
    let res = temArestaNoVerticeOrigem (getArestas g) "b" "Gama"
    print(res)