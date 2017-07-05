with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Drei is
   subtype Result is Natural range 0 .. 10;
   type Numbers is array (Integer range <>) of Result;

   function Numbers_From_Command_Line return Numbers is
      use Ada.Command_Line;
   begin
      return Values : Numbers (1 .. Argument_Count) do
         for I in 1 .. Argument_Count loop
            Values (I) := Result'Value (Argument (I));
         end loop;
      end return;
   end Numbers_From_Command_Line;

   function Mean (Numbers_to_Average: Numbers) return Result is
      Sum : Integer := 0;
   begin
      for I in Numbers_to_Average'range loop
            Sum := Sum + Numbers_to_Average (I);
      end loop;
      return Sum / Numbers_to_Average'Length;
   end Mean;


   Points : constant Numbers := Numbers_From_Command_Line;
   Average : Result;
begin
   Ada.Text_IO.Put_Line ("Got the following arguments:");
   for I in Points'Range loop
      Ada.Text_IO.Put (" - ");
      Ada.Integer_Text_IO.Put (Points (I), Ada.Text_IO.Field'First);
      Ada.Text_IO.New_Line;
   end loop;
   Average := Mean (Points);
   Ada.Integer_Text_IO.Put (Average, Ada.Text_IO.Field'First);
   Ada.Text_IO.New_Line;
   if Average >= Result'Last /2 then
      Ada.Text_IO.Put ("Ja");
   else
      Ada.Text_IO.Put ("Nein");
   end if;
end Drei;
