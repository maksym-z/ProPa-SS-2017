import System.Environment

process :: [Integer] -> String
process l = "Got the following arguments:\n" ++
            concat (map (\x -> " - " ++ (show x) ++ "\n") l)

main = getArgs >>= putStr . process . (map read)