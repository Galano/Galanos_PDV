unit UFrmConsUnidMedidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFrmConsUnidMedidas = class(TForm)
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
    procedure BtnSairClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsUnidMedidas: TFrmConsUnidMedidas;

implementation

{$R *.dfm}

Uses Udm, UFrmUnidadesMedidas, UFrmProdutos;

procedure TFrmConsUnidMedidas.BtnOKClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM UNIDADE_MEDIDA');
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

procedure TFrmConsUnidMedidas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsUnidMedidas.DBGridDblClick(Sender: TObject);
begin
//Form de Cadastro
  if (FrmConsUnidMedidas.Tag = 0) then
  begin
    FrmUnidadesMedidas.edtCod.text := Q_ConsultaCODIGO.AsString;
    FrmUnidadesMedidas.btnFiltroClick(Self);
    FrmUnidadesMedidas.BtnAlterarClick(Self);
  end;

  //Form de Cadastro produtros unidade de entrada
  if (FrmConsUnidMedidas.Tag = 1) then
  begin
    FrmProdutos.edtCodUniEnt.text := Q_ConsultaCODIGO.AsString;
  end;

  //Form de Cadastro produtros unidade de entrada
  if (FrmConsUnidMedidas.Tag = 2) then
  begin
    FrmProdutos.edtCodUniSai.text := Q_ConsultaCODIGO.AsString;
  end;

  Close;
end;

end.
