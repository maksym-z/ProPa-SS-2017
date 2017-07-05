import System.Environment

ok :: Integer -> Integer -> Integer -> [Integer] -> Bool
--  Aenderungen ab hier -------------------------------------------------------

ok s r t es = True

--  Aenderungen bis hier ------------------------------------------------------

work :: [Integer] -> Bool
work (s:r:t:es) = ok s r t es
work _ = error "Zu wenige Kommandozeilenparameter?!"

main :: IO ()
main = getArgs >>= putStrLn . show . work . (map read)
