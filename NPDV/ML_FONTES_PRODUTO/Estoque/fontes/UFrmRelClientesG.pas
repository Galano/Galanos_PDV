unit UFrmRelClientesG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRelClassifica = class(TForm)
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
  FrmRelClassifica: TFrmRelClassifica;

implementation

{$R *.dfm}

Uses Udm, UFrmQRelCadClassif;

procedure TFrmRelClassifica.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelClassifica.BtnVisClick(Sender: TObject);
begin
  with DmDados.Q_Classifica do
     begin
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM CLASSIF_CLIENTE ORDER BY COD_CLA')
        else
           sql.Add('SELECT * FROM CLASSIF_CLIENTE ORDER BY NOME_CLA');
        open;
     end;
  Application.CreateForm(TFrmQRelCadClassif, FrmQRelCadClassif);
  if sender = btnvis then
     begin
        FrmQRelCadClassif.QRClassif.PreviewInitialState:= wsMaximized;
        FrmQRelCadClassif.QRClassif.Preview;
     end
  else
     begin
        FrmQRelCadClassif.QRClassif.PrinterSetup;
        FrmQRelCadClassif.QRClassif.Print;
     end;
end;

end.
