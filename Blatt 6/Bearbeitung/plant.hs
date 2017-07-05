import Debug.Trace (trace)

data Farbe = Rot | Rosa | Weis | Blau | Lila | Grun | Gelb
  deriving (Show, Eq)

data Pflanze =
      Blatt
   |  Blute Farbe
   |  Stiel Pflanze Pflanze
   deriving (Show, Eq)
   
myplant = Stiel Blatt (Stiel Blatt (Blute Rot))
shortplant = Blatt
main = myplant

foldp :: (a -> a -> a) -> (Farbe -> a) -> a -> Pflanze -> a
foldp _ _ acc fl | trace ("myfun " ++ show acc ++ " " ++ show fl) a = undefined
foldp f _ acc Blatt = Blatt
foldp f col acc (Stiel x y) = foldp f col (foldp f col acc x) y
foldp f col acc (Blute x) = col x
  
colorblind :: Farbe -> Pflanze
colorblind f = Blute f

colorvalue :: (Num x) => Farbe -> x
colorvalue _ = 0
  
printplant :: Pflanze -> a -> Pflanze
printplant p _ = p


-- foldp f (Stiel y z) = g where
--  g (Stiel l r) = f l (g r)
--  g Blatt = y
--  g (Blute b) = Blute b