unit UFrmRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelProdutos = class(TForm)
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
    PanelSetor: TPanel;
    LabelTitulo: TLabel;
    BtnCons: TSpeedButton;
    Check: TCheckBox;
    EdtNome: TEdit;
    Rdg: TRadioGroup;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    EdtCodSec: TEdit;
    EdtCodGrupo: TEdit;
    EdtCodSub: TEdit;
    EdtCod: TEdit;
    RDGSecaoSetorFab: TRadioGroup;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure LimpaGBSecao;
    procedure DesabilitaSecao(const bAux : boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RDGSecaoSetorFabClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure CheckSecaoClick(Sender: TObject);
    procedure BtnConsSecClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure BtnConsSubClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutos: TFrmRelProdutos;

implementation

{$R *.dfm}

Uses Udm, UFrmConsSecao, UFrmConsGrupo, UFrmConsSubGrupo, UConsFrmMarcas,
  UQRelEstoque, UFrmRelEiquetas, UFrmRelCodBarras, UFrmRelCodBarrasFR,
  UFrmSelecionaItensEtiqueta;

{ TFrmRelProdutos }

procedure TFrmRelProdutos.BitBtn1Click(Sender: TObject);
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

       if rdg.ItemIndex = 0 then
          sql.Add(' ORDER BY PRODUTO.COD_PRO')
       else
          sql.Add(' ORDER BY PRODUTO.NOME_PRO');
       open;
       FetchAll;

    end;


    { Antiga chamada }
    {Application.CreateForm(TFrmRelCodBarras,FrmRelCodBarras);
    FrmRelCodBarras.QuickRep1.PreviewInitialState:= wsMaximized;
    FrmRelCodBarras.QuickRep1.Preview;}

    FrmRelCodBarras := TFrmRelCodBarras.Create(application);
    //FrmRelCodBarras.rlltitulorel.Caption := 'Relatório de Alunos Ativos';
    FrmRelCodBarras.RLReport1.preview();
end;

procedure TFrmRelProdutos.BtnConsClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsMarcas,FrmConsMarcas);
  FrmConsMarcas.Tag := 2;
  DmDados.tb_classifica_cliente.Open;
  FrmConsMarcas.Showmodal;
  FrmConsMarcas.Hide;
  FrmConsMarcas.Free;
end;

procedure TFrmRelProdutos.BtnConsGrupoClick(Sender: TObject);
begin
  if trim(edtCodSec.Text) = '' then
     exit;
  Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
  FrmConsGrupo.tag:= 2;
  FrmConsGrupo.showmodal;
end;

procedure TFrmRelProdutos.BtnConsSecClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSecao,FrmConsSecao);
  FrmConsSecao.Tag := 2;
  FrmConsSecao.Showmodal;
  FrmConsSecao.Hide;
  FrmConsSecao.Free;
end;

procedure TFrmRelProdutos.BtnConsSubClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
  FrmConsSubGrupo.tag:= 2;
  FrmConsSubGrupo.showmodal;
end;

procedure TFrmRelProdutos.BtnImpClick(Sender: TObject);
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

       if rdg.ItemIndex = 0 then
          sql.Add(' ORDER BY PRODUTO.COD_PRO')
       else
          sql.Add(' ORDER BY PRODUTO.NOME_PRO');
       open;
       FetchAll;

    end;


    if RadioGroup1.ItemIndex = 0 then
    begin
      Application.CreateForm(TFrmRelEiquetas,FrmRelEiquetas);
      FrmRelEiquetas.QuickRep1.PreviewInitialState:= wsMaximized;
      FrmRelEiquetas.QuickRep1.Preview;
    end
    else
    begin
      Application.CreateForm(TFrmSelecionaItensEtiqueta,FrmSelecionaItensEtiqueta);
      FrmSelecionaItensEtiqueta.Showmodal;
      FrmSelecionaItensEtiqueta.Hide;
      FrmSelecionaItensEtiqueta.Free;
    end;
end;

procedure TFrmRelProdutos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelProdutos.BtnVisClick(Sender: TObject);
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
          FrmQRelEstoque.QREstoque.PreviewInitialState:= wsMaximized;
          FrmQRelEstoque.QREstoque.Preview;
       end;
    //FrmQRelEstoque.QREstoque.QRPrinter:= nil;
end;

procedure TFrmRelProdutos.CheckClick(Sender: TObject);
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

procedure TFrmRelProdutos.CheckSecaoClick(Sender: TObject);
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

procedure TFrmRelProdutos.DesabilitaSecao(const bAux: boolean);
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

procedure TFrmRelProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TFrmRelProdutos.FormShow(Sender: TObject);
begin
   rdg.ItemIndex := 0;
   RDGSecaoSetorFab.ItemIndex:= 0;
   CheckSecao.Checked:= true;
   CheckSecaoClick(self);
   Check.Checked:= true;
   CheckClick(self);
   RDGSecaoSetorFabClick(self);
end;

procedure TFrmRelProdutos.LimpaGBSecao;
begin
   EdtCodSec.Clear;
   EdtNomeSec.Clear;
   EdtCodGrupo.Clear;
   EdtNomeGrupo.Clear;
   EdtCodSub.Clear;
   edtnomesub.Clear;
end;

procedure TFrmRelProdutos.RDGSecaoSetorFabClick(Sender: TObject);
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
