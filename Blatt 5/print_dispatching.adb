with Dispatching; use Dispatching;
with Ada.Text_IO; use Ada.Text_IO;

procedure Print_Dispatching is
   Nicht_Beantwortet : Natural := 0;
begin
   for Aufruf in Aufruf_Zeile loop
      declare
         Bindet : constant Methoden_Zeile := Bindet_An (Aufruf);
         Ruft   : constant Methoden_Zeile := Ruft_Auf (Aufruf);
      begin
         if Bindet /= Weiss_Nicht then
            Put ("Der Aufruf in Zeile" & Aufruf'Img & " bindet an Zeile" &
              Bindet'Img);
            if Ruft /= Weiss_Nicht then
               Put_Line (" und ruft Zeile" & Ruft'Img & " auf.");
            else
               Nicht_Beantwortet := Nicht_Beantwortet + 1;
               Put_Line (".");
            end if;
         elsif Ruft /= Weiss_Nicht then
            Nicht_Beantwortet := Nicht_Beantwortet + 1;
            Put_Line ("Der Aufruf in Zeile" & Aufruf'Img & " ruft Zeile" &
                      Ruft'Img & " auf.");
         else
            Nicht_Beantwortet := Nicht_Beantwortet + 2;
         end if;
      end;
   end loop;
   if Nicht_Beantwortet > 0 then
      Put_Line ("Es wurde(n)" & Nicht_Beantwortet'Img &
                " Frage(n) nicht beantwortet.");
   end if;
end Print_Dispatching;