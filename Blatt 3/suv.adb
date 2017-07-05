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

   function Solve return Long is
      --  Sie koennen hier  Definitionen einfuegen.
   begin
      --  Implementieren Sie diese Funktion
      --  Greifen Sie dabei auf Stopps und Etappen zu.
      return 0;
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
