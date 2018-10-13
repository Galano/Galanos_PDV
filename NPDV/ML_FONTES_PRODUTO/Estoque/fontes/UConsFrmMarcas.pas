unit UConsFrmMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmConsMarcas = class(TForm)
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
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsMarcas: TFrmConsMarcas;

implementation

{$R *.dfm}

uses UFrmMarcas, UFrmProdutos, UFrmRelProdutos, UFrmConsultaEstoque;

procedure TFrmConsMarcas.BtnOKClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM MARCAS');
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

procedure TFrmConsMarcas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsMarcas.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsMarcas.Tag = 0) then
  begin
    frmMarcas.edtCod.text := Q_ConsultaCODIGO.AsString;
    frmMarcas.btnFiltroClick(Self);
    frmMarcas.BtnAlterarClick(Self);
  end;

  // Cadastr de Produtos
  if (FrmConsMarcas.Tag = 1) then
  begin
    FrmProdutos.EdtCodMarca.text := Q_ConsultaCODIGO.AsString;
    FrmProdutos.EdtNomeMarca.Text := Q_ConsultaDESCRICAO.AsString;
  end;

  // Relatório de Produtos
  if (FrmConsMarcas.Tag = 2) then
  begin
    FrmRelProdutos.EdtCod.text := Q_ConsultaCODIGO.AsString;
    FrmRelProdutos.EdtNome.Text := Q_ConsultaDESCRICAO.AsString;
  end;

  // Relatório de Produtos
  if (FrmConsMarcas.Tag = 3) then
  begin
    FrmConsultaEstoque.EdtCod.text := Q_ConsultaCODIGO.AsString;
    FrmConsultaEstoque.EdtNome.Text := Q_ConsultaDESCRICAO.AsString;
  end;

  Close;
end;

end.
