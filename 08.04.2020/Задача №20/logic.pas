unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;


procedure result;
procedure save_report;
procedure save_file(Var f:Text);
procedure open_file(Var f:Text);

implementation

uses Unit1;

procedure result;
var b,a,n,d,sum,i:integer;
begin
a:=strtoint(Main.edit_a.text);
n:=strtoint(Main.edit_n.text);
d:=strtoint(Main.edit_d.text);
sum:=0;
b:=a;
for i:=1 to n do
    begin
      sum:=sum+a;
      a:=a+d;
    end;
Main.memo_sum.lines.add('A= '+inttostr(b)+#13+#10+
                       'N= '+inttostr(n)+#13+#10+
                       'D= '+inttostr(d)+#13+#10+
                       'Сумма членов арифметической прогрессии: '+inttostr(sum)+#13+#10);
end;

procedure save_report;
var Fname:string;
begin
  if not Main.SaveDialog1.Execute then exit;
  Fname:= Main.SaveDialog1.FileName;
  Main.Memo_sum.Lines.SaveToFile(Fname);
end;

procedure save_file(Var f:Text);
var Fname:string;
begin
 if not Main.SaveDialog1.Execute then exit;
 Fname:= Main.SaveDialog1.FileName;
 AssignFile(f,Fname);
 Rewrite(f);
 Writeln(F,Main.edit_a.text);
 Writeln(F,Main.edit_n.text);
 Writeln(F,Main.edit_d.text);
 CloseFile(f);
end;

procedure open_file(Var f:Text);
var Fname,s:string;
begin
  if not Main.OpenDialog1.Execute then exit;
  Fname:= Main.OpenDialog1.FileName;
  AssignFile(f,Fname);
  Reset(f);
  Readln(f,s);
  Main.Edit_A.Text:=s;
  Readln(f,s);
  Main.Edit_n.Text:=s;
  Readln(f,s);
  Main.Edit_d.Text:=s;
end;


end.

