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
begin
   Assert (Is_Null (Null_Pointer));
end Test_Five;
