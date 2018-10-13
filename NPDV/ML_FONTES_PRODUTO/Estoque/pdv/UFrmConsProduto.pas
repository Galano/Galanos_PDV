unit UFrmConsProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmConsProduto = class(TForm)
    Panel1: TPanel;
    GB2: TGroupBox;
    BtnCons: TSpeedButton;
    EdtCons: TEdit;
    RdgAtivo: TRadioGroup;
    RdOrdem: TRadioGroup;

    DSProd: TDataSource;
    DBGrid: TDBGrid;
    BtnOk: TButton;
    QProd: TFDQuery;
    QProdCOD_PRO: TIntegerField;
    QProdCODIGO_BARRA_PRO: TStringField;
    QProdTP_PRODUTO: TStringField;
    QProdTP_PRODUCAO: TStringField;
    QProdESTOQUE_MINIMO: TBCDField;
    QProdNOME_PRO: TStringField;
    QProdDESC_CUPOM: TStringField;
    QProdCOD_MARC: TIntegerField;
    QProdCOD_SEC: TIntegerField;
    QProdCOD_GRUP: TIntegerField;
    QProdCOD_SGRUP: TIntegerField;
    QProdCOD_UNI_ENT: TIntegerField;
    QProdCOD_UNI_SAI: TIntegerField;
    QProdPRECO_VAREJO: TBCDField;
    QProdPRECO_PROMOCAO: TBCDField;
    QProdPRECO_PRAZO: TBCDField;
    QProdMARGEM_LUCRO: TBCDField;
    QProdQUANT_ESTOQ: TBCDField;
    QProdDATA_VALIDADE: TDateField;
    QProdDIAS_VALIDADE_PRO: TIntegerField;
    QProdCONTROLA_ESTOQUE_PRO: TStringField;
    QProdATIVO_PRO: TStringField;
    QProdCAMINHO_FOTO_PRO: TBlobField;
    QProdNOME_SEC: TStringField;
    QProdDESCRICAO: TStringField;
    QProdDESCRICAO_1: TStringField;
    QProdUND_ENTRADA: TStringField;
    QProdUND_SAIDA: TStringField;
    QProdDESCRICAO_2: TStringField;
    procedure DBGridDblClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure EdtConsChange(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtConsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProduto: TFrmConsProduto;
  sSql,sAuxString : string;

implementation

uses Udm,  UVendas;

{$R *.dfm}

procedure TFrmConsProduto.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsProduto.Tag = 0) then
  begin
    FrmVendas.mskCodigo.Text := QProdCODIGO_BARRA_PRO.AsString;
  end;

  Close;
end;

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

         SQL.add(sSentenca + sLiga +  ' P.NOME_PRO LIKE ' + #39 + EdtCons.Text + '%' + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
         open;
      end;
   dbgrid.SetFocus;

end;

procedure TFrmConsProduto.EdtConsChange(Sender: TObject);
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

         SQL.add(sSentenca + sLiga +  ' P.NOME_PRO LIKE ' + #39 + EdtCons.Text + '%' + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
         open;
      end;
end;

procedure TFrmConsProduto.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Return) then
  begin
    DBGridDblClick(Self);
  end;
end;

procedure TFrmConsProduto.EdtConsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Return) then
  begin
    DBGrid.SetFocus;
  end;
end;

end.
