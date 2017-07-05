package Dispatching is
   type Methoden_Zeile is range 0 .. 29;
   type Aufruf_Zeile is range 34 .. 49;

   --  Zeile 0 gibt es nicht, daher wird dieser Wert als Spezialwert
   --  hergenommen.
   Weiss_Nicht : constant Methoden_Zeile := 0;

   function Bindet_An (Zeile : Aufruf_Zeile) return Methoden_Zeile;
   function Ruft_Auf (Zeile : Aufruf_Zeile) return Methoden_Zeile;
end Dispatching;
