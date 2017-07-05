package body Sichtbarkeit is
   --  Aendern Sie die Deklarationen nicht!
   L : array (Aussagen) of Antworten;

   --  Aendern Sie die Funktion nicht!
   function Get (A : Aussagen) return Antworten is
   begin
      return L (A);
   end Get;
begin
   --  Tragen Sie hier Ihre Antworten ein:
   --  Aendern Sie nur die Enum-Werte, sonnst nichts!

   L (1) := F;
   L (2) := W;
   L (3) := W;
   L (4) := F;
   L (5) := W;
   L (6) := W;
   L (7) := F;
   L (8) := W;

end Sichtbarkeit;
