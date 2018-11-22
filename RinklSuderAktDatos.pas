unit RinklSuderAktDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, common;

type
  TfrmRinklSuderAktDatos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    edtDataPr: TLabeledEdit;
    spbDataPr: TSpeedButton;
    edtDataPb: TLabeledEdit;
    spbDataPb: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbDataPrClick(Sender: TObject);
    procedure edtDataPrExit(Sender: TObject);
    procedure edtDataPbExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRinklSuderAktDatos: TfrmRinklSuderAktDatos;

implementation

uses RinklSuderAktas, Kalendorius;
{$R *.dfm}
//---------------------------------------------------------
procedure TfrmRinklSuderAktDatos.Button1Click(Sender: TObject);
var
  data1t,
  data2t : integer;
begin
  data1t := getint(edtdataPr.Text);
  data2t := getint(edtDataPb.Text);
  with TfrmRinklSuderAktas.Create(self) do
  try
    Icon := TForm(Self).Icon;
    data1 := data1t;
    data2 := data2t;
    if ShowModal = mrOk then
    begin
        //
    end;
  finally
    Free;
  end;
end;
//------------------------------------------------------------
procedure TfrmRinklSuderAktDatos.FormShow(Sender: TObject);
begin
  edtDataPr.Text := Datoskontrole(inttostr(param.Metai)+'0101');
  edtDataPb.Text := Datoskontrole(inttostr(param.Metai)+'1231');
end;
//-------------------------------------------------------------------
procedure TfrmRinklSuderAktDatos.spbDataPrClick(Sender: TObject);
begin
  with TfrmKalendorius.Create(self) do
  try
    Top := Mouse.CursorPos.Y+5;
    Left := Mouse.CursorPos.X+5;
    case TSpeedButton(Sender).Tag of
      1 : edtDat := edtDataPr.Text;
      2 : edtDat := edtDataPb.Text;
    end;
    if ShowModal = mrOk then
    begin
      case TSpeedButton(Sender).Tag of
        1 : edtDataPr.Text := edtDat;
        2 : edtDataPb.Text := edtDat;
      end;
    end
  finally
    Free;
  end;
end;
//-----------------------------------------------------------------------
procedure TfrmRinklSuderAktDatos.edtDataPrExit(Sender: TObject);
begin
  if (edtDataPr.Text<>'')and(edtDataPr.Text<>'0') then
    edtDataPr.Text := DatosKontrole(edtDataPr.Text);
end;
//---------------------------------------------------------------------
procedure TfrmRinklSuderAktDatos.edtDataPbExit(Sender: TObject);
begin
  if (edtDataPb.Text<>'')and(edtDataPb.Text<>'0') then
    edtDataPb.Text := DatosKontrole(edtDataPb.Text);
end;
//--------------------------------------------------------------------
end.
