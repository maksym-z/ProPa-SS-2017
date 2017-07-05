package Persons is
   Unknown_Mother : exception;

   type Person is private;

   function Mother (P : Person) return Person;
   function Agrees (P : Person) return Boolean;
private
   type Person is record
      Mother  : access Person;
      Is_Kind : Boolean;
   end record;
end Persons;