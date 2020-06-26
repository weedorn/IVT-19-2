unit Unit1;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
      Logic,LCLtype;

type

			{ TMain }

      TMain = class(TForm)//класс формы (главного окна)
      {Поля класса формы}
      Button_res: TButton;
      Edit_A: TEdit;
      Edit_N: TEdit;
      Edit_D: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      MainMenu1: TMainMenu;
      Memo_sum: TMemo;
      MenuItem1: TMenuItem;
      MenuItem4: TMenuItem;
      MenuItem5: TMenuItem;
			MenuItem6: TMenuItem;
			MenuItem7: TMenuItem;
			MenuItem8: TMenuItem;
      OpenDialog1: TOpenDialog;
      SaveDialog1: TSaveDialog;

      procedure Button_resClick(Sender: TObject);
      procedure Edit_AChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure MenuItem1Click(Sender: TObject);
      procedure MenuItem2Click(Sender: TObject);
      procedure MenuItem3Click(Sender: TObject);
      procedure MenuItem4Click(Sender: TObject);
      procedure MenuItem5Click(Sender: TObject);
			procedure MenuItem6Click(Sender: TObject);
			procedure MenuItem7Click(Sender: TObject);
			procedure MenuItem8Click(Sender: TObject);

      private

      public

      end;

var
      Main: TMain;//объект (экземпляр) класса формы
      Ftxt:Text;
      a:integer;

implementation

{$R *.lfm}

{ TMain }
{Методы класса формы}
{Методы класса определяются в программе точно так же, как и обычные процедуры и функции,
за исключением того, что имя процедуры или функции, являющейся методом,
состоит из двух частей: имени класса, к которому принадлежит метод, и имени метода.
Имя класса от имени метода отделяется точкой.}

procedure TMain.Button_resClick(Sender: TObject);
begin
if (Edit_a.Text<>'') or (Edit_a.Text<>'') or (Edit_a.Text<>'') then
   begin
        if (trystrtoint(Edit_a.Text,a)
           or trystrtoint(Edit_n.Text,a)
           or trystrtoint(Edit_d.Text,a)) then
           result
        else
          begin
            ShowMessage('Данные введены неверно');
            Edit_a.Text:='';
            Edit_n.Text:='';
            Edit_d.Text:='';
          end;
   end
else
    showMessage('Сначала введите данные');
end;

procedure TMain.Edit_AChange(Sender: TObject);
begin

end;


procedure TMain.FormCreate(Sender: TObject);
begin

end;

procedure TMain.MenuItem1Click(Sender: TObject);
begin

end;

procedure TMain.MenuItem2Click(Sender: TObject);
begin

end;

procedure TMain.MenuItem3Click(Sender: TObject);
begin

end;

procedure TMain.MenuItem4Click(Sender: TObject);
begin
  ShowMessage('Автор: Щепетова Ольга'+#13+#10+
                      'Задача №20'+#13+#10+
                      'Найти сумму членов арифметической прогрессии'+#13+#10+'a, a+d, ..., a+(n-1)d по данным значениям a, d, n.'+#13+#10+
                      'http://bgu-chita.ru/zadachnik/Glava01/index01.htm#z20');
end;

procedure TMain.MenuItem5Click(Sender: TObject);
var
ex:Word;
begin
ex:=Application.MessageBox('Вы хотите выйти?','Выход',MB_YESNO);
if ex=IDYES then
  application.Terminate;
end;

procedure TMain.MenuItem6Click(Sender: TObject);
begin
open_file(Ftxt);
end;

procedure TMain.MenuItem7Click(Sender: TObject);
begin
if (Edit_a.Text<>'') or (Edit_a.Text<>'') or (Edit_a.Text<>'') then
   begin
        if (trystrtoint(Edit_a.Text,a)
           or trystrtoint(Edit_n.Text,a)
           or trystrtoint(Edit_d.Text,a)) then
           Save_file(ftxt)
        else
          begin
            ShowMessage('Данные введены неверно');
            Edit_a.Text:='';
            Edit_n.Text:='';
            Edit_d.Text:='';
          end;
   end
else
    showMessage('Сначала введите данные');
end;

procedure TMain.MenuItem8Click(Sender: TObject);
begin
if Memo_sum.Lines.Count=0 then
 ShowMessage('Нет данных')
else
save_report;
end;

end.

