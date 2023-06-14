module Grafo where

data Grafo = Grafo {
    vertices :: [String],
    arestas :: [(String, String, String)]
}

getVertices :: Grafo -> [String]
getVertices (Grafo {vertices = xs}) = xs

getArestas :: Grafo -> [(String, String, String)]
getArestas (Grafo {arestas = xs}) = xs


-- verifica se um determinado par de vertices tem uma determinada aresta rotulada
temAresta :: [(String, String, String)] -> String -> Bool
temAresta [] aresta = False
temAresta ((_, _, x):xs) aresta = x == aresta || temAresta xs aresta

-- verifica se existe uma aresta com um determinado rotulo e vertice de origem
temArestaNoVerticeOrigem :: [(String, String, String)] -> String -> String -> Bool
temArestaNoVerticeOrigem [] vertice aresta = False
temArestaNoVerticeOrigem ((v, _, ar):xs) vertice aresta = ((v == vertice) && (ar == aresta)) || temArestaNoVerticeOrigem xs vertice aresta
