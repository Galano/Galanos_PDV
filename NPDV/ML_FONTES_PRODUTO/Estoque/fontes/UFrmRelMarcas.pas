unit UFrmRelMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRelMarcas = class(TForm)
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
  FrmRelMarcas: TFrmRelMarcas;

implementation

{$R *.dfm}

Uses Udm, UFrmQRelMarcas;

procedure TFrmRelMarcas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelMarcas.BtnVisClick(Sender: TObject);
begin
  with DmDados.Q_Marcas do
     begin
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM MARCAS ORDER BY CODIGO')
        else
           sql.Add('SELECT * FROM MARCAS ORDER BY DESCRICAO');
        open;
     end;
  Application.CreateForm(TFrmQRelMarcas, FrmQRelMarcas);
  if sender = btnvis then
     begin
        FrmQRelMarcas.QRMarcas.PreviewInitialState:= wsMaximized;
        FrmQRelMarcas.QRMarcas.Preview;
     end
  else
     begin
        FrmQRelMarcas.QRMarcas.PrinterSetup;
        FrmQRelMarcas.QRMarcas.Print;
     end;
end;

end.
