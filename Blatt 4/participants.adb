package body Participants is
   function Open (Event : String) return Database is
   begin
      raise Unknown_Event;
      return Database'(Closed => True);
   end Open;

   procedure Add (D : in out Database; P : Persons.Person) is
   begin
      raise Event_Full;
   end Add;

   procedure Close (D : in out Database) is
   begin
      D.Closed := True;
   end Close;
end Participants;