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

-- pega todas as arestas com determinado rotulo
getArestasComRotulo :: [(String, String, String)] -> String -> [(String, String, String)]
getArestasComRotulo [] _ = []
getArestasComRotulo arestas rotulo = [(v1, v2, rot) | (v1, v2, rot) <- arestas, rot == rotulo]

-- pega todas as arestas com detesrminado rotulo a partir de um vertice de origem
-- arg 1: lista de arestas do grafo
-- arg 2: rotulo testado
-- arg 3: vertice testado
getRotas :: [(String, String, String)] -> String -> String -> [(String, String, String)]
getRotas [] _ _ = []
getRotas arestas rotulo vertice = filter (\(v1, v2, rot) -> v1 == vertice && rot == rotulo) arestas



-- funcao para verificar execucao sequecial de programas
-- arg 1: arestas do grafo
-- arg 2: vertice que esta sendo atualmente testado
-- arg 3: lista de rotulos das arestas (progamas, ex: alfa)
-- retorno: bool se todas as arestas existem no programa
temExeSequencial :: [(String, String, String)] -> String -> [String] -> Bool
temExeSequencial arestas vertice [rotulo] = or [v1 == vertice && rot == rotulo | (v1, v2, rot) <- getRotas arestas rotulo vertice]
temExeSequencial arestas vertice (rotulo:rotulos) = 
    let rotas = getRotas arestas rotulo vertice
    in
        if rotas == [] then False
        else
            or [temExeSequencial arestas v2 rotulos | (v1, v2, rotulo) <- rotas]

