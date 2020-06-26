unit Unit1;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
      Logic,LCLtype;

type

			{ TMain }

      TMain = class(TForm)//класс формы (главного окна)
      {поля класса формы}
      Button_result: TButton;
      Edit_length: TEdit;
      Label1: TLabel;
      MainMenu1: TMainMenu;
      Memo_res: TMemo;
      MenuItem1: TMenuItem;
      MenuItem2: TMenuItem;
      MenuItem3: TMenuItem;
      MenuItem4: TMenuItem;
      MenuItem5: TMenuItem;
      MenuItem6: TMenuItem;
      OpenDialog1: TOpenDialog;
      SaveDialog1: TSaveDialog;

      procedure Button_resultClick(Sender: TObject);
			procedure FormCreate(Sender: TObject);
      procedure Label1Click(Sender: TObject);
      procedure Memo_resChange(Sender: TObject);
      procedure MenuItem2Click(Sender: TObject);
      procedure MenuItem3Click(Sender: TObject);
      procedure MenuItem4Click(Sender: TObject);
      procedure MenuItem5Click(Sender: TObject);
      procedure MenuItem6Click(Sender: TObject);
      private

      public

      end;

var
      Main: TMain;//объект (экземпляр) класса формы
      ftxt:Text;
      a,v,s:integer;
      fname:string;

implementation

{$R *.lfm}

{ TMain }
{Методы класса формы}
{Методы класса определяются в программе точно так же, как и обычные процедуры и функции,
за исключением того, что имя процедуры или функции, являющейся методом,
состоит из двух частей: имени класса, к которому принадлежит метод,
и имени метода. Имя класса от имени метода отделяется точкой.}
procedure TMain.Label1Click(Sender: TObject);
begin

end;

procedure TMain.Memo_resChange(Sender: TObject);
begin

end;

procedure TMain.MenuItem2Click(Sender: TObject);
begin
  if not Main.OpenDialog1.Execute then exit;
  if fname='' then
  begin
  Fname:= Main.OpenDialog1.FileName;
  open_file(ftxt,fname,a);
  Edit_length.Text:=inttostr(a);
	end
  else
  fname:='';
end;

procedure TMain.MenuItem3Click(Sender: TObject);
begin
  begin
  if (Edit_length.Text<>'') then
     begin
          if trystrtoint(Edit_length.Text,a) then
             begin
                  if not Main.SaveDialog1.Execute then exit;
                  if fname='' then
                     begin
                     Fname:= Main.SaveDialog1.FileName;
                     a:=strtoint(edit_length.Text);
                     save_file(ftxt,fname,a);
										 end
                  else
                  fname:='';
						 end
					else
            begin
              ShowMessage('Данные введены неверно');
              Edit_length.Text:='';
            end;
     end
  else
      showMessage('Сначала введите данные');
end;
end;

procedure TMain.MenuItem4Click(Sender: TObject);
begin
  if Memo_res.Lines.Count=0 then
    ShowMessage('Нет данных')
  else
    begin
    if not Main.SaveDialog1.Execute then exit;
    if fname='' then
    begin
    Fname:= Main.SaveDialog1.FileName;
		Main.Memo_res.Lines.SaveToFile(Fname);
    end
    else
    fname:='';
		end;
end;

procedure TMain.MenuItem5Click(Sender: TObject);
begin
ShowMessage('Автор: Щепетова Ольга' + #13 + #10 +
                      'Задача №3' + #13 + #10 +
                      'Дана длина ребра куба. Найти объём куба и площадь его боковой поверхности.'
                      + #13 + #10 +'http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z3');
end;

procedure TMain.MenuItem6Click(Sender: TObject);
var
ex:Word;
begin
ex:=Application.MessageBox('Вы хотите выйти?','Выход',MB_YESNO);
if ex=IDYES then
  application.Terminate;
end;

procedure TMain.Button_resultClick(Sender: TObject);
begin
  if (Edit_length.Text<>'') then
     begin
          if trystrtoint(Edit_length.Text,a) then
            begin
             a:=strtoint(edit_length.text);
             v:=calc_v(a);
             s:=calc_s(a);
             Memo_res.lines.add('Длина ребра куба: '+inttostr(a)+#13+#10+
                          'Обьем куба: '+inttostr(v)+#13+#10+
                          'Площадь боковой поверхности: '+inttostr(s)+#13+#10);
             end
          else
            begin
              ShowMessage('Данные введены неверно');
              Edit_length.Text:='';
            end;
     end
  else
      showMessage('Сначала введите данные');
end;

procedure TMain.FormCreate(Sender: TObject);
begin

end;

end.

