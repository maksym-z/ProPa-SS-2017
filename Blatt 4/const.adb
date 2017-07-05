with Ada.Text_IO;

procedure Const is
   type Cell;
   type XCell is access constant Cell;
   type Cell is
      record
         Num    : Positive := 17;
         Friend : XCell;
      end record;

   procedure TA (X : in Cell) is begin null; end TA;
   procedure TB (X : in out Cell) is begin null; end TB;
   procedure TC (X : in XCell) is begin null; end TC;
   procedure TD (X : not null access Cell) is begin null; end TD;
   procedure TE (X : in out XCell) is begin null; end TE;

   A : aliased Cell;
   B : aliased Cell;
   C : aliased XCell := A'Access;
   D : aliased XCell := B'Access;

   procedure Print is begin
      Ada.Text_IO.Put_Line ("  1: " & Positive'Image (A.Num));
      Ada.Text_IO.Put_Line ("  2: " & Positive'Image (B.Num));

      if (A.Friend /= null) then
         Ada.Text_IO.Put_Line ("  3: " & Positive'Image (A.Friend.Num));
      else
         Ada.Text_IO.Put_Line ("  3: A.Friend = Null");
      end if;

      if (B.Friend /= null) then
         Ada.Text_IO.Put_Line ("  4: " & Positive'Image (B.Friend.Num));
      else
         Ada.Text_IO.Put_Line ("  4: B.Friend = null");
      end if;

      if (A.Friend = D) then
         Ada.Text_IO.Put_Line ("  5: Identical");
      else
         Ada.Text_IO.Put_Line ("  5: Not Identical");
      end if;
   end Print;

   procedure Reset is begin
      C := A'Access;
      D := B'Access;
      A := (1, D);
      B := (2, null);
   end Reset;
begin
   Reset;
   Print;
   TA (A);
   Print;

   Reset;
   Print;
   TA (B);
   Print;


   Reset;
   Print;
   TB (A);
   Print;

   Reset;
   Print;
   TB (B);
   Print;


   Reset;
   Print;
   TC (C);
   Print;

   Reset;
   Print;
   TC (D);
   Print;


   Reset;
   Print;
   TD (A'Access);
   Print;

   Reset;
   Print;
   TD (B'Access);
   Print;


   Reset;
   Print;
   TE (C);
   Print;

   Reset;
   Print;
   TE (D);
   Print;
end Const;


