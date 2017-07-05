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

grow = const Blatt

--  Aendern Sie nur Zeilen die vor dieser Zeile kommen.

--  Um Ihre Aufgabe zu uebersetzen werden wir hier unten
--  Code anhaengen.
