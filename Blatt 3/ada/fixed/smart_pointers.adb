with Ada.Text_IO;


package body Smart_Pointers is
   procedure Create (X : in out Smart_Pointer) is begin
      Release (X);

      X := new Info'(1, Datums.Allocate);
   end Create;

   function Null_Pointer return Smart_Pointer is begin
      return null;
   end Null_Pointer;

   function Is_Null (X : in Smart_Pointer) return Boolean is
      use type Datums.XDatum;
   begin
      return X=null or else X.Reference_Count = 0;
   end Is_Null;

   procedure Print (X : in Smart_Pointer) is begin
      if (X = null) then
         Ada.Text_IO.Put_Line ("ERROR: Printing Null-Pointer");
      else
         Datums.Print (X.D);
      end if;
   end Print;

   procedure Dec (X : in Smart_Pointer) is begin
      if (X = null) then return; end if;

      X.Reference_Count := X.Reference_Count - 1;

      if (X.Reference_Count = 0) then
         Datums.Free (X.D);
      end if;
   end Dec;

   procedure Assign
     (From : in     Smart_Pointer;
      To   : in out Smart_Pointer)
   is begin
      Dec (To);
      if (From /= null) then
         From.Reference_Count := From.Reference_Count + 1;
      end if;
      To := From;
   end Assign;

   procedure Release (X : in out Smart_Pointer) is begin
      Dec (X);
      Assign (null, X);
   end Release;
end Smart_Pointers;
