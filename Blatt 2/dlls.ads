package DLLs is
   type DLL is private;

   function Create_List return DLL;

   procedure Add_At_End (L : in DLL; X : in Positive);

   --  Weitere Funktionen werden hier ausgelassen

private
   type Cell;
   type DLL is access Cell;

   type Cell is
      record
         Data     : Positive;
         Forward  : DLL;
         Backward : DLL;
      end record;
end DLLs;
