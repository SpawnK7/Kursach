unit Главные_правила;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.MPlayer,
  Vcl.Imaging.jpeg, Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TCore_rules = class(TForm)
    Panel1: TPanel;
    Rules: TImage;
    ScrollBar1: TScrollBar;
    Left: TImage;
    Right: TImage;
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure LeftClick(Sender: TObject);
    procedure RightClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Core_rules: TCore_rules;
  k:integer;
implementation

{$R *.dfm}

procedure TCore_rules.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta>0 then
    ScrollBar1.Position:= ScrollBar1.Position-ScrollBar1.SmallChange
  else ScrollBar1.Position:= ScrollBar1.Position+ScrollBar1.SmallChange;
  Rules.Top:=-ScrollBar1.Position*6;
end;

procedure TCore_rules.LeftClick(Sender: TObject);
begin
if k>0 then
  begin
  dec(k);
  Rules.Picture.LoadFromFile('Resources\Core Rules\'+IntToStr(k+1)+'.jpg');
  ScrollBar1.Position:=0;
  Rules.Top:=0;
  end;

end;

procedure TCore_rules.RightClick(Sender: TObject);
begin
if k<25 then
  begin
  inc(k);
  Rules.Picture.LoadFromFile('Resources\Core Rules\'+IntToStr(k+1)+'.jpg');
  ScrollBar1.Position:=0;
  Rules.Top:=0;
  end;
end;

procedure TCore_rules.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
Rules.Top:=-ScrollPos*6;
end;

end.
