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
testplant = (Stiel (Blute Rot) Blatt)
-- main = myplant

foldp :: (a -> a -> a) -> (Farbe -> a) -> a -> Pflanze -> a
foldp _ _ acc fl | trace ("folding flower " ++ show fl) False = undefined
foldp f _ acc Blatt = acc
foldp f col acc (Stiel x y) = foldp f col (foldp f col acc y) x 
foldp f col acc (Blute x) = col x
  
colorblind :: Farbe -> Pflanze
colorblind f = Blute f

colorvalue :: (Num a) => Farbe -> a
colorvalue Rot = 1
colorvalue x = 0
  
printplant :: Pflanze -> a -> Pflanze
printplant p _ = p


-- eg foldp printplant colorblind shortplant myplant
-- foldp f (Stiel y z) = g where
--  g (Stiel l r) = f l (g r)
--  g Blatt = y
--  g (Blute b) = Blute b