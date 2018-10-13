unit UFrmRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TFrmRelVendas = class(TForm)
    Panel1: TPanel;
    BtnConsCli: TSpeedButton;
    Label2: TLabel;
    CheckCli: TCheckBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    EdtNomeCli: TEdit;
    GBTipoVenda: TGroupBox;
    ComboTipoVenda: TComboBox;
    CheckTipoVenda: TCheckBox;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnSair: TBitBtn;
    EdtCodCli: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    lbCodFP: TLabel;
    LinkFillControlToPropertyCaption: TLinkFillControlToProperty;
    DataSource1: TDataSource;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    ExcluirVenda1: TMenuItem;
    Q_Itens_Venda: TIBQuery;
    Dts_Itens_Vendas: TDataSource;
    DBGrid2: TDBGrid;
    Q_Itens_VendaCOD_ITEM: TIntegerField;
    Q_Itens_VendaCOD_VENDA: TIntegerField;
    Q_Itens_VendaCOD_PRO: TIntegerField;
    Q_Itens_VendaORDEM: TIntegerField;
    Q_Itens_VendaQUANT_ITEM: TIBBCDField;
    Q_Itens_VendaVALOR_ITEM: TIBBCDField;
    Q_Itens_VendaNOME_PRO: TIBStringField;
    QPesqEstoque: TIBQuery;
    QPesqEstoqueCOD_PRO: TIntegerField;
    QPesqEstoqueNOME_PRO: TIBStringField;
    QPesqEstoqueQUANT_ESTOQ: TIBBCDField;
    Q_ESTOQUE: TIBQuery;
    PopupMenu2: TPopupMenu;
    Excluirprodutodavenda1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Q_Caixa_Aberto: TIBQuery;
    Q_Caixa_AbertoCOD_CAIXA: TIntegerField;
    Q_Caixa_AbertoCOD_USU: TIntegerField;
    Q_Caixa_AbertoDATA_ABERTURA: TDateField;
    Q_Caixa_AbertoHORA_ABERTURA: TTimeField;
    Q_Caixa_AbertoVL_ABERTURA: TIBBCDField;
    Q_Caixa_AbertoVL_FECHAMENTO: TIBBCDField;
    Q_Caixa_AbertoVL_VENDAS: TIBBCDField;
    Q_Caixa_AbertoRETIRADAS: TIBBCDField;
    Q_Caixa_AbertoSALDO: TIBBCDField;
    Q_Caixa_AbertoDATA_FECHAMENTO: TDateField;
    Q_Caixa_AbertoHORA_FECHAMENTO: TTimeField;
    Q_Caixa_AbertoSTATUS: TIBStringField;
    Q_Total_Vendas: TIBQuery;
    Q_Total_VendasSUM: TIBBCDField;
    N2VIADECUPOM1: TMenuItem;
    N1: TMenuItem;
    Q_Itens_VendaPRECO_VAREJO: TIBBCDField;
    Q_Itens_VendaPRECO_PROMOCAO: TIBBCDField;
    Button2: TButton;
    Q_Qtd_vendida: TIBQuery;
    Q_Qtd_vendidaCOD_PRO: TIntegerField;
    Q_Qtd_vendidaTOTAL_VENDIDO: TIBBCDField;
    Q_Qtd_vendidaNOME_PRO: TIBStringField;
    Q_Qtd_vendidaDATA: TDateField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure CheckCliClick(Sender: TObject);
    procedure CheckTipoVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExcluirVenda1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Excluirprodutodavenda1Click(Sender: TObject);
    procedure N2VIADECUPOM1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendas: TFrmRelVendas;
  sSql: String;

implementation

{$R *.dfm}

Uses Udm, UFrmConsClientes, UFrmQRelVendas, UBibliotecas, untImpressao, UFrmQrVendasDia;

procedure TFrmRelVendas.BtnConsCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClientes, FrmConsClientes);
  FrmConsClientes.Tag := 3;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;
end;

procedure TFrmRelVendas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelVendas.BtnVisClick(Sender: TObject);
var
  sql_vendas: String;
  hj: TDate;
