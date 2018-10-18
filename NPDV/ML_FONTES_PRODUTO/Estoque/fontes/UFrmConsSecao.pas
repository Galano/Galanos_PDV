unit UFrmConsSecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsSecao = class(TForm)
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
    DSConsulta: TDataSource;
    Q_Consulta: TFDQuery;
    Q_ConsultaCOD_SEC: TIntegerField;
    Q_ConsultaNOME_SEC: TStringField;
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsSecao: TFrmConsSecao;

implementation

{$R *.dfm}

Uses Udm, UFrmSecaoGrupo, UClientes, UFrmProdutos, UFrmRelProdutos,
  UFrmConsultaEstoque;

procedure TFrmConsSecao.BtnOKClick(Sender: TObject);
begin
   with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO');
        case ComboCons.ItemIndex of
         -1: sql.add(' WHERE NOME_SEC LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SEC');
         0: sql.add(' WHERE NOME_SEC LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SEC');
         1: sql.add(' WHERE NOME_SEC LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SEC');
         2: begin
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_SEC')
              else
                 sql.add(' WHERE COD_SEC = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSecao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsSecao.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsSecao.Tag = 0) then
  begin
    FrmSecaoGrupo.edtCod.text := Q_ConsultaCOD_SEC.AsString;
    FrmSecaoGrupo.btnFiltroClick(Self);
    FrmSecaoGrupo.BtnAlterarClick(Self);
  end;

  //Form de Cadastro
  if (FrmConsSecao.Tag = 1) then
  begin
    FrmProdutos.edtCodSec.text := Q_ConsultaCOD_SEC.AsString;
    FrmProdutos.EdtNomeSec.text := Q_ConsultaNOME_SEC.AsString;
  end;

  //Form de Relatóriode Produtos
  if (FrmConsSecao.Tag = 2) then
  begin
    FrmRelProdutos.edtCodSec.text := Q_ConsultaCOD_SEC.AsString;
    FrmRelProdutos.EdtNomeSec.text := Q_ConsultaNOME_SEC.AsString;
  end;

  //Form de Relatóriode Produtos
  if (FrmConsSecao.Tag = 3) then
  begin
    FrmConsultaEstoque.edtCodSec.text := Q_ConsultaCOD_SEC.AsString;
    FrmConsultaEstoque.EdtNomeSec.text := Q_ConsultaNOME_SEC.AsString;
  end;

  Close;
end;

procedure TFrmConsSecao.FormShow(Sender: TObject);
begin
  Q_Consulta.Close;
end;

end.
