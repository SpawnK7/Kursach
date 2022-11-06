unit Главная;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Menus, ShellAPI;

type
  TMain_Form = class(TForm)
    Painter: TImage;
    Image1: TImage;
    Rules: TImage;
    StatsI: TImage;
    TestI: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;

    procedure PainterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RulesClick(Sender: TObject);
    procedure StatsIClick(Sender: TObject);
    procedure TestIClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
implementation


{$R *.dfm}

uses Экран_Загрузки, Раскраска, Выбор_персонажа,
  Главные_правила, Тест, Характеристики;



procedure TMain_Form.FormActivate(Sender: TObject);
begin
Image1.Align:=alClient;
end;

procedure TMain_Form.RulesClick(Sender: TObject);
begin
Core_rules.ShowModal;
end;

procedure TMain_Form.StatsIClick(Sender: TObject);
begin
Stats.ShowModal;
end;

procedure TMain_Form.TestIClick(Sender: TObject);
begin
Test.ShowModal;
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
ShellExecute(0,'Open','Help.chm',nil,nil,SW_SHOW);
end;

procedure TMain_Form.PainterClick(Sender: TObject);
begin
Main_Form.Hide;
Choice.Show;
ShowMessage('Выберите того, чью цветовую схему будете составлять');
end;

end.
