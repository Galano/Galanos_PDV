unit UFrmRelSecaoGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRelSecaoGrupo = class(TForm)
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
  FrmRelSecaoGrupo: TFrmRelSecaoGrupo;

implementation

{$R *.dfm}

Uses Udm, UFrmQRelSec;

procedure TFrmRelSecaoGrupo.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelSecaoGrupo.BtnVisClick(Sender: TObject);
begin
  with DmDados.Q_Secao_Grupo do
     begin
        close;
        sql.Clear;
        sql.Text:= 'SELECT S.COD_SEC, S.NOME_SEC, G.COD_GRUPO, G.DESCRICAO NOME_GRUPO, ' +
                   'SUB.COD_SUBGRUPO, SUB.DESCRICAO NOME_SUBGRUPO ' +
                   'FROM SECAO S ' +
                   'LEFT JOIN SECAO_GRUPO G ' +
                   'ON (S.COD_SEC = G.COD_SEC) ' +
                   'LEFT JOIN SECAO_GRUPO_SUBGRUPO SUB ' +
                   'ON (G.COD_SEC = SUB.COD_SEC AND G.COD_GRUPO = SUB.COD_GRUPO)';

        if rdg.ItemIndex = 0 then
           sql.add(' ORDER BY S.COD_SEC, G.COD_GRUPO, SUB.COD_SUBGRUPO')
        else
           sql.Add(' ORDER BY S.NOME_SEC, G.DESCRICAO, SUB.DESCRICAO');
        open;
     end;
  Application.CreateForm(TFrmQRelSec, FrmQRelSec);
  if sender = btnvis then
     begin
        FrmQRelSec.QRSec.PreviewInitialState:= wsMaximized;
        FrmQRelSec.QRSec.Preview;
     end
  else
     begin
        FrmQRelSec.QRSec.PrinterSetup;
        FrmQRelSec.QRSec.Print;
     end;
end;

end.
