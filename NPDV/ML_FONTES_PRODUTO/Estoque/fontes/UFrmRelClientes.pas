unit UFrmRelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRelClientes = class(TForm)
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
  FrmRelClientes: TFrmRelClientes;
  sSql: string;

implementation

{$R *.dfm}

Uses Udm, UFrmQRelCliGeral;

procedure TFrmRelClientes.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelClientes.BtnVisClick(Sender: TObject);
begin
  sSql:= 'SELECT C.COD_CLI, C.NOME_CLI, C.NASCIMENTO_CLI, C.TELRES_CLI FROM CLIENTE C';
  with DmDados.Q_Clientes do
     begin
        close;
        sql.Clear;
        sql.Text:= sSql;
        if rdg.ItemIndex = 0 then
           sql.Add(' ORDER BY C.COD_CLI')
        else
           sql.Add(' ORDER BY C.NOME_CLI');
        open;
     end;
  Application.CreateForm(TFrmQRelCliGeral, FrmQRelCliGeral);
  //FrmQRelCliGeral.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin
        FrmQRelCliGeral.QRCli.PreviewInitialState:= wsMaximized;
        FrmQRelCliGeral.QRCli.Preview;
     end
  else
     begin
        FrmQRelCliGeral.QRCli.PrinterSetup;
        FrmQRelCliGeral.QRCli.Print;
     end;
  FrmQRelCliGeral.QRCli.QRPrinter:= nil;
end;

end.
