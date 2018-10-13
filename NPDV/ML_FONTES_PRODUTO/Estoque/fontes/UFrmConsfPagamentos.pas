unit UFrmConsfPagamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFrmConsfPagamentos = class(TForm)
    Panel1: TPanel;
    LTipo: TLabel;
    EdtCons: TEdit;
    BtnOK: TBitBtn;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    Q_Consulta: TIBQuery;
    DSConsulta: TDataSource;
    Q_ConsultaCODIGO: TIntegerField;
    Q_ConsultaDESCRICAO: TIBStringField;
    procedure BtnOKClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsfPagamentos: TFrmConsfPagamentos;

implementation

{$R *.dfm}

Uses UDm, UFrmFPagamentos;

procedure TFrmConsfPagamentos.BtnOKClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM FORMAS_PAGAMENTO');
        case ComboCons.ItemIndex of
         -1: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY CODIGO')
               else
                  sql.add(' WHERE CODIGO = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsfPagamentos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsfPagamentos.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsfPagamentos.Tag = 0) then
  begin
    FrmFPagamentos.edtCod.text := Q_ConsultaCODIGO.AsString;
    FrmFPagamentos.btnFiltroClick(Self);
    FrmFPagamentos.BtnAlterarClick(Self);
  end;

  Close;
end;

procedure TFrmConsfPagamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

end.
