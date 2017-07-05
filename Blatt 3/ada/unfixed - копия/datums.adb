with Ada.Text_IO;


package body Datums is
   Count : Natural := 0;

   function Allocate return XDatum is begin
      Count := Count + 1;
      Ada.Text_IO.Put_Line
        ("Allocate object" & Integer'Image (Count));
      return new Datum'(Count, True);
   end Allocate;

   procedure Free (X : in out XDatum) is begin
      pragma Unmodified (X);

      if (X.Alive) then
         Ada.Text_IO.Put_Line
           ("Free object" & Integer'Image (X.Num));
         X.Alive := False;
      else
         Ada.Text_IO.Put_Line
           ("ERROR: Double deallocation" & Integer'Image (X.Num));
      end if;
   end Free;

   procedure Print (X : in    XDatum) is begin
      if (X.Alive) then
         Ada.Text_IO.Put_Line
           ("Printing object" & Integer'Image (X.Num));
      else
         Ada.Text_IO.Put_Line
           ("ERROR: Printing deallocated object" & Integer'Image (X.Num));
      end if;
   end Print;



end Datums;
