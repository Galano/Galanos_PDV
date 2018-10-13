unit UFrmRelVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRelVendedores = class(TForm)
    Panel2: TPanel;
    Rdg: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TButton;
    BtnImp: TButton;
    BtnSair: TButton;
    StatusBar1: TStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendedores: TFrmRelVendedores;

implementation

{$R *.dfm}

Uses Udm, UQRelVendedores;

procedure TFrmRelVendedores.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelVendedores.BtnVisClick(Sender: TObject);
begin
  with DmDados.Q_Vendedores do
     begin
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM VENDEDOR ORDER BY COD_VEND')
        else
           sql.Add('SELECT * FROM VENDEDOR ORDER BY NOME_VEND');
        open;
     end;
  Application.CreateForm(TQRelVendedores, QRelVendedores);
  //FrmQRelFunc.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin
        QRelVendedores.QRfunc.PreviewInitialState:= wsMaximized;
        QRelVendedores.QRfunc.Preview;
     end
  else
     begin
        QRelVendedores.QRfunc.PrinterSetup;
        QRelVendedores.QRfunc.Print;
     end;
end;

end.
