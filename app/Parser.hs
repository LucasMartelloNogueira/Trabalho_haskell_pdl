-- module Parser where

-- import Grafo

-- data PilhaPdl = PilhaPdl {
--     pdl :: String,
--     pilha :: [String],
--     valido :: Bool,
--     pontoErrado :: String
-- }

-- -- construtor
-- getPilhaPdl :: String -> [String] -> Bool -> String -> PilhaPdl
-- getPilhaPdl _pdl _pilha _valido _pontoErrado = 
--     PilhaPdl {
--         pdl = _pdl,
--         pilha = _pilha,
--         valido = _valido,
--         pontoErrado = _pontoErrado
--     }


-- getPdl :: PilhaPdl -> String
-- getPdl (PilhaPdl {pdl = xs}) = xs

-- getPilha :: PilhaPdl -> String
-- getPilha (PilhaPdl {pilha = xs}) = xs

-- getValidez :: PilhaPdl -> Bool
-- getValidez (PilhaPdl {valido = xs}) = xs

-- getPontoErrado :: PilhaPdl -> Bool
-- getPontoErrado (PilhaPdl {pontoErrado = xs}) = xs



-- U;ab;cd

-- U;ab;cd [] ->
-- U;ab [x]

-- pdl invertida: dc;ba;U


-- assumindo que a pdl já esta invertida na entrada
-- executaPdl :: PilhaPdl -> [(String, String, String)] -> PilhaPdl
-- executaPdl pilhaPdl arestas =
--     let 
--         charPdl = head (getPdl pilhaPdl)
--         restoPdl = tail (getPdl pilhaPdl)
--         novaPilha = charPdl : (getPilha pilhaPdl)
--         ehValido = getValidez pilhaPdl
--     in  
--         if ehValido == False then 
--             pilhaPdl
--         if elem charPdl ";U*" then
--             if charPdl == ";" then
--                 -- todo exe sequencial
--             if charPdl == "U" then
--                 -- todo exe escolha n deterministica
--             if charPdl == * then
--                 -- todo exe loop n deterministico
--         else
--             executaPdl (getPilhaPdl restoPdl novaPilha (getValidez pilhaPdl) (getPontoErrado pilhaPdl)) arestas



-- se for valido:
--  PilhaPdl:
--      pdl = ""
--      pilha = [x]
--      valido = True
--      pontoErrado = ""

-- -- se for invalido:
--  PilhaPdl:
--      pdl = "<resto>"
--      pilha = [?]
--      valido = False
--      pontoErrado = "<ponto invalido / info: vertice_testado e programa_testado>"