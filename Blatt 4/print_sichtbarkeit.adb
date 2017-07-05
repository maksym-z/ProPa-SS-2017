with Sichtbarkeit;
with Ada.Text_IO;

procedure Print_Sichtbarkeit is
   use Sichtbarkeit;
   C : Natural := 0;
   P : Integer;
   Antwort : Antworten;
begin
   Ada.Text_IO.Put_Line ("Ihre Antworten lauten: ");

   for A in Aussagen loop
      Antwort := Get (A);
      if (Antwort = E) then
         C := C + 1;
      end if;
      Ada.Text_IO.Put_Line
        (Aussagen'Image (A) & ": " & Antworten'Image (Antwort));
   end loop;

   Ada.Text_IO.New_Line;

   P := Integer'Max (4 - (C + 1) / 2, 0);

   Ada.Text_IO.Put_Line
     ("Sie haben" &
      Integer'Image (C) &
      " Fragen nicht beantwortet.");
   Ada.Text_IO.Put_Line
     ("Wenn alle anderen Antworten richtig " &
      "sind, erhalten Sie bei dieser Aufgabe" &
      Integer'Image (P) &
      " Punkte");
end Print_Sichtbarkeit;
