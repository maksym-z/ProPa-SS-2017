with Datums;
with Smart_Pointers;
with Ada.Text_IO;


procedure My_Test is
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
begin
   Assert (Is_Null (Null_Pointer));

   Assert (Is_Null (A));

   Assign (Null_Pointer, A);
   Assert (Is_Null (A));

   Smart_Pointers.Create (A);
   Smart_Pointers.Create (B);
   
   Assign (B, A);
   
   Assert (not Is_Null (A));
   Release (B);
   Assert (Is_Null (B));
   Assert (Is_Null (A));
end My_Test;
