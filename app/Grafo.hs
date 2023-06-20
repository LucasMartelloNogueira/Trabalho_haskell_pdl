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

-- pega todas as arestas com determinado rotulo a partir de um vertice de origem
-- arg 1: lista de arestas do grafo
-- arg 2: rotulo testado
-- arg 3: vertice testado
getRotas :: [(String, String, String)] -> String -> String -> [(String, String, String)]
getRotas [] _ _ = []
getRotas arestas rotulo vertice = filter (\(v1, v2, rot) -> v1 == vertice && rot == rotulo) arestas


-- pega todas as arestas com determinado rotulo
getRelacoes :: [(String, String, String)] -> String -> [(String, String, String)]
getRelacoes [] _ = []
getRelacoes arestas rotulo = [(v1, v2, rot) | (v1, v2, rot) <- arestas, rot == rotulo]


-- funcao que confere se tem caminho entre dois vertices
temCaminho :: [(String, String, String)] -> String -> String -> Bool
temCaminho [] v1 v2 = v1 == v2
temCaminho arestas v1 v2 = 
    let arestasV1 = getDifRotas arestas v1
    in
        or [(v1 == va) && (v2 == vb) | (va, vb, rot) <- arestasV1] || or [temCaminho arestas vTemp v2 | (vTemp, v2, rot) <- arestasV1]


-- getRelacoesTransitivas :: [(String, String, String)] -> [(String, String, String)] -> [(String, String, String)]
-- getRelacoesTransitivas r1 r2 = [(v1, v3, rot) | ]


-- funcao para verificar execucao sequecial de um programa pdl (ex: alfa;beta)
-- arg 1: arestas do grafo
-- arg 2: vertice que esta sendo atualmente testado
-- arg 3: lista de rotulos das arestas (progamas, ex: alfa)
-- retorno: bool se todas as arestas existem no programa
temExeSequencial :: [(String, String, String)] -> String -> [String] -> Bool
temExeSequencial [] _ _ = False 
temExeSequencial _ _ [] = True 
temExeSequencial arestas vertice [rotulo] = or [v1 == vertice && rot == rotulo | (v1, v2, rot) <- getRotas arestas rotulo vertice]
temExeSequencial arestas vertice (rotulo:rotulos) = 
    let rotas = getRotas arestas rotulo vertice
    in
        if rotas == [] then False
        else
            or [temExeSequencial arestas v2 rotulos | (v1, v2, rotulo) <- rotas]


-- pega todas as arestas (com diferentes rotulos) a partir de um vértice
-- agr 1: arestas do grafo
-- arg 2: vertice testado
getDifRotas :: [(String, String, String)] -> String -> [(String, String, String)]
getDifRotas [] _ = []
getDifRotas arestas vertice = [(v1, v2, rotulo) | (v1, v2, rotulo) <- arestas, v1 == vertice]


-- funcao para verificar execucao de escolha não deterministica de pdl (ex: alfa U beta)
-- arg 1: arestas do grafo
-- arg 2: vertice que sera testado
-- arg 3: rotulos que serão testados (as diferetes opções na escolha não deterministica)
temEscolhaNaoDet :: [(String, String, String)] -> String -> [String] -> Bool
temEscolhaNaoDet [] _ _ = False
temEscolhaNaoDet arestas vertice rotulos = or [elem rot rotulos | (v1, v2, rot) <- getDifRotas arestas vertice]


-- funcao auxiliar que verifica existencia de um loop no grafico
-- arg 1: arestas do grafo
-- arg 2: vertice testado
-- arg 3: rotulo (programa) testado (ex: alfa)
-- arg 4: profundiade do caminho achado
-- retorno: numero de vezes que rotulo ocorre, podendo ser:
--      -1: o vertice testado tem outras arestas mas não com o rotulo testado
--       0: não tem arestas saindo do vertice
--       n: numero do maior cominho com o rotulo desejado
temIteracaoNaoDetAux :: [(String, String, String)] -> String -> String ->Int -> Int
temIteracaoNaoDetAux [] _ _ profundidade = profundidade -- caso em que não tem arestas o grafo
temIteracaoNaoDetAux arestas vertice rotulo profundidade =
    let rotas =  [(v1, v2, rot) | (v1, v2, rot) <- getRotas arestas rotulo vertice]
    in
        if length rotas == 0 then -1 * (profundidade+1)
        else
           2 + maximum [temIteracaoNaoDetAux arestas v2 rotulo (profundidade+1) | (v1, v2, rot) <- getRotas arestas rotulo vertice]


auxRes :: Int -> Int
auxRes x
    | x == -1 = x
    | otherwise = x + 1

temIteracaoNaoDet :: [(String, String, String)] -> String -> String -> Int
temIteracaoNaoDet [] _ _ = 0
temIteracaoNaoDet arestas vertice rotulo = auxRes (temIteracaoNaoDetAux arestas vertice rotulo 0)


getRelacaoSemRotulo :: [(String, String, String)] -> [(String, String)]
getRelacaoSemRotulo arestas = [(v1, v2) | (v1, v2, rot) <- arestas]

-- EX: A ; B
-- funcao que dado dois rotulos (progamas) gera uma nova lista de relacoes
-- arg 1: conjunto de arestas de um rotulo
-- arg 2: conjunto de arestas de um outro rotulo
getNovasRelacoes :: [(String, String)] -> [(String, String)] -> [(String, String)]
getNovasRelacoes rel1 rel2 = [(v1, v2) | (v1, vTemp1) <- rel1, (vTemp2, v2) <- rel2, vTemp1 == vTemp2]


-- EX: A U B
-- funcao que faz a uniao de duas relacoes
getUniaoRelacoes :: [(String, String)] -> [(String, String)] -> [(String, String)]
getUniaoRelacoes rel1 rel2 = [(v1, v2) | (v1, v2) <- (rel1 ++ rel2)]


-- EX: A*
-- funcao que dado uma relacao, gera a relacao de loop n deterministico
getLoopRelacaoAux :: [(String, String)] -> [(String, String)] -> Bool -> [(String, String)]
getLoopRelacaoAux [] _ _ = []
getLoopRelacaoAux relNova relOriginal primeiro = 
    let 
        novaRel = getNovasRelacoes relNova relOriginal
    in
        if primeiro == True then
            relOriginal ++ novaRel ++ getLoopRelacaoAux novaRel relOriginal False
        else
            novaRel ++ getLoopRelacaoAux novaRel relOriginal False


getLoopRelacao :: [(String, String)] -> [(String, String)]
getLoopRelacao [] = []
getLoopRelacao rel = getLoopRelacaoAux rel rel True