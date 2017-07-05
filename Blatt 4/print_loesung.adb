with Loesung;
with Ada.Text_IO;

procedure Print_Loesung is
   use Loesung;
   C : Natural := 0;
   P : Integer;
   Antwort : Antworten;
begin
   Ada.Text_IO.Put_Line ("Ihre Antworten lauten: ");

   for A in Aufgaben loop
      for Z in Zeilen loop
         Antwort := Get (A, Z);
         if (Antwort = E) then
            C := C + 1;
         end if;
         Ada.Text_IO.Put (Antworten'Image (Antwort) & "  ");
      end loop;
         Ada.Text_IO.New_Line;
   end loop;

   Ada.Text_IO.New_Line;

   P := 5 - (C + 9) / 10;
   P := Integer'Max (P, 0);

   Ada.Text_IO.Put_Line
     ("Sie haben" &
      Integer'Image (C) &
      " Fragen nicht beantwortet.");
   Ada.Text_IO.Put_Line
     ("Wenn alle anderen Antworten richtig " &
      "sind, erhalten Sie bei dieser Aufgabe" &
      Integer'Image (P) &
      " Punkte");
end Print_Loesung;
