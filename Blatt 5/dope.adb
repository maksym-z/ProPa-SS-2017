with Ada.Text_IO;
with System;

procedure Dope is
   type String_Access_1 is access String;

   type String_Access_2 is access String;
   for String_Access_2'Size use Standard'Address_Size;

   use Ada.Text_IO;

   SA_1_Size : constant Integer := String_Access_1'Size / System.Storage_Unit;
   SA_2_Size : constant Integer := String_Access_2'Size / System.Storage_Unit;

   String_1 : String_Access_1 := new String'(3 => 'a', 4 => 'b', 5 => 'c');
   String_2 : String_Access_2 := new String'(10 => 'c', 11 => 'd');
begin
   Put_Line ("String_1 range: (" &
     String_1'First'Img & " .." & String_1'Last'Img & ')');
   Put_Line ("String_2 range: (" &
     String_2'First'Img & " .." & String_2'Last'Img & ')');
   Put_Line ("String_Access_1'Size:" & SA_1_Size'Img);
   Put_Line ("String_Access_2'Size:" & SA_2_Size'Img);
end Dope;