program WH40K;

uses
  Vcl.Forms,
  Windows,
  ������� in '�������.pas' {Main_Form},
  �����_�������� in '�����_��������.pas' {Load_Form},
  ��������� in '���������.pas' {Painter},
  �����_��������� in '�����_���������.pas' {Choice},
  �������_������� in '�������_�������.pas' {Core_rules},
  ���� in '����.pas' {Test},
  �������������� in '��������������.pas' {Stats};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TPainter, Painter);
  Application.CreateForm(TChoice, Choice);
  Application.CreateForm(TCore_rules, Core_rules);
  Application.CreateForm(TTest, Test);
  Application.CreateForm(TStats, Stats);
  Load_Form := TLoad_Form.Create(Application);

  Load_Form.Show;
  Sleep(5000);
  Application.CreateForm(TMain_Form, Main_Form);
  Load_Form.Close;


// ������ ��������� �� ����������
  Application.Run;
end.