begin
  hj := Date();

  sSql := '';
  sSql := 'SELECT';
  sSql := sSql + '  VENDAS.COD_VENDAS,';
  sSql := sSql + '    VENDAS.COD_CLIENTE,';
  sSql := sSql + '    CLIENTE.NOME_CLI,';
  sSql := sSql + '    FORMAS_PAGAMENTO.CODIGO,';
  sSql := sSql + '    FORMAS_PAGAMENTO.DESCRICAO,';
  sSql := sSql + '    VENDAS.TOTAL,';
  sSql := sSql + '    VENDAS.DATA,';
  sSql := sSql + '    VENDAS.HORA,';
  sSql := sSql + '    VENDAS.OBS';
  sSql := sSql + '  FROM';
  sSql := sSql + '    CLIENTE';
  sSql := sSql +
    '    INNER JOIN VENDAS ON (CLIENTE.COD_CLI = VENDAS.COD_CLIENTE)';
  sSql := sSql +
    '    INNER JOIN FORMAS_PAGAMENTO ON (VENDAS.COD_FPGTO = FORMAS_PAGAMENTO.CODIGO)';

  with DmDados.QRelVendas do
  begin
    Close;
    sql.Clear;
    sql.Text := sSql;
    sql.Add(' WHERE VENDAS.DATA BETWEEN :DATAINI AND :DATAFIN ');

    if EdtCodCli.Text <> '' then
      sql.Add(' AND VENDAS.COD_CLIENTE = ' + EdtCodCli.Text);

    if ComboTipoVenda.ItemIndex > -1 then
      sql.Add(' AND VENDAS.COD_FPGTO = ' + lbCodFP.Caption);

    sql.Add(' ORDER BY VENDAS.DATA, VENDAS.COD_VENDAS');
    Parambyname('dataini').AsDate := EdtDataIni.Date;
    Parambyname('datafin').AsDate := EdtDataFin.Date;
    open;
  end;

  if (DateToStr(EdtDataFin.Date) <= DateToStr(hj)) or (DateToStr(EdtDataFin.Date) <= DateToStr(hj - 1)) then
  begin
    Label3.Visible := true;
    Label4.Visible := true;
    Label5.Visible := true;
    CurrencyEdit1.Visible := true;
    CurrencyEdit2.Visible := true;
    CurrencyEdit3.Visible := true;

    { sql_vendas := '';
      sql_vendas := sql_vendas + 'SELECT';
      sql_vendas := sql_vendas + '  SUM(VENDAS.TOTAL)';
      sql_vendas := sql_vendas + '  FROM';
      sql_vendas := sql_vendas + '    CLIENTE';
      sql_vendas := sql_vendas + '  INNER JOIN VENDAS ON (CLIENTE.COD_CLI = VENDAS.COD_CLIENTE)';
      sql_vendas := sql_vendas + '  INNER JOIN FORMAS_PAGAMENTO ON (VENDAS.COD_FPGTO = FORMAS_PAGAMENTO.CODIGO)';
      sql_vendas := sql_vendas + '  INNER JOIN FORMAS_PAGAMENTO ON (VENDAS.COD_FPGTO = FORMAS_PAGAMENTO.CODIGO)'; }

    with Q_Total_Vendas do
    begin
      Close;
      Parambyname('dt').Value := EdtDataIni.DateTime;
      Parambyname('dt2').Value := EdtDataFin.DateTime;
      open;
      FetchAll;
    end;

    CurrencyEdit2.Value := Q_Total_VendasSUM.Value;

    with Q_Caixa_Aberto do
    begin
      Close;
      Parambyname('dt').AsDate := EdtDataIni.Date;
      open;
      FetchAll;
    end;

    if (Q_Caixa_Aberto.RecordCount > 0) then
    begin
      CurrencyEdit1.Value := Q_Caixa_AbertoVL_ABERTURA.Value;
    end
    else
    begin
      CurrencyEdit1.Value := 0;
    end;

    CurrencyEdit3.Value := CurrencyEdit1.Value + CurrencyEdit2.Value;

  end
  else
  begin
    Label3.Visible := false;
    Label4.Visible := false;
    Label5.Visible := false;
    CurrencyEdit1.Visible := false;
    CurrencyEdit2.Visible := false;
    CurrencyEdit3.Visible := false;
  end;

  Application.CreateForm(TFrmQRelVendas, FrmQRelVendas);
  FrmQRelVendas.QRLTitulo.Caption := 'Relatório de Vendas no período: ' +
    DateToStr(EdtDataIni.Date) + ' a ' + DateToStr(EdtDataFin.Date);

  { if sender = btnvis then
    begin
    FrmQRelVendas.QRVendas.PreviewInitialState:= wsMaximized;
    FrmQRelVendas.QRVendas.Preview;
    end
    else
    begin
    FrmQRelVendas.QRVendas.PrinterSetup;
    FrmQRelVendas.QRVendas.Print;
    end;

    FrmQRelVendas.QRVendas.QRPrinter:= nil;
    DmDados.QRelVendas.SQL.Clear;
    DmDados.QRelVendas.SQL.Text:= sSql;
    DmDados.QRelVendas.close; }
