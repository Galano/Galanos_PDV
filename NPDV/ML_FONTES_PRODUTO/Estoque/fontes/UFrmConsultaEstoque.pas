unit UFrmConsultaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmConsultaEstoque = class(TForm)
    Panel1: TPanel;
    GBSecaoSetor: TGroupBox;
    PanelSecao: TPanel;
    BtnConsSub: TSpeedButton;
    BtnConsGrupo: TSpeedButton;
    BtnConsSec: TSpeedButton;
    Label30: TLabel;
    CheckSecao: TCheckBox;
    EdtNomeSec: TEdit;
    EdtNomeGrupo: TEdit;
    EdtNomeSub: TEdit;
    EdtCodSec: TEdit;
    EdtCodGrupo: TEdit;
    EdtCodSub: TEdit;
    PanelSetor: TPanel;
    LabelTitulo: TLabel;
    BtnCons: TSpeedButton;
    Check: TCheckBox;
    EdtNome: TEdit;
    EdtCod: TEdit;
    Rdg: TRadioGroup;
    RDGSecaoSetorFab: TRadioGroup;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BtnVisClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaGBSecao;
    procedure DesabilitaSecao(const bAux : boolean);
    procedure RDGSecaoSetorFabClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure BtnConsSecClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure BtnConsSubClick(Sender: TObject);
    procedure CheckSecaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaEstoque: TFrmConsultaEstoque;

implementation

{$R *.dfm}

Uses Udm, UFrmConsSecao, UFrmConsGrupo, UFrmConsSubGrupo, UConsFrmMarcas,
  UFrmQRelEstoquePrecoVenda, UFrmQRelEstoqueMinimo;

procedure TFrmConsultaEstoque.BtnConsClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsMarcas,FrmConsMarcas);
  FrmConsMarcas.Tag := 3;
  DmDados.tb_classifica_cliente.Open;
  FrmConsMarcas.Showmodal;
  FrmConsMarcas.Hide;
  FrmConsMarcas.Free;
end;

procedure TFrmConsultaEstoque.BtnConsGrupoClick(Sender: TObject);
begin
  if trim(edtCodSec.Text) = '' then
     exit;
  Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
  FrmConsGrupo.tag:= 3;
  FrmConsGrupo.showmodal;
end;

procedure TFrmConsultaEstoque.BtnConsSecClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSecao,FrmConsSecao);
  FrmConsSecao.Tag := 3;
  FrmConsSecao.Showmodal;
  FrmConsSecao.Hide;
  FrmConsSecao.Free;
end;

procedure TFrmConsultaEstoque.BtnConsSubClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
  FrmConsSubGrupo.tag:= 3;
  FrmConsSubGrupo.showmodal;
end;

procedure TFrmConsultaEstoque.BtnImpClick(Sender: TObject);
var sAuxSql : string;
    sAuxEstoque : string;
begin
    sAuxSql:= ' WHERE ';

    with DmDados.Q_Produtos do
    begin
       close;
       sql.clear;
       sql.Add('SELECT');
       sql.Add('   PRODUTO.COD_PRO,');
       sql.Add('   PRODUTO.CODIGO_BARRA_PRO,');
       sql.Add('   PRODUTO.ESTOQUE_MINIMO,');
       sql.Add('   PRODUTO.QUANT_ESTOQ,');
       sql.Add('   PRODUTO.NOME_PRO,');
       sql.Add('   PRODUTO.PRECO_VAREJO,');
       sql.Add('   PRODUTO.PRECO_PROMOCAO,');
       sql.Add('   PRODUTO.DATA_VALIDADE,');
       sql.Add('   MARCAS.DESCRICAO,');
       sql.Add('   SECAO.NOME_SEC,');
       sql.Add('   SECAO_GRUPO.DESCRICAO,');
       sql.Add('   SECAO_GRUPO_SUBGRUPO.DESCRICAO,');
       sql.Add('   UNIDADE_MEDIDA.DESCRICAO');
       sql.Add(' FROM');
       sql.Add('   MARCAS');
       sql.Add('   INNER JOIN PRODUTO ON (MARCAS.CODIGO = PRODUTO.COD_MARC)');
       sql.Add('   INNER JOIN SECAO ON (PRODUTO.COD_SEC = SECAO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO ON (SECAO_GRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   AND (SECAO_GRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO_SUBGRUPO ON (SECAO_GRUPO_SUBGRUPO.COD_SUBGRUPO = PRODUTO.COD_SGRUP)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MEDIDA.CODIGO)');

       case RDGSecaoSetorFab.ItemIndex of
        0:begin
             if not CheckSecao.Checked then
                begin
                   if trim(EdtCodSec.Text) <> '' then
                      begin
                         sql.Add(sAuxSql +  ' PRODUTO.COD_SEC = :CODSEC');
                         parambyname('codsec').AsInteger:= strtoint(EdtCodSec.Text);
                         sAuxSql:= ' AND ';
                      end;

                   if trim(EdtCodGrupo.Text) <> '' then
                      begin
                         sql.Add(sAuxSql + ' PRODUTO.COD_GRUP = :CODGRP');
                         parambyname('codgrp').AsInteger:= strtoint(EdtCodGrupo.Text);
                         sAuxSql:= ' AND ';
                      end;

                   if trim(EdtCodSub.Text) <> '' then
                      begin
                         sql.Add(sAuxSql + ' PRODUTO.COD_SGRUP = :CODSUB');
                         parambyname('codsub').AsInteger:= strtoint(EdtCodSub.Text);
                         sAuxSql:= ' AND ';
                      end;
                end;
          end;
        1:begin
             if not Check.Checked then
                begin
                   if trim(EdtCod.Text) <> '' then
                      begin
                         sql.Add(sAuxSql +  ' PRODUTO.COD_MARC = :CODMARC');
                         parambyname('CODMARC').AsInteger:= strtoint(EdtCod.Text);
                         sAuxSql:= ' AND ';
                      end;
                end;
          end;
       end;

          sql.Add(' AND PRODUTO.QUANT_ESTOQ < PRODUTO.ESTOQUE_MINIMO');

       if rdg.ItemIndex = 0 then
          sql.Add(' ORDER BY PRODUTO.COD_PRO')
       else
          sql.Add(' ORDER BY PRODUTO.NOME_PRO');
       open;
       FetchAll;

    end;

    //ShowMessage('Total de Registros: ' + IntToStr(DmDados.Q_Produtos.RecordCount));
    if sender = BtnImp then
       begin
          FrmQRelEstoqueMinimo.QREstoque.PreviewInitialState:= wsMaximized;
          FrmQRelEstoqueMinimo.QREstoque.Preview;
       end;
    //FrmQRelEstoque.QREstoque.QRPrinter:= nil;
end;

procedure TFrmConsultaEstoque.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaEstoque.BtnVisClick(Sender: TObject);
var sAuxSql : string;
    sAuxEstoque : string;
begin
    sAuxSql:= ' WHERE ';

    with DmDados.Q_Produtos_inventario do
    begin
       close;
       sql.clear;
       sql.Add('SELECT');
       sql.Add('   PRODUTO.COD_PRO,');
       sql.Add('   PRODUTO.CODIGO_BARRA_PRO,');
       sql.Add('   PRODUTO.ESTOQUE_MINIMO,');
       sql.Add('   PRODUTO.QUANT_ESTOQ,');
       sql.Add('   PRODUTO.NOME_PRO,');
       sql.Add('   PRODUTO.PRECO_VAREJO,');
       sql.Add('   PRODUTO.PRECO_PROMOCAO,');
       sql.Add('   PRODUTO.DATA_VALIDADE,');
       sql.Add('   MARCAS.DESCRICAO,');
       sql.Add('   SECAO.NOME_SEC,');
       sql.Add('   SECAO_GRUPO.DESCRICAO,');
       sql.Add('   SECAO_GRUPO_SUBGRUPO.DESCRICAO,');
       sql.Add('   UNIDADE_MEDIDA.DESCRICAO,');
       sql.Add('   (PRODUTO.PRECO_VAREJO * PRODUTO.QUANT_ESTOQ) AS VL_TOTAL_EM_PROD');
       sql.Add(' FROM');
       sql.Add('   MARCAS');
       sql.Add('   INNER JOIN PRODUTO ON (MARCAS.CODIGO = PRODUTO.COD_MARC)');
       sql.Add('   INNER JOIN SECAO ON (PRODUTO.COD_SEC = SECAO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO ON (SECAO_GRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   AND (SECAO_GRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO_SUBGRUPO ON (SECAO_GRUPO_SUBGRUPO.COD_SUBGRUPO = PRODUTO.COD_SGRUP)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MEDIDA.CODIGO)');

       case RDGSecaoSetorFab.ItemIndex of
        0:begin
             if not CheckSecao.Checked then
                begin
                   if trim(EdtCodSec.Text) <> '' then
                      begin
                         sql.Add(sAuxSql +  ' PRODUTO.COD_SEC = :CODSEC');
                         parambyname('codsec').AsInteger:= strtoint(EdtCodSec.Text);
                         sAuxSql:= ' AND ';
                      end;

                   if trim(EdtCodGrupo.Text) <> '' then
                      begin
                         sql.Add(sAuxSql + ' PRODUTO.COD_GRUP = :CODGRP');
                         parambyname('codgrp').AsInteger:= strtoint(EdtCodGrupo.Text);
                         sAuxSql:= ' AND ';
                      end;

                   if trim(EdtCodSub.Text) <> '' then
                      begin
                         sql.Add(sAuxSql + ' PRODUTO.COD_SGRUP = :CODSUB');
                         parambyname('codsub').AsInteger:= strtoint(EdtCodSub.Text);
                         sAuxSql:= ' AND ';
                      end;
                end;
          end;
        1:begin
             if not Check.Checked then
                begin
                   if trim(EdtCod.Text) <> '' then
                      begin
                         sql.Add(sAuxSql +  ' PRODUTO.COD_MARC = :CODMARC');
                         parambyname('CODMARC').AsInteger:= strtoint(EdtCod.Text);
                         sAuxSql:= ' AND ';
                      end;
                end;
          end;
       end;

       sql.Add(' AND PRODUTO.QUANT_ESTOQ > 0');

       if rdg.ItemIndex = 0 then
          sql.Add(' ORDER BY PRODUTO.COD_PRO')
       else
          sql.Add(' ORDER BY PRODUTO.NOME_PRO');
       open;
       FetchAll;

    end;

    //ShowMessage('Total de Registros: ' + IntToStr(DmDados.Q_Produtos.RecordCount));
    if sender = btnvis then
       begin
          FrmQRelEstoquePrecoVenda.QREstoque.PreviewInitialState:= wsMaximized;
          FrmQRelEstoquePrecoVenda.QREstoque.Preview;
       end;
    //FrmQRelEstoque.QREstoque.QRPrinter:= nil;
end;

procedure TFrmConsultaEstoque.CheckClick(Sender: TObject);
begin
   Check.Focused;
   EdtCod.Clear;
   EdtNome.Clear;

   if Check.Checked then
      begin
         EdtCod.Enabled  := false;
         BtnCons.Enabled := false;
      end
   else
      begin
         begin
            EdtCod.Enabled  := true;
            EdtCod.SetFocus;
            BtnCons.Enabled := True;
         end;
      end;
end;

procedure TFrmConsultaEstoque.CheckSecaoClick(Sender: TObject);
begin
   CheckSecao.Focused;
   LimpaGBSecao;
   if CheckSecao.Checked then
      DesabilitaSecao(false)
   else
      begin
         DesabilitaSecao(true);
         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmConsultaEstoque.DesabilitaSecao(const bAux: boolean);
begin
   EdtCodSec.Enabled    := bAux;
   EdtNomeSec.Enabled   := bAux;
   EdtCodGrupo.Enabled  := bAux;
   EdtNomeGrupo.Enabled := bAux;
   EdtCodSub.Enabled    := bAux;
   edtnomesub.Enabled   := bAux;

   BtnConsSec.Enabled   := bAux;
   BtnConsGrupo.Enabled := bAux;
   BtnConsSub.Enabled   := bAux;
end;

procedure TFrmConsultaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TFrmConsultaEstoque.LimpaGBSecao;
begin
   EdtCodSec.Clear;
   EdtNomeSec.Clear;
   EdtCodGrupo.Clear;
   EdtNomeGrupo.Clear;
   EdtCodSub.Clear;
   edtnomesub.Clear;
end;

procedure TFrmConsultaEstoque.RDGSecaoSetorFabClick(Sender: TObject);
begin
   if RDGSecaoSetorFab.ItemIndex = 0 then
      begin
         PanelSetor.SendToBack;
      end
   else
      begin
         PanelSecao.SendToBack;
      end;
end;

end.
