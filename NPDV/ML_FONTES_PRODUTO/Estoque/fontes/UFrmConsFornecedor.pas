unit UFrmConsFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmConsFornecedor = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    BtnOk: TButton;
    Panel2: TPanel;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    StatusBar1: TStatusBar;
    Q_Consulta: TIBQuery;
    DSConsulta: TDataSource;
    Q_ConsultaCOD_FOR: TIntegerField;
    Q_ConsultaFJ_FOR: TIBStringField;
    Q_ConsultaRAZAO_FOR: TIBStringField;
    Q_ConsultaEND_FOR: TIBStringField;
    Q_ConsultaBAI_FOR: TIBStringField;
    Q_ConsultaCID_FOR: TIBStringField;
    Q_ConsultaCEP_FOR: TIBStringField;
    Q_ConsultaEST_FOR: TIBStringField;
    Q_ConsultaCNPJ_FOR: TIBStringField;
    Q_ConsultaINSC_FOR: TIBStringField;
    Q_ConsultaTEL_FOR: TIBStringField;
    Q_ConsultaFAX_FOR: TIBStringField;
    Q_ConsultaCONTATO_FOR: TIBStringField;
    Q_ConsultaNUM_FOR: TIBStringField;
    Q_ConsultaCODIGO_IBGE: TIntegerField;
    Q_ConsultaEMAIL_FOR: TIBStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsFornecedor: TFrmConsFornecedor;

implementation

{$R *.dfm}

Uses Udm, Ubibliotecas, UFornecedor, UFrmOutrasEntradas, UFrmConsOutrasEntradas,
  UFrmRelEntradas;

procedure TFrmConsFornecedor.BtnOkClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        case ComboCons.ItemIndex of
         -1:begin
              if EdtCons.Text = '' then
                 sql.Text:= 'SELECT * FROM FORNECEDOR ORDER BY RAZAO_FOR'
              else
                 sql.Text:= 'SELECT * FROM FORNECEDOR WHERE COD_FOR = ' + edtcons.Text;
              open;
           end;
         0:begin
              if EdtCons.Text = '' then
                 sql.Text:= 'SELECT * FROM FORNECEDOR ORDER BY COD_FOR'
              else
                 sql.Text:= 'SELECT * FROM FORNECEDOR WHERE COD_FOR = ' + edtcons.Text;
              open;
           end;
         1:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 + edtcons.Text + '%' + #39 + ' ORDER BY RAZAO_FOR';
              open;
           end;
         2:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE CNPJ_FOR = ' + #39 + FormataCNPJ(trim(edtcons.Text)) + #39;
              open;
           end;
         3:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 + '%' + trim(EdtCons.Text) + '%' + #39 + ' ORDER BY RAZAO_FOR';
              open;
           end;
        end;
     end;
  DmDados.IBTransaction1.CommitRetaining;
  dbgrid.SetFocus;
end;

procedure TFrmConsFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsFornecedor.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsFornecedor.Tag = 0) then
  begin
    FrmFornecedor.edtCod.text := Q_ConsultaCOD_FOR.AsString;
    FrmFornecedor.btFiltroClick(Self);
    FrmFornecedor.BtnAlterarClick(Self);
  end;

  //Form de Entrada Estoque
  if (FrmConsFornecedor.Tag = 1) then
  begin
    FrmOutrasEntradas.EdtCodFor.text := Q_ConsultaCOD_FOR.AsString;
    FrmOutrasEntradas.EdtNomeFor.text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  // Consulta Entradas
  if (FrmConsFornecedor.Tag = 2) then
  begin
    FrmConsOutrasEntradas.EdtCodFor.text := Q_ConsultaCOD_FOR.AsString;
    FrmConsOutrasEntradas.EdtNomeFor.text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  // Consulta Entradas
  if (FrmConsFornecedor.Tag = 3) then
  begin
    FrmRelEntradas.EdtCodFor.text := Q_ConsultaCOD_FOR.AsString;
    FrmRelEntradas.EdtNomeFor.text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  Close;
end;

end.
