
data Farbe = Rot | Rosa | Weis | Blau | Lila | Grun | Gelb
   deriving (Show, Eq)

data Pflanze =
      Blatt
   |  Blute Farbe
   |  Stiel Pflanze Pflanze
   deriving (Show, Eq)
