data Farbe = Rot | Rosa | Weis | Blau | Lila | Grun | Gelb
  deriving (Show, Eq)

data Pflanze =
      Blatt
   |  Blute Farbe
   |  Stiel Pflanze Pflanze
   deriving (Show, Eq)

-- Aufgabe 6.1.1, eine Pflanze mit zwei Blaettern und einer roten Bluete
myplant = Stiel Blatt (Stiel Blatt (Blute Rot))

-- Aufgabe 6.1.2
fold_pflanze :: (a -> a -> a) -> (Farbe -> a) -> a -> Pflanze -> a
fold_pflanze f _ a Blatt = a
fold_pflanze f c a (Stiel x y) = f (fold_pflanze f c a x)
                                (fold_pflanze f c a y)
fold_pflanze f c a (Blute x) = c x

-- Dummy function that ignores flower colors
colorblind _ = 0

-- Aufgabe 6.1.3
blattanzahl :: Pflanze -> Integer
blattanzahl Blatt = 1
blattanzahl x = fold_pflanze (+) colorblind 1 x

-- Aufgabe 6.1.4
blutenfarben :: Pflanze -> [Farbe]
blutenfarben x = fold_pflanze (++) g [] x where
  g n = [n]

-- Aufgabe 6.1.5
colorvalue :: (Num a) => Farbe -> a
colorvalue Rot = 2 
colorvalue Weis = 5  -- Roses red and roses white
colorvalue Rosa = 3  -- Plucked I for my love's delight.
colorvalue Lila = 10 -- She would none of all my posies,
colorvalue Blau = 15 -- Bade me gather her blue roses.
colorvalue Gelb = 0
colorvalue Grun = -1

-- Helper functions for the schonheit function
totalcolorvalue :: Pflanze -> Integer
totalcolorvalue x = (fold_pflanze (+) colorvalue 0 x)
colorblind1 _ = 1
flowercount x = (fold_pflanze (+) colorblind1 0 x)

--  In a full binary tree with L leaves, there are I = L – 1 internal nodes.
--  Since there are no empty plants, our trees are always full.
schonheit :: Pflanze -> Integer
schonheit x = (totalcolorvalue x) + (blattanzahl x) 
              - 2 * ((blattanzahl x + flowercount x) - 1)

-- Aufgabe 6.1.6
pinkflower Rosa = True
pinkflower _ = False

rosabluhend :: Pflanze -> Bool
rosabluhend x = fold_pflanze (&&) pinkflower True x