with Persons;

package Participants is
   Unknown_Event, Event_Full : exception;

   type Database is private;

   function Open (Event : String) return Database;
   procedure Add (D : in out Database; P : Persons.Person);
   procedure Close (D : in out Database);
private
   type Database is record
      Closed : Boolean;
   end record;
end Participants;