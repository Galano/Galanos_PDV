unit UFrmConsProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxPlacemnt, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmConsProduto = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    BtnCons: TSpeedButton;
    EdtCons: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    RdgAtivo: TRadioGroup;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    BtnPromocao: TButton;
    FormStorage1: TFormStorage;
    QProd: TIBQuery;
    DSProd: TDataSource;
    QProdCOD_PRO: TIntegerField;
    QProdCODIGO_BARRA_PRO: TIBStringField;
    QProdTP_PRODUTO: TIBStringField;
    QProdTP_PRODUCAO: TIBStringField;
    QProdESTOQUE_MINIMO: TIBBCDField;
    QProdNOME_PRO: TIBStringField;
    QProdDESC_CUPOM: TIBStringField;
    QProdCOD_MARC: TIntegerField;
    QProdCOD_SEC: TIntegerField;
    QProdCOD_GRUP: TIntegerField;
    QProdCOD_SGRUP: TIntegerField;
    QProdCOD_UNI_ENT: TIntegerField;
    QProdCOD_UNI_SAI: TIntegerField;
    QProdPRECO_VAREJO: TIBBCDField;
    QProdPRECO_PROMOCAO: TIBBCDField;
    QProdPRECO_PRAZO: TIBBCDField;
    QProdMARGEM_LUCRO: TIBBCDField;
    QProdQUANT_ESTOQ: TIBBCDField;
    QProdDATA_VALIDADE: TDateField;
    QProdDIAS_VALIDADE_PRO: TIntegerField;
    QProdCONTROLA_ESTOQUE_PRO: TIBStringField;
    QProdATIVO_PRO: TIBStringField;
    QProdCAMINHO_FOTO_PRO: TBlobField;
    QProdNOME_SEC: TIBStringField;
    QProdDESCRICAO: TIBStringField;
    QProdDESCRICAO1: TIBStringField;
    QProdUND_ENTRADA: TIBStringField;
    QProdUND_SAIDA: TIBStringField;
    QProdDESCRICAO2: TIBStringField;
    RdOrdem: TRadioGroup;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProduto: TFrmConsProduto;
  sSql,sAuxString : string;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UFrmProdutos, UFrmOutrasEntradas, UFrmOutrasSaidas,
  UProdutoComposicao;

procedure TFrmConsProduto.BtnOkClick(Sender: TObject);
var
  sLiga, sSentenca, ByOrdem : string;
begin
   case RdOrdem.ItemIndex of
   0:begin
      ByOrdem := 'asc';
   end;

   1:begin
      ByOrdem := 'desc';
   end;
   end;

   sSql := 'SELECT'+
                '  P.*,'+
                '  S.NOME_SEC,'+
                '  SG.DESCRICAO,'+
                '  SGS.DESCRICAO,'+
                '  UE.DESCRICAO AS UND_ENTRADA,'+
                '  US.DESCRICAO AS UND_SAIDA,'+
                '  MARCAS.DESCRICAO'+
                ' FROM'+
                '  PRODUTO P'+
                '  INNER JOIN SECAO S ON (P.COD_SEC = S.COD_SEC)'+
                '  INNER JOIN UNIDADE_MEDIDA UE ON (P.COD_UNI_ENT = UE.CODIGO)'+
                '  INNER JOIN UNIDADE_MEDIDA US ON (P.COD_UNI_SAI = US.CODIGO)'+
                '  LEFT OUTER JOIN SECAO_GRUPO SG ON (P.COD_SEC = SG.COD_SEC)'+
                '  AND (P.COD_GRUP = SG.COD_GRUPO)'+
                '  LEFT OUTER JOIN SECAO_GRUPO_SUBGRUPO SGS ON (P.COD_SEC = SGS.COD_SEC)'+
                '  AND (P.COD_GRUP = SGS.COD_GRUPO)'+
                '  AND (P.COD_SGRUP = SGS.COD_SUBGRUPO)'+
                '  INNER JOIN MARCAS ON (P.COD_MARC = MARCAS.CODIGO)';

   sLiga:= ' WHERE ';

   if EdtCons.Visible then
      sAuxString:= trim(EdtCons.Text);

   with QProd do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;

         if RdgAtivo.ItemIndex = 0 then
            begin
               sql.add(sSentenca + sLiga + ' P.ATIVO_PRO = ' + #39 + 'S' + #39);
               sLiga:= ' AND ';
            end
         else
            if RdgAtivo.ItemIndex = 1 then
               begin
                  sql.add(sSentenca + sLiga + ' P.ATIVO_PRO = ' + #39 + 'N' + #39);
                  sLiga:= ' AND ';
               end;

         case combocons.ItemIndex of
           -1:begin
                   sql.add(' ORDER BY P.COD_PRO ' + ByOrdem)
             end;
           0:begin
                if EdtCons.Text = '' then
                   sql.add(' ORDER BY P.COD_PRO, P.NOME_PRO ' + ByOrdem)
                else
                   sql.add(sSentenca + sLiga + ' COD_PRO = ' + edtcons.Text);
             end;
           1:sql.add(sSentenca + sLiga +  ' P.NOME_PRO LIKE ' + #39 + edtcons.Text + '%' + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
           //2:sql.add(sSentenca + sLiga +  ' P.REFERENCIA_PRO = ' + #39 + edtcons.Text + #39);
           2:sql.add(sSentenca + sLiga +  ' P.CODIGO_BARRA_PRO = ' + #39 + trim(edtcons.Text) + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
           {4:begin
                if trim(EdtCons.Text) = '' then
                   begin
                      showmessage('Digite o código do fabricante');
                      EdtCons.SetFocus;
                      exit;
                   end;
                sql.add(sSentenca + sLiga +  ' P.COD_LAB = ' + EdtCons.Text + ' ORDER BY P.NOME_PRO');
                open;
             end;}
           {3:begin
                if trim(EdtCons.Text) = '' then
                   begin
                      showmessage('Digite o código da seção');
                      EdtCons.SetFocus;
                      exit;
                   end;
                sql.Add(sSentenca + sLiga + ' P.COD_SEC = ' + EdtCons.Text + ' ORDER BY P.NOME_PRO');
             end;}
           3:sql.add(sSentenca + sLiga +  ' P.NOME_PRO LIKE ' + #39 + '%' + EdtCons.Text + '%' + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
         end;
         //Parambyname('codemp').AsInteger:= 1;

         //ShowMessage(QProd.SQL.Text);

         open;
      end;
   dbgrid.SetFocus;
end;

procedure TFrmConsProduto.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsProduto.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsProduto.Tag = 0) then
  begin
    FrmProdutos.edtCod.text := QProdCOD_PRO.AsString;
    FrmProdutos.btFiltroClick(Self);
    FrmProdutos.BtnAlterarClick(Self);
    FrmProdutos.edtCodGrupoChange(Self);
    FrmProdutos.edtSubCodGrupoChange(Self);
    FrmProdutos.EdtCodBarraExit(Self);
  end;

  //Form de Cadastro
  if (FrmConsProduto.Tag = 1) then
  begin
    FrmOutrasEntradas.EdtCodPro.text := QProdCOD_PRO.AsString;
    FrmOutrasEntradas.EdtCodProBarras.text := QProdCODIGO_BARRA_PRO.AsString;
    FrmOutrasEntradas.EdtNomePro.text := QProdNOME_PRO.AsString;
    FrmOutrasEntradas.edtCodGrp.text := QProdCOD_GRUP.AsString;
    FrmOutrasEntradas.CurrencyEdit1.Value := QProdPRECO_VAREJO.Value;
    FrmOutrasEntradas.edtQtdEst.Value := QProdQUANT_ESTOQ.Value;
  end;

  //Form de Cadastro
  if (FrmConsProduto.Tag = 2) then
  begin
    FrmOutrasSaidas.EdtCodBarraPro.text := QProdCODIGO_BARRA_PRO.AsString;
    FrmOutrasSaidas.EdtCodPro.text := QProdCOD_PRO.AsString;
    FrmOutrasSaidas.EdtNomePro.text := QProdNOME_PRO.AsString;
    FrmOutrasSaidas.edtCodGrp.text := QProdCOD_GRUP.AsString;
    FrmOutrasSaidas.EdtValorUnit.Value := QProdPRECO_VAREJO.Value;
    FrmOutrasSaidas.EdtEstoque.Value := QProdQUANT_ESTOQ.Value;
  end;

  //Form de Composição
  if (FrmConsProduto.Tag = 3) then
  begin
    FrmProdutosComposicao.Edit1.text := QProdCOD_PRO.AsString;
    FrmProdutosComposicao.EdtNomePro.text := QProdNOME_PRO.AsString;
  end;

  Close;
end;

end.
