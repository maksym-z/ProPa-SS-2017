with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Long_Long_Integer_Text_IO;
--  Sie duerfen weitere Imports angeben.
--  Ich empfehle dies nicht zu tun.

procedure Suv is
   subtype Long is Long_Long_Integer range 0 .. Long_Long_Integer'Last;
   type Integer_Array is array (Integer range <>) of Long;
   type XInteger_Array is access Integer_Array;

   File           : Ada.Text_IO.File_Type;
   Stopps         : Long;
   Etappen        : XInteger_Array;

   --  Diese Variablen werden sinnvoll belegt.
   --  Sie können sie Nutzen, wenn es Ihnen hilft.
   Gesamtstrecke  : Long := 0;
   Langste_Etappe : Long := 0;

   --  Sie koennen hier (vorsichtig) weitere Definitionen einfuegen.

   --  Similarly to the assignment from Exercise 2,
   --  check if the entire path can be covered with the given number of stops
   function Can_Cut (Parts : Long; Cut_Size : Long) return Boolean is
      Current_Prefix : Long := 0;
      Current_Parts : Long := 1;
   begin
      for I in Etappen'Range loop
         if Current_Prefix + Etappen (I) <= Cut_Size then
            Current_Prefix := Current_Prefix + Etappen (I);
         elsif Etappen (I) <= Cut_Size then
            Current_Prefix := Etappen (I);
            Current_Parts := Current_Parts + 1;
         end if;
      end loop;
      return Current_Parts <= Parts;
   end Can_Cut;

   --  Determine the smallest possible tank capacity by binary search.
   function Partition (Minimum, Maximum, Parts : in Long) return Long is
      Middle : Long;
   begin
      if Minimum = Maximum then
         return Minimum;
      else
         Middle := (Maximum - Minimum) / 2 + Minimum;
         if Can_Cut (Parts, Middle) then
            return Partition (Minimum, Middle, Parts);
         else
            return Partition (Middle + 1, Maximum, Parts);
         end if;
      end if;
   end Partition;

   function Solve return Long is
      --  Sie koennen hier  Definitionen einfuegen.
   begin
      --  Implementieren Sie diese Funktion
      --  Greifen Sie dabei auf Stopps und Etappen zu.
      return Partition (Langste_Etappe, Gesamtstrecke, Stopps + 1);
   end Solve;


begin
   if Ada.Command_Line.Argument_Count = 1 then
      Ada.Text_IO.Open (File,
                        Ada.Text_IO.In_File,
                        Ada.Command_Line.Argument (1));

      --  Zahl der Etappen einlesen und Array entsprechend dimensionieren
      declare
         Line : constant String := Ada.Text_IO.Get_Line (File);
      begin
         Etappen := new Integer_Array (1 .. Integer'Value (Line));
      end;

      --  Zahl der TanksStopps einlesen (Tankstopps = Tage - 1)
      declare
         Line : constant String := Ada.Text_IO.Get_Line (File);
      begin
         Stopps := Long'Value (Line) - 1;
      end;

      for I in Etappen'Range loop
         declare
            Line : constant String := Ada.Text_IO.Get_Line (File);
         begin
            Etappen (I) := Long'Value (Line);
            Gesamtstrecke := Gesamtstrecke + Etappen (I);
            Langste_Etappe := Long'Max (Langste_Etappe, Etappen (I));
         end;
      end loop;

      Ada.Text_IO.Put ("Minimale benoetigte Kapazitaet: ");
      Ada.Long_Long_Integer_Text_IO.Put (Solve);
      Ada.Text_IO.New_Line;
   else
      Ada.Text_IO.Put_Line
        ("Bitte genau ein Argument mit dem Eingabedateinamen uebergeben.");
   end if;
end Suv;
