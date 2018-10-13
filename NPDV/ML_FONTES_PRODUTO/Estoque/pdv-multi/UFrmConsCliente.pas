unit UFrmConsCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, System.Rtti, FMX.Grid,
  FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmConsCliente = class(TForm)
    Rectangle1: TRectangle;
    GroupBox1: TGroupBox;
    EdtCons: TEdit;
    Rectangle2: TRectangle;
    RdgAtivo: TRadioButton;
    RdgInativo: TRadioButton;
    RdgTodos: TRadioButton;
    Rectangle3: TRectangle;
    RdgDecresc: TRadioButton;
    RdgCresc: TRadioButton;
    StringGrid1: TStringGrid;
    QConsCliente: TIBQuery;
    QConsClienteCOD_CLI: TIntegerField;
    QConsClienteNOME_CLI: TIBStringField;
    QConsClienteCOD_CLA: TIntegerField;
    QConsClienteENDRES_CLI: TIBStringField;
    QConsClienteBAIRES_CLI: TIBStringField;
    QConsClienteCIDRES_CLI: TIBStringField;
    QConsClienteESTRES_CLI: TIBStringField;
    QConsClienteCEPRES_CLI: TIBStringField;
    QConsClienteTELRES_CLI: TIBStringField;
    QConsClienteCPF_CLI: TIBStringField;
    QConsClienteRG_CLI: TIBStringField;
    QConsClienteAPELIDO_CLI: TIBStringField;
    QConsClienteLIMITE_CLI: TIBBCDField;
    QConsClienteATIVO_CLI: TIBStringField;
    QConsClienteOBS_CLI: TIBStringField;
    QConsClienteNASCIMENTO_CLI: TDateField;
    QConsClienteDATACADASTRO_CLI: TDateField;
    QConsClienteATRAZO_MAXIMO_CLI: TIntegerField;
    QConsClienteCELULAR_CLI: TIBStringField;
    QConsClienteIMP_SALDO_PENDENTE_CLI: TIBStringField;
    QConsClienteLIMITE_CHEQUE: TIBBCDField;
    QConsClienteCONTATO_CLI: TIBStringField;
    QConsClienteCONTROLAR_LIMITE: TIBStringField;
    QConsClienteEMAIL_CLI: TIBStringField;
    QConsClienteNOME_CLA: TIBStringField;
    DSQConsCliente: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure EdtConsChangeTracking(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCliente: TFrmConsCliente;
  sSql: string;

implementation

{$R *.fmx}

Uses Udm, UVendas;

procedure TFrmConsCliente.EdtConsChangeTracking(Sender: TObject);
var
  sLiga, sSentenca, ByOrdem: string;
begin
  sSql := 'SELECT C.*, S.NOME_CLA ' + 'FROM CLIENTE C ' +
    'INNER JOIN CLASSIF_CLIENTE S ' + 'ON (C.COD_CLA = S.COD_CLA) ';

  sLiga := ' WHERE ';

  if RdgCresc.IsChecked then
  begin
    ByOrdem := 'asc';
  end;

  if RdgDecresc.IsChecked then
  begin
    ByOrdem := 'desc';
  end;

  with QConsCliente do
  begin
    close;
    sql.Clear;
    //sql.Text := sSql;

    if RdgAtivo.IsChecked then
    begin
      sql.add(sSql + sLiga + ' C.ATIVO_CLI = ' + #39 + 'S' + #39);
      //sLiga := ' AND ';
    end
    else if RdgInativo.IsChecked then
    begin
      sql.add(sSql + sLiga + ' C.ATIVO_CLI = ' + #39 + 'N' + #39);
      //sLiga := ' AND ';
    end;

    if RdgTodos.IsChecked then
    begin
      sql.add( ' C.NOME_CLI LIKE ' + #39 + EdtCons.Text + '%' +
      #39 + ' ORDER BY C.NOME_CLI ' + ByOrdem);
    end
    else
    begin
      sql.add( ' AND C.NOME_CLI LIKE ' + #39 + EdtCons.Text + '%' +
      #39 + ' ORDER BY C.NOME_CLI ' + ByOrdem);
    end;
    open;
  end;
end;

procedure TFrmConsCliente.FormShow(Sender: TObject);
begin
  EdtCons.SetFocus;
  sSql := QConsCliente.sql.Text;
end;

procedure TFrmConsCliente.StringGrid1DblClick(Sender: TObject);
begin
  //Form de Vendas
  if (FrmConsCliente.Tag = 0) then
  begin
    FrmVendas.EDT_Cliente.Text := QConsClienteCOD_CLI.AsString;
  end;

  Close;
end;

end.
