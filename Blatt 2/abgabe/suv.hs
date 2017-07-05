import System.Environment
-- import Debug.Trace

ok :: Integer -> Integer -> Integer -> [Integer] -> Bool
--  Aenderungen ab hier -------------------------------------------------------

-- ok s r t (e:es) | trace ("s = " ++ show s ++ ", r = " ++ show r ++ ", t = " ++ show t ++ ", list " ++ show e ++ ":" ++ show es) False = undefined
ok s r t (e:es)
   | es == [] && t >= e       = True
   | s == 0 && t < e          = False
   | r < e                    = False
   | t < e && s > 0 && r >= e = ok (s-1) r r (e:es)
   | t >= e                   = ok s r (t-e) es

--  Aenderungen bis hier ------------------------------------------------------

work :: [Integer] -> Bool
work (s:r:t:es) = ok s r t es
work _ = error "Zu wenige Kommandozeilenparameter?!"

main :: IO ()
main = getArgs >>= putStrLn . show . work . (map read)
