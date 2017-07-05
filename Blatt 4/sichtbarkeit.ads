package Sichtbarkeit is
   type Antworten is
     (W,   --  Aussage ist wahr
      F,   --  Aussage ist falsch
      E);  --  Ich kann den Wahrheitsgehalt der Aussage nicht bewerten
   type Aussagen is new Positive range 1 .. 8;

   function Get (A : Aussagen) return Antworten;
end Sichtbarkeit;
