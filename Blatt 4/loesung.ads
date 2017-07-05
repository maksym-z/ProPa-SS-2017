package Loesung is
   type Antworten is
     (J,   --  Ja, die Zeile kann sich ändern
      N,   --  Nein, die Zeile kann sich nicht ändern
      E);  --  Ich weiß nicht, ob die Zeile sich ändern kann
   type Aufgaben is new Positive range 1 .. 10;
   type Zeilen is new Positive range 1 .. 5;

   function Get (A : Aufgaben; Z : Zeilen) return Antworten;
end Loesung;
