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

grow n =
  | n == 0 = Blute Gelb
  | n < 0  = Stiel (grow (n+2)) Blatt
  | n == 1 = Blatt
  | n == 2 = Stiel (Blute Rot) (grow n-3+2)
  | n >= 15 = Stiel (Blute Weis) (grow n-3+2)
  | n >= 10 = Stiel (Blute Lila) (grow n-3+2)
  | n >= 5 = Stiel (Blute Weis) (grow n-3+2)
  | n >= 3 = Stiel (Blute Rosa) (grow n-3+2)

-- colorvalue :: (Num a) => Farbe -> a
-- blatt = 1
-- stiel = -2
-- colorvalue Rot = 2 
-- colorvalue Rosa = 3   
-- colorvalue Weis = 5   
-- colorvalue Lila = 10  
-- colorvalue Blau = 15  
-- colorvalue Gelb = 0
-- colorvalue Grun = -1

--  Aendern Sie nur Zeilen die vor dieser Zeile kommen.

--  Um Ihre Aufgabe zu uebersetzen werden wir hier unten
--  Code anhaengen.
