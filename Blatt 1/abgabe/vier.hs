import System.Environment

mean :: [Integer] -> Int
mean xs = fromIntegral (sum xs) `div` (length xs)

yesNo :: [Integer] -> String
yesNo xs = if (mean xs >=5) then "Ja" else "Nein"

process :: [Integer] -> String
process l = "Got the following arguments:\n" ++
            concat (map (\x -> " - " ++ (show x) ++ "\n") l) ++
            show (mean l) ++ "\n" ++ (yesNo l)

main = getArgs >>= putStr . process . (map read)