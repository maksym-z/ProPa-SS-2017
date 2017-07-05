

package Datums is

   type Datum is private;
   type XDatum is access Datum;


   --  Heap-Allocates a new Datum
   function Allocate return XDatum;

   --  Deallocates the Datum
   procedure Free (X : in out XDatum);

   --  Prints the Datum
   procedure Print (X : in    XDatum);

private
   type Datum is
     record
      Num   : Positive;
      Alive : Boolean;
     end record;
end Datums;
