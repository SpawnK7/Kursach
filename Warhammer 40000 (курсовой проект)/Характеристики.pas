unit Характеристики;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TStats = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Image1: TImage;
    Button1: TButton;
    Image2: TImage;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stats: TStats;
  s:string;

implementation

{$R *.dfm}

procedure TStats.Button1Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('Resources/Army/'+ComboBox1.Text+'/'+ComboBox2.Text+'/'+ADOQuery1.Fields.Fields[0].AsString+'.png');
end;

procedure TStats.ComboBox1Change(Sender: TObject);
begin

if ComboBox2.Visible=True then
  begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Unit FROM Army');
  ADOQuery1.SQL.Add('WHERE (Race='''+ComboBox1.Text+''') AND (Group='''+ComboBox2.Text+''')');
  ADOQuery1.Active:=True;
  end;
ComboBox2.Visible:=True;
end;

procedure TStats.ComboBox2Change(Sender: TObject);
begin
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('SELECT Unit FROM Army');
ADOQuery1.SQL.Add('WHERE (Race='''+ComboBox1.Text+''') AND (Group='''+ComboBox2.Text+''')');
ADOQuery1.Active:=True;
DBGrid1.Visible:=True;
Button1.Visible:=True;
end;





procedure TStats.FormActivate(Sender: TObject);
begin
Image2.Align:=alClient;
end;

end.
