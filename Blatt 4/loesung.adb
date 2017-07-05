package body Loesung is
   --  Aendern Sie die Deklarationen nicht!
   type Zeile is array (Zeilen) of Antworten;

   L : array (Aufgaben) of Zeile := (others => (others => E));

   --  Aendern Sie die Funktion nicht!
   function Get (A : Aufgaben; Z : Zeilen) return Antworten is begin
      return L (A) (Z);
   end Get;
begin
   --  Tragen Sie hier Ihre Antworten ein:
   --  Aendern Sie nur die Enum-Werte, sonnst nichts!

   --  TA (A);
   L (1)  := (N, N, N, N, N);

   --  TA (B);
   L (2)  := (N, N, N, N, N);


   --  TB (A);
   L (3)  := (J, N, N, J, N);

   --  TB (B);
   L (4)  := (N, J, J, J, N);


   --  TC (C);
   L (5)  := (J, J, J, J, J);

   --  TC (D);
   L (6)  := (N, J, J, J, N);


   --  TD (A'Access);
   L (7)  := (J, J, J, J, J);

   --  TD (B'Access);
   L (8)  := (N, J, N, J, N);


   --  TE (C);
   L (9)  := (J, J, J, J, J);

   --  TE (D);
   L (10) := (N, J, J, J, N);
end Loesung;
