package body Dispatching is
   type Antwort is record
      Bindet_An, Ruft_Auf : Methoden_Zeile;
   end record;

   L : array (Aufruf_Zeile) of Antwort;

   function Bindet_An (Zeile : Aufruf_Zeile) return Methoden_Zeile is
   begin
      return L (Zeile).Bindet_An;
   end Bindet_An;

   function Ruft_Auf (Zeile : Aufruf_Zeile) return Methoden_Zeile is
   begin
      return L (Zeile).Ruft_Auf;
   end Ruft_Auf;
begin
   --  'Weiss_Nicht' durch die korrekte Zeilennummer der Methodendeklaration
   --  ersetzen. Die Zahlen vorne sind die Aufrufzeilen.
   L (34) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (35) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (36) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (37) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (38) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (39) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (40) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (41) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (42) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (43) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (44) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (45) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (46) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (47) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (48) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
   L (49) := (Bindet_An => Weiss_Nicht, Ruft_Auf => Weiss_Nicht);
end Dispatching;