unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;


function calc_v(a:integer):integer;
function calc_s(a:integer):integer;
procedure save_file(Var f:Text; name:string; a:integer);
procedure open_file(Var f:Text; name:string; a:integer);


implementation

uses Unit1;

function calc_v(a:integer):integer;
begin
v:=a*a*a;
s:=4*a*a;
end;

function calc_s(a:integer):integer;
begin
s:=4*a*a;
end;


procedure save_file(Var f:Text; name:string; a:integer);
begin
 AssignFile(f,name);
 Rewrite(f);
 Writeln(F,a);
 CloseFile(f);
end;

procedure open_file(Var f:Text; name:string; a:integer);
var Fname,s:string;
begin
  AssignFile(F,name);
  Reset(f);
  Readln(F,a);
end;


end.

