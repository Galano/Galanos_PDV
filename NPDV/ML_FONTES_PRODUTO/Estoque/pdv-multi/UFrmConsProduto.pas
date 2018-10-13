unit UFrmConsProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.Rtti, FMX.Layouts,
  FMX.Grid, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrmConsProduto = class(TForm)
    Rectangle1: TRectangle;
    GroupBox1: TGroupBox;
    EdtCons: TEdit;
    RdgCresc: TRadioButton;
    RdgDecresc: TRadioButton;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    RdgAtivo: TRadioButton;
    RdgInativo: TRadioButton;
    RdgTodos: TRadioButton;
    StringGrid1: TStringGrid;
    QProd: TIBQuery;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure EdtConsChangeTracking(Sender: TObject);
    procedure EdtConsChange(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdtConsKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProduto: TFrmConsProduto;
  sSql,sAuxString : string;

implementation

{$R *.fmx}

Uses Udm, UVendas;

procedure TFrmConsProduto.EdtConsChange(Sender: TObject);
var
  sLiga, sSentenca, ByOrdem : string;
begin
   if RdgCresc.IsChecked then
   begin
      ByOrdem := 'asc';
   end;

   if RdgDecresc.IsChecked then
   begin
      ByOrdem := 'desc';
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

         if RdgAtivo.IsChecked then
            begin
               sql.add(sSentenca + sLiga + ' P.ATIVO_PRO = ' + #39 + 'S' + #39);
               sLiga:= ' AND ';
            end
         else
            if RdgInativo.IsChecked then
               begin
                  sql.add(sSentenca + sLiga + ' P.ATIVO_PRO = ' + #39 + 'N' + #39);
                  sLiga:= ' AND ';
               end;

         SQL.add(sSentenca + sLiga +  ' P.NOME_PRO LIKE ' + #39 + EdtCons.Text + '%' + #39 + ' ORDER BY P.NOME_PRO ' + ByOrdem);
         open;
      end;
end;

procedure TFrmConsProduto.EdtConsChangeTracking(Sender: TObject);
var
  thetext: String;
begin
  thetext := EdtCons.Text;
  EdtCons.OnChangeTracking := nil;
  EdtCons.Text := '';
  EdtCons.Text := AnsiUpperCase(thetext);
  EdtCons.OnChangeTracking := EdtConsChangeTracking;
  EdtCons.GoToTextEnd;
end;

procedure TFrmConsProduto.EdtConsKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = VKReturn) then
  begin
    StringGrid1.SetFocus;
  end;
end;

procedure TFrmConsProduto.FormShow(Sender: TObject);
begin
  EdtCons.SetFocus;
end;

procedure TFrmConsProduto.StringGrid1DblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsProduto.Tag = 0) then
  begin
    FrmVendas.mskCodigo.Text := QProdCODIGO_BARRA_PRO.AsString;
  end;

  Close;
end;

procedure TFrmConsProduto.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Key = VKReturn) then
  begin
    //Form de Cadastro
    if (FrmConsProduto.Tag = 0) then
    begin
      FrmVendas.mskCodigo.Text := QProdCODIGO_BARRA_PRO.AsString;
    end;

    Close;
  end;
end;

end.
