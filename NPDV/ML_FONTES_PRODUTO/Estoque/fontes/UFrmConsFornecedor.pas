unit UFrmConsFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, IBX.IBCustomDataSet, IBX.IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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

    DSConsulta: TDataSource;
    Q_Consulta: TFDQuery;
    Q_ConsultaCOD_FOR: TIntegerField;
    Q_ConsultaFJ_FOR: TStringField;
    Q_ConsultaRAZAO_FOR: TStringField;
    Q_ConsultaEND_FOR: TStringField;
    Q_ConsultaBAI_FOR: TStringField;
    Q_ConsultaCID_FOR: TStringField;
    Q_ConsultaCEP_FOR: TStringField;
    Q_ConsultaEST_FOR: TStringField;
    Q_ConsultaCNPJ_FOR: TStringField;
    Q_ConsultaINSC_FOR: TStringField;
    Q_ConsultaTEL_FOR: TStringField;
    Q_ConsultaFAX_FOR: TStringField;
    Q_ConsultaCONTATO_FOR: TStringField;
    Q_ConsultaNUM_FOR: TStringField;
    Q_ConsultaCODIGO_IBGE: TIntegerField;
    Q_ConsultaEMAIL_FOR: TStringField;

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
      - 1:
        begin
          if EdtCons.Text = '' then
            sql.Text := 'SELECT * FROM FORNECEDOR ORDER BY RAZAO_FOR'
          else
            sql.Text := 'SELECT * FROM FORNECEDOR WHERE COD_FOR = ' +
              EdtCons.Text;
          open;
        end;
      0:
        begin
          if EdtCons.Text = '' then
            sql.Text := 'SELECT * FROM FORNECEDOR ORDER BY COD_FOR'
          else
            sql.Text := 'SELECT * FROM FORNECEDOR WHERE COD_FOR = ' +
              EdtCons.Text;
          open;
        end;
      1:
        begin
          sql.Text := 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 +
            EdtCons.Text + '%' + #39 + ' ORDER BY RAZAO_FOR';
          open;
        end;
      2:
        begin
          sql.Text := 'SELECT * FROM FORNECEDOR WHERE CNPJ_FOR = ' + #39 +
            FormataCNPJ(trim(EdtCons.Text)) + #39;
          open;
        end;
      3:
        begin
          sql.Text := 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 +
            '%' + trim(EdtCons.Text) + '%' + #39 + ' ORDER BY RAZAO_FOR';
          open;
        end;
    end;
  end;
  // // DmDados.IBTransaction1.CommitRetaining;
  DBGrid.SetFocus;
end;

procedure TFrmConsFornecedor.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsFornecedor.DBGridDblClick(Sender: TObject);
begin
  // Form de Cadastro
  if (FrmConsFornecedor.Tag = 0) then
  begin
    FrmFornecedor.edtCod.Text := Q_ConsultaCOD_FOR.AsString;
    FrmFornecedor.btFiltroClick(Self);
    FrmFornecedor.BtnAlterarClick(Self);
  end;

  // Form de Entrada Estoque
  if (FrmConsFornecedor.Tag = 1) then
  begin
    FrmOutrasEntradas.EdtCodFor.Text := Q_ConsultaCOD_FOR.AsString;
    FrmOutrasEntradas.EdtNomeFor.Text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  // Consulta Entradas
  if (FrmConsFornecedor.Tag = 2) then
  begin
    FrmConsOutrasEntradas.EdtCodFor.Text := Q_ConsultaCOD_FOR.AsString;
    FrmConsOutrasEntradas.EdtNomeFor.Text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  // Consulta Entradas
  if (FrmConsFornecedor.Tag = 3) then
  begin
    FrmRelEntradas.EdtCodFor.Text := Q_ConsultaCOD_FOR.AsString;
    FrmRelEntradas.EdtNomeFor.Text := Q_ConsultaRAZAO_FOR.AsString;
  end;

  close;
end;

end.