end;

procedure TFrmRelVendas.Button1Click(Sender: TObject);
begin
  // Application.CreateForm(TFrmQRelVendas, FrmQRelVendas);
  FrmQRelVendas.QRLTitulo.Caption := 'Relatório de Vendas no período: ' +
    DateToStr(EdtDataIni.Date) + ' a ' + DateToStr(EdtDataFin.Date);

  if Sender = BtnVis then
  begin
    FrmQRelVendas.QRVendas.PreviewInitialState := wsMaximized;
    FrmQRelVendas.QRVendas.Preview;
  end
  else
  begin
    { FrmQRelVendas.QRVendas.PrinterSetup;
      FrmQRelVendas.QRVendas.Print; }

    FrmQRelVendas.QRVendas.PreviewInitialState := wsMaximized;
    FrmQRelVendas.QRVendas.Preview;
  end;

  FrmQRelVendas.QRVendas.QRPrinter := nil;
  { DmDados.QRelVendas.SQL.Clear;
    DmDados.QRelVendas.SQL.Text:= sSql;
    DmDados.QRelVendas.close; }
end;

procedure TFrmRelVendas.Button2Click(Sender: TObject);
begin
  with DmDados.Q_Qtd_vendida do
  begin
    Close;
    Parambyname('dt1').AsDate := EdtDataIni.Date;
    Parambyname('dt2').AsDate := EdtDataFin.Date;
    open;
  end;

  Application.CreateForm(TFrmQrVendasDia, FrmQrVendasDia);
  FrmQrVendasDia.QRVendas.PreviewInitialState := wsMaximized;
  FrmQrVendasDia.QRVendas.Preview;
end;

procedure TFrmRelVendas.CheckCliClick(Sender: TObject);
begin
  if CheckCli.Checked then
  begin
    EdtCodCli.Clear;
    EdtNomeCli.Clear;
    EdtCodCli.Enabled := false;
    EdtNomeCli.Enabled := false;
    BtnConsCli.Enabled := false;
  end
  else
  begin
    EdtCodCli.Enabled := true;
    EdtNomeCli.Enabled := true;
    BtnConsCli.Enabled := true;
    EdtCodCli.SetFocus;
  end;
end;

procedure TFrmRelVendas.CheckTipoVendaClick(Sender: TObject);
begin
  if CheckTipoVenda.Checked then
  begin
    ComboTipoVenda.ItemIndex := -1;
    GBTipoVenda.Enabled := false;
  end
  else
  begin
    GBTipoVenda.Enabled := true;
    ComboTipoVenda.ItemIndex := 0;
    ComboTipoVenda.SetFocus;
  end;
end;

procedure TFrmRelVendas.DBGrid1CellClick(Column: TColumn);
begin
  with Q_Itens_Venda do
  begin
    Close;
    Parambyname('cod').Value := DmDados.QRelVendasCOD_VENDAS.Value;
    open;
  end;
end;

