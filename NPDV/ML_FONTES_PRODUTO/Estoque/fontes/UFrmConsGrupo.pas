unit UFrmConsGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmConsGrupo = class(TForm)
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
    Q_ConsultaCOD_SEC: TIntegerField;
    Q_ConsultaCOD_GRUPO: TIntegerField;
    Q_ConsultaDESCRICAO: TIBStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsGrupo: TFrmConsGrupo;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UFrmProdutos, UFrmRelProdutos, UFrmConsultaEstoque;

procedure TFrmConsGrupo.BtnOKClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO_GRUPO');
        case ComboCons.ItemIndex of
         -1: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC' +
                    ' ORDER BY DESCRICAO');
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC' +
                    ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC' +
                    ' ORDER BY DESCRICAO');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' WHERE COD_SEC = :CODSEC ORDER BY COD_GRUPO')
              else
                 begin
                    sql.add(' WHERE COD_GRUPO = :CODGRUPO AND COD_SEC = :CODSEC');
                    parambyname('codgrupo').AsInteger:= strtoint(EdtCons.Text);
                 end;
            end;
        end;
          case FrmConsGrupo.Tag of
            1: Parambyname('codsec').AsInteger:= strtoint(FrmProdutos.edtCodSec.Text);
            2: Parambyname('codsec').AsInteger:= strtoint(FrmRelProdutos.EdtCodSec.Text);
            3: Parambyname('codsec').AsInteger:= strtoint(FrmConsultaEstoque.EdtCodSec.Text);
            {4: Parambyname('codsec').AsInteger:= strtoint(FrmRelEstoque.EdtCodSec.Text);}
          end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsGrupo.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsGrupo.DBGridDblClick(Sender: TObject);
begin
//Form de Cadastro produtros unidade de entrada
  if (FrmConsGrupo.Tag = 1) then
  begin
    FrmProdutos.edtCodGrupo.text := Q_ConsultaCOD_GRUPO.AsString;
    FrmProdutos.EdtNomeGrupo.text := Q_ConsultaDESCRICAO.AsString;
  end;

  //Form de Relatório de Produtos
  if (FrmConsGrupo.Tag = 2) then
  begin
    FrmRelProdutos.edtCodGrupo.text := Q_ConsultaCOD_GRUPO.AsString;
    FrmRelProdutos.EdtNomeGrupo.text := Q_ConsultaDESCRICAO.AsString;
  end;

  //Form de Relatório de Produtos
  if (FrmConsGrupo.Tag = 3) then
  begin
    FrmConsultaEstoque.edtCodGrupo.text := Q_ConsultaCOD_GRUPO.AsString;
    FrmConsultaEstoque.EdtNomeGrupo.text := Q_ConsultaDESCRICAO.AsString;
  end;

  Close;
end;

procedure TFrmConsGrupo.FormShow(Sender: TObject);
begin
  ComboCons.ItemIndex := 0;
end;

end.
