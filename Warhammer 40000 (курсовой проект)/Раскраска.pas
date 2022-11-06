unit ���������;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;

type
  TPainter = class(TForm)
    ColorDialog1: TColorDialog;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;

    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  k: string;
  Painter: TPainter;
  col: TColor;
  bu,mode: integer;

implementation

{$R *.dfm}


procedure TPainter.FormActivate(Sender: TObject);
begin
Image1.Picture.SaveToFile('backup0.bmp');
Image1.Picture.SaveToFile('backup1.bmp');
Image1.Picture.SaveToFile('backup2.bmp');
bu:=-1;
mode:=0;
end;

procedure TPainter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DeleteFile('backup0.bmp');
DeleteFile('backup1.bmp');
DeleteFile('backup2.bmp');
end;

procedure TPainter.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if (ssLeft in Shift) and (GetPixel(Image1.Canvas.Handle, X, Y)<>col) then
begin
  if bu=2 then
    bu:=0 else inc(bu);
  if mode<>0 then
    dec(mode);
  Image1.Picture.SaveToFile('backup'+IntToStr(bu)+'.bmp');

  Image1.Canvas.Brush.Color:=col;
  Image1.Canvas.FloodFill(x,y,clBlack,fsBorder);
end;

end;

procedure TPainter.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Button=mbLeft) and  (GetPixel(Image1.Canvas.Handle, X, Y)<>col) then
begin
  if bu=2 then
    bu:=0 else inc(bu);
  if mode<>0 then
    dec(mode);
  Image1.Picture.SaveToFile('backup'+IntToStr(bu)+'.bmp');

  Image1.Canvas.Brush.Color:=col;
  Image1.Canvas.FloodFill(x,y,clBlack,fsBorder);
end;
end;

procedure TPainter.N1Click(Sender: TObject);
begin
var name:string;
if SaveDialog1.Execute then
begin
name:= SaveDialog1.FileName+'.bmp';
Image1.Picture.SaveToFile(name)
end
else ShowMessage('���� �� ��������');
end;

procedure TPainter.N2Click(Sender: TObject);
begin
  if bu=2 then
    bu:=0 else inc(bu);
  if mode<>0 then
    dec(mode);
  Image1.Picture.SaveToFile('backup'+IntToStr(bu)+'.bmp');
Image1.Picture.LoadFromFile(k);
end;

procedure TPainter.N3Click(Sender: TObject);
begin
if ColorDialog1.Execute then
  col:= ColorDialog1.Color;
end;

procedure TPainter.N4Click(Sender: TObject);
begin
if mode<3 then
begin
  if bu<0 then bu:=2;
  Image1.Picture.LoadFromFile('backup'+IntToStr(bu)+'.bmp');
  dec(bu);
  inc(mode);
end;
end;

end.
