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