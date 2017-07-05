with Datums;


package Smart_Pointers is
   type Smart_Pointer is limited private;

   --  Returns a Smart_Pointer pointing to a newly allocated Datum.
   procedure Create (X : in out Smart_Pointer);

   --  Returns a Smart_Pointer pointing to nothing.
   function Null_Pointer return Smart_Pointer;

   --  Returns True iff X is a Null_Pointer
   function Is_Null (X : in     Smart_Pointer) return Boolean;


   --  After Assigning From to To, To points to the same Object as From
   procedure Assign
     (From : in     Smart_Pointer;
      To   : in out Smart_Pointer);

   --  Releases the Pointer. X will now be a Null_Pointer.
   procedure Release (X : in out Smart_Pointer);

   --  Prints the Object, that X points to.
   --  If Is_Null (X) this wil print an error message
   procedure Print (X : in Smart_Pointer);

private
   type Info is
      record
         Reference_Count : Integer;
         D               : Datums.XDatum;
      end record;

   --  Smart Pointers are initialized to null. (!)
   type Smart_Pointer is access Info;

end Smart_Pointers;
