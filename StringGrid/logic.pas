unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
type
  prog=record
  a,n,d,sum:integer;
	end;

  massive= array[1..127] of prog;


Function sum(mas:massive; a,j:integer):integer;
procedure save_file(Var f:Text; name:string; a,b,c,j:integer);
procedure open_file(Var f:Text; name:string; a,b,c,j:integer);

implementation


Function sum(mas:massive; a,j:integer):integer;
var i:integer;
begin
sum:=0;
a:=mas[j].a;
for i:=1 to mas[j].n do
    begin
      sum:=sum+mas[j].a;
      mas[j].a:=mas[j].a+mas[j].d;
    end;
end;


procedure save_file(Var f:Text; name:string; a,b,c,j:integer);
begin
 AssignFile(f,name);
 Rewrite(f);
 Writeln(f,a);
 Writeln(F,b);
 Writeln(f,c);
 CloseFile(f);
end;

procedure open_file(Var f:Text; name:string; a,b,c,j:integer);
begin
  AssignFile(f,name);
  Reset(f);
  Readln(f,a);
  Readln(f,b);
  Readln(f,c);
  closeFile(f);
end;


end.

