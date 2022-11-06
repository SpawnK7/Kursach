unit �����_���������;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, ���������, Vcl.MPlayer;

type
  TChoice = class(TForm)
    NecronPlayer: TMediaPlayer;
    NecronPanel: TPanel;
    Necron: TImage;
    SMPlayer: TMediaPlayer;
    SPaceMarinePanel: TPanel;
    SpaceMarine: TImage;
    procedure NecronClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpaceMarineClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Choice: TChoice;

implementation

{$R *.dfm}

uses �������;


procedure TChoice.FormActivate(Sender: TObject);
begin
NecronPlayer.Display:=NecronPlayer; //���������� ����� �����
SMPlayer.Display:=SMPlayer; //���������� ����� �����
end;

procedure TChoice.NecronClick(Sender: TObject);
begin
NecronPlayer.Display:=NecronPanel; //��������� ������� ����������� ��
                              //������ � ������������ �������
NecronPlayer.DisplayRect:=NecronPanel.ClientRect; //��������� ������ �����
                                             //��� ������ ������
NecronPlayer.Play; //�������� ��������
sleep(1700); //�������� ����� ������� ����� �����, �����
             //�������� ������ �����������
Choice.Hide; //��������� ����� ������
k:='Resources\Painter\Necron.bmp'; //������� ���� � ����� � ��������� �������
Painter.Image1.Left:=80; //��� ����, ����� �� ��� � ��������
Painter.Image1.Picture.LoadFromFile(k); //��������� �������� ������� �� �����
                                       //� ����������
Main_Form.Hide;
Painter.ShowModal; //�������� ����� � ����������
end;

procedure TChoice.SpaceMarineClick(Sender: TObject);
begin
SMPlayer.Display:=SpaceMarinePanel; //��������� ������� ����������� ��
                              //������ � ������������ �������
SMPlayer.DisplayRect:=SpaceMarinePanel.ClientRect; //��������� ������ �����
                                             //��� ������ ������
SMPlayer.Play; //�������� ��������
sleep(2000); //�������� ����� ������� ����� �����, �����
             //�������� ������ �����������
Choice.Hide; //��������� ����� ������
k:='Resources\Painter\SpaceMarine.bmp'; //������� ���� � ����� � ��������� �������
Painter.Image1.Left:=0; //��� ����, ����� �� ��� � ��������
Painter.Image1.Picture.LoadFromFile(k); //��������� �������� ������� �� �����
                                       //� ����������
Main_Form.Hide;
Painter.ShowModal; //�������� ����� � ����������
end;

end.
