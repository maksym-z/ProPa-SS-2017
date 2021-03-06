import System.Environment

data Farbe = Rot | Rosa | Weis | Blau | Lila | Grun | Gelb
   deriving (Show, Eq)

data Pflanze =
      Blatt
   |  Blute Farbe
   |  Stiel Pflanze Pflanze
   deriving (Show, Eq)

grow :: Integer -> Pflanze

--  Aendern Sie nur Zeilen die nach dieser Zeile kommen.

-- Left-heavy, slightly greedy, mostly blue flowers of specified beauty.
-- Free delivery! Sometimes free extra stems for additional bushiness!

grow n
  | n == 0 = Blute Gelb
  | n < 0  = Stiel (grow (n+2)) (Blute Gelb)
  | n == 1 = Blatt
  | n == 2 = Blute Rot
  | n >= 15 = Stiel (Blute Blau) (grow (n-15+2))
  | n >= 10 = Stiel (Blute Lila) (grow (n-10+2))
  | n >= 5 = Stiel (Blute Weis) (grow (n-5+2))
  | n >= 3 = Stiel (Blute Rosa) (grow (n-3+2))

--  Aendern Sie nur Zeilen die vor dieser Zeile kommen.

--  Um Ihre Aufgabe zu uebersetzen werden wir hier unten
--  Code anhaengen.

-- DELETE ME
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
colorvalue Rosa = 3   -- Roses red and roses white
colorvalue Weis = 5   -- Plucked I for my love's delight.
colorvalue Lila = 10  -- She would none of all my posies,
colorvalue Blau = 15  -- Bade me gather her blue roses.
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