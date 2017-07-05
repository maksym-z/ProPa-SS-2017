with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
    X : Integer := 2;
    Y : Integer := 5;
    Z : Integer := 1;
    A : array (1..5) of Integer := (2, 3, 1, 4, 5);
    procedure G (X : in out Integer ; Y : in out Integer ) is begin
        Put("G:");
        Put(X);
        Put(Y);
        new_line(1);
        A ( Y ) := A (A(Y));
        Z := X;
        Y := Y + X ;
        Put("Exit from G");
        Put(X);
        Put(Y);
        Put(Z);new_line(1);
    Put (A(1)); Put (A(2)); Put (A(3)); Put (A(4)); Put (A(5));
        new_line(1);
    end G;

    procedure F (X : in out Integer ; Y : in out Integer ) is
        Z : Integer := 2 ;
    begin
        Put("F:");
        Put(X);
        Put(Y);
        X := A (Z) ;
        Y := A (X) ;
        G(X,Z);
        A (X) := A ( Z ) ;
        Put("Exit from F");
        Put(X);
        Put(Y);
        Put(Z);
        new_line(1);
    Put (A(1)); Put (A(2)); Put (A(3)); Put (A(4)); Put (A(5));new_line(1);
    end F ;
begin
    F ( Z , A ( Y ) ) ;
    Put (X) ; Put ( Z ) ; new_line(1);
    Put (A(1)); Put (A(2)); Put (A(3)); Put (A(4)); Put (A(5));
end Hello;