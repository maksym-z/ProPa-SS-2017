package body Persons is
   function Mother   (P : Person) return Person is
   begin
      if P.Mother = null then
         raise Unknown_Mother;
      end if;
      return P.Mother.all;
   end Mother;

   function Agrees   (P : Person) return Boolean is
   begin
      return P.Is_Kind;
   end Agrees;
end Persons;