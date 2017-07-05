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
testplant =  Stiel (Stiel (Blute Rot)(Blute Grun)) (Stiel (Blute Blau)(Blute Gelb)) 
aFuckingUglyPlant = Stiel (Stiel (Blute Grun)(Blute Grun)) (Stiel (Blute Grun)(Blute Grun)) -- apparently, green flowers are from hell
-- main = myplant

foldp :: (a -> a -> a) -> (Farbe -> a) -> a -> Pflanze -> a -- dont forget to rename if this shit ever works
foldp _ _ acc fl | trace ("folding flower " ++ show fl) False = undefined
foldp f _ acc Blatt = acc
foldp f col acc (Stiel x y) = f (foldp f col acc x) (foldp f col acc y)
-- foldp f col acc (Stiel x y) = foldp f col (foldp f col acc x) y
foldp f col acc (Blute x) = col x
  
colorblind :: Farbe -> Integer
colorblind _ = 0

colorvalue :: (Num a) => Farbe -> a
colorvalue Rot = 2	
colorvalue Rosa = 3	-- Roses red and roses white
colorvalue Weis = 5	-- Plucked I for my love's delight
colorvalue Lila = 10	-- She would none of all my poses,
colorvalue Blau = 15	-- Bade me gather her blue roses.
colorvalue Gelb = 0
colorvalue Grun = -1
  
-- colorvalue Blatt = 1
-- colorvalue (Stiel _ _) = -2
-- colorvalue (Blute n) = g n where

schonheit :: Pflanze -> Integer
schonheit x = foldp (+) colorvalue 0 x


  
printplant :: Pflanze -> a -> Pflanze
printplant p _ = p


-- eg foldp printplant colorblind shortplant myplant
-- foldp f (Stiel y z) = g where
--  g (Stiel l r) = f l (g r)
--  g Blatt = y
--  g (Blute b) = Blute b