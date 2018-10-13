unit UFrmRelForn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmRelForn = class(TForm)
    Panel2: TPanel;
    Rdg: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TButton;
    BtnImp: TButton;
    BtnSair: TButton;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelForn: TFrmRelForn;

implementation

{$R *.dfm}

Uses Udm, UQRelCadFor;

procedure TFrmRelForn.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelForn.BtnVisClick(Sender: TObject);
begin
  with DmDados.Q_Fornecedor do
     begin
        Close;
        SQL.Clear;
        if rdg.ItemIndex = 0 then
        begin
           SQL.Add('SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FORNECEDOR ORDER BY COD_FOR');
        end
        else
        begin
           SQL.Add('SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FORNECEDOR ORDER BY RAZAO_FOR');
        end;
        Open;
     end;

  Application.CreateForm(TFrmQRelCadFor, FrmQRelCadFor);
  //FrmQRelCadFor.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin
        FrmQRelCadFor.QuickRep1.PreviewInitialState:= wsMaximized;
        FrmQRelCadFor.QuickRep1.Preview;
     end
  else
     begin
        FrmQRelCadFor.QuickRep1.PrinterSetup;
        FrmQRelCadFor.QuickRep1.Print;
     end;
  FrmQRelCadFor.QuickRep1.QRPrinter:= nil;
  //Q_Fornecedor.Close;
end;

procedure TFrmRelForn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmDados.Q_Fornecedor.Close;
  action:= caFree;
end;

end.
