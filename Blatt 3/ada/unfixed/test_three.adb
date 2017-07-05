with Datums;
with Smart_Pointers;
with Ada.Text_IO;


procedure Test_Five is
   use Smart_Pointers;

   procedure Assert
     (B : Boolean;
      S : String := "")
   is begin
      if (B) then
         Ada.Text_IO.Put_Line ("Good " & S);
      else
         Ada.Text_IO.Put_Line ("FAILED " & S);
      end if;
   end Assert;

   A : Smart_Pointer;
   B : Smart_Pointer;
   C : Smart_Pointer;
begin
   Smart_Pointers.Create (A);
   Smart_Pointers.Assign (A, B);
   Smart_Pointers.Release (B);
   Smart_Pointers.Print (A);
   Smart_Pointers.Print (B);
   Assert (Is_Null (B));
end Test_Five;
