unit UFrmConsSubGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsSubGrupo = class(TForm)
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
    Q_ConsultaCOD_GRUPO: TIntegerField;
    Q_ConsultaCOD_SUBGRUPO: TIntegerField;
    Q_ConsultaDESCRICAO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsSubGrupo: TFrmConsSubGrupo;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UFrmProdutos, UFrmRelProdutos, UFrmConsultaEstoque;

procedure TFrmConsSubGrupo.BtnOKClick(Sender: TObject);
begin
  with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO_GRUPO_SUBGRUPO');
        case ComboCons.ItemIndex of
         -1: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO' +
                    ' ORDER BY DESCRICAO');
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO' +
                    ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO' +
                    ' ORDER BY DESCRICAO');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO ' +
                          ' ORDER BY COD_GRUPO')
              else
                 begin
                    sql.add(' WHERE COD_SUBGRUPO = :CODSUBGRUPO AND COD_GRUPO = :CODGRUPO' +
                            ' AND COD_SEC = :CODSEC');
                    parambyname('codsubgrupo').AsInteger:= strtoint(EdtCons.Text);
                 end;
            end;
        end;
        case FrmConsSubGrupo.Tag of
          1: begin
                Parambyname('codsec').AsInteger  := strtoint(FrmProdutos.edtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmProdutos.edtCodGrupo.Text);
             end;
          2: begin
                Parambyname('codsec').AsInteger  := strtoint(FrmRelProdutos.EdtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmRelProdutos.EdtCodGrupo.Text);
             end;
          3: begin
                Parambyname('codsec').AsInteger  := strtoint(FrmConsultaEstoque.EdtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmConsultaEstoque.EdtCodGrupo.Text);
             end;
          {4: begin
                Parambyname('codsec').AsInteger  := strtoint(FrmRelEstoque.EdtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmRelEstoque.EdtCodGrupo.Text);
             end;}
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSubGrupo.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsSubGrupo.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro produtros unidade de entrada
  if (FrmConsSubGrupo.Tag = 1) then
  begin
    FrmProdutos.edtSubCodGrupo.text := Q_ConsultaCOD_SUBGRUPO.AsString;
    FrmProdutos.EdtNomeSubGrupo.text := Q_ConsultaDESCRICAO.AsString;
  end;

  // Relatório de Produtos
  if (FrmConsSubGrupo.Tag = 2) then
  begin
    FrmRelProdutos.EdtCodSub.text := Q_ConsultaCOD_SUBGRUPO.AsString;
    FrmRelProdutos.EdtNomeSub.text := Q_ConsultaDESCRICAO.AsString;
  end;

  // Relatório de Produtos
  if (FrmConsSubGrupo.Tag = 3) then
  begin
    FrmConsultaEstoque.EdtCodSub.text := Q_ConsultaCOD_SUBGRUPO.AsString;
    FrmConsultaEstoque.EdtNomeSub.text := Q_ConsultaDESCRICAO.AsString;
  end;

  Close;
end;

procedure TFrmConsSubGrupo.FormShow(Sender: TObject);
begin
  ComboCons.ItemIndex := 0;
end;

end.