procedure TFrmRelVendas.Excluirprodutodavenda1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão do produto?', 'Exclusão',
    mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
  begin
    try
      // atualiza o valor da nota
      with DmDados.Q_executa do
      begin
        Close;
        sql.Clear;
        sql.Add('UPDATE VENDAS SET TOTAL = :tot WHERE VENDAS.COD_VENDAS = :cod');
        Parambyname('tot').Value := DmDados.QRelVendasTOTAL.Value -
          Q_Itens_VendaVALOR_ITEM.Value;
        Parambyname('cod').Value := DmDados.QRelVendasCOD_VENDAS.Value;
        ExecSQL;
      end;

      with DmDados.Q_executa do
      begin
        Close;
        sql.Clear;
        sql.Add('DELETE FROM ITENS_VENDA ' + 'WHERE COD_ITEM = :COD');
        Parambyname('cod').AsInteger := Q_Itens_VendaCOD_ITEM.Value;
        ExecSQL;
      end;

      with QPesqEstoque do
      begin
        Close;
        Parambyname('cod').Value := Q_Itens_VendaCOD_PRO.Value;
        open;
        FetchAll;
      end;

      if (QPesqEstoque.RecordCount > 0) then
      begin
        with Q_ESTOQUE do
        begin
          Close;
          Parambyname('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value -
            Q_Itens_VendaQUANT_ITEM.Value;
          Parambyname('cod').Value := Q_Itens_VendaCOD_PRO.Value;
          ExecSQL;
        end;
      end;

      DmDados.IBTransaction1.CommitRetaining;

      with Q_Itens_Venda do
      begin
        Close;
        Parambyname('cod').Value := DmDados.QRelVendasCOD_VENDAS.Value;
        open;
      end;

      Application.MessageBox('Produto excluida com sucesso!', 'Informação',
        MB_OK + MB_ICONINFORMATION);

    except
      DmDados.IBTransaction1.RollbackRetaining;
      Application.MessageBox('Erro ao tentar esxluir o produto da venda!',
        'Informação', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TFrmRelVendas.ExcluirVenda1Click(Sender: TObject);
var
  cod_venda: integer;
begin
  cod_venda := DmDados.QRelVendasCOD_VENDAS.Value;
  if (excluir('VENDAS', 'COD_VENDAS', DmDados.QRelVendasCOD_VENDAS.AsString))
  then
  begin
    Q_Itens_Venda.First;
    while not Q_Itens_Venda.Eof do
    begin
      try
        with DmDados.Q_executa do
        begin
          Close;
          sql.Clear;
          sql.Add('DELETE FROM ITENS_VENDA ' + 'WHERE COD_ITEM = :COD');
          Parambyname('cod').AsInteger := Q_Itens_VendaCOD_ITEM.Value;
          ExecSQL;
        end;

        with QPesqEstoque do
        begin
          Close;
          Parambyname('cod').Value := Q_Itens_VendaCOD_PRO.Value;
          open;
          FetchAll;
        end;

        if (QPesqEstoque.RecordCount > 0) then
        begin
          with Q_ESTOQUE do
          begin
            Close;
            Parambyname('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value +
              Q_Itens_VendaQUANT_ITEM.Value;
            Parambyname('cod').Value := Q_Itens_VendaCOD_PRO.Value;
            ExecSQL;
          end;
        end;

        DmDados.IBTransaction1.CommitRetaining;

      except
        DmDados.IBTransaction1.RollbackRetaining;
        // Application.MessageBox('Venda excluida com sucesso!','Informação', MB_OK+MB_ICONERROR);
      end;

      Q_Itens_Venda.Next;
    end;
    BtnVisClick(Self);
    Application.MessageBox('Venda excluida com sucesso!', 'Informação',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFrmRelVendas.FormShow(Sender: TObject);
begin
  DmDados.tb_fpagamentos.Close;
  DmDados.tb_fpagamentos.open;

  sSql := DmDados.QRelVendas.sql.Text;
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
  CheckTipoVenda.Checked := true;
  CheckCli.Checked := true;
  EdtDataIni.SetFocus;
end;

procedure TFrmRelVendas.N2VIADECUPOM1Click(Sender: TObject);
begin
  // Imprime o cupom
  if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,
    DmDados.tb_empresaTEL_EMP.AsString, DmDados.tb_empresaCNPJ_EMP.Value,
    DmDados.tb_empresaEND_EMP.AsString, DmDados.QRelVendasCOD_VENDAS.AsString, DmDados.QRelVendasNOME_CLI.AsString,
    DmDados.QRelVendasDESCRICAO.AsString, formatfloat('##,###,##0.00', StrToFloat('0')),
    formatfloat('##,###,##0.00', 0),
    formatfloat('##,###,##0.00', DmDados.QRelVendasTOTAL.Value), formatfloat('##,###,##0.00',
    0)) then
  begin
     Application.MessageBox('O cupom foi impresso com sucesso!', '2ª via de cupom', MB_OK+MB_ICONINFORMATION);
  end;
end;

end.
