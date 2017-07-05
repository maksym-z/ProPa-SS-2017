
package body DLLs is

   function Create_List return DLL is
      R : constant DLL := new Cell'(1, null, null);
   begin
      R.Forward := R;
      R.Backward := R;

      return R;
   end Create_List;

   procedure Add_At_End (L : in DLL; X : in Positive) is
      N : DLL;
   begin
      pragma Assert (L /= null);
      pragma Assert (L.Backward.Forward = L);

      N := new Cell'(Data => X, Forward => L, Backward => L.Backward);

      L.Backward.Forward := N;
      L.Backward := N;
   end Add_At_End;

   procedure Remove_Between (From : in DLL; To : in DLL) is
      --  Es muss garantiert sein, dass From vor To in der Liste steht.
      --  Insbesondere liegt also der Dummy-Node nicht zwischen From und To.
   begin
      From.Forward := To;
      To.Backward := From;
   end Remove_Between;


   --  Weitere Funktionen werden hier ausgelassen

end DLLs;
