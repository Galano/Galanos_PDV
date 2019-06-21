unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  REST.Types, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, FMX.ListBox, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ScrollBox, FMX.Grid, Data.DB, Datasnap.DBClient, REST.Response.Adapter,
  REST.Client, Data.Bind.ObjectScope, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.DateTimeCtrls, System.DateUtils, IPPeerClient,
  FMX.TabControl;

type
  TfrmConsultaCaixas = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    ClientDataSet2: TClientDataSet;
    BindSourceDB2: TBindSourceDB;
    ClientDataSet2COD_EMP: TWideStringField;
    ClientDataSet2RAZAO_EMP: TWideStringField;
    ClientDataSet2BAI_EMP: TWideStringField;
    ClientDataSet2CID_EMP: TWideStringField;
    ClientDataSet2CEP_EMP: TWideStringField;
    ClientDataSet2FANTASIA_EMP: TWideStringField;
    ClientDataSet2CNPJ_EMP: TWideStringField;
    cbListaEmp: TComboBox;
    lblTotal: TLabel;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    ClientDataSet1DATA: TWideStringField;
    ClientDataSet1HORA: TWideStringField;
    ClientDataSet1COD_EMP: TWideStringField;
    ClientDataSet1FANTASIA_EMP: TWideStringField;
    ClientDataSet1VALOR_VENDA: TWideStringField;
    Panel1: TPanel;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    edtFiltro: TDateEdit;
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    tbVendas: TTabItem;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    btnNext: TSpeedButton;
    TabItem6: TTabItem;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;
    btnBack: TSpeedButton;
    tbItensVenda: TTabItem;
    btnCarregar: TSpeedButton;
    btnSelecionar: TSpeedButton;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    BindSourceDB3: TBindSourceDB;
    RESTResponseDataSetAdapter3: TRESTResponseDataSetAdapter;
    ClientDataSet3: TClientDataSet;
    strGrid_DetalheVendas: TStringGrid;
    ClientDataSet1COD_VENDAS: TWideStringField;
    ClientDataSet3NOME_PRO: TWideStringField;
    ClientDataSet3QUANT_ITEM: TWideStringField;
    ClientDataSet3VALOR_UNIDADE: TWideStringField;
    ClientDataSet3VALOR_TOTAL: TWideStringField;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    ToolBar3: TToolBar;
    btnVoltar: TSpeedButton;
    lblTotalVenda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CarregarDados;
    procedure btnCarregarClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure cbListaEmpChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCaixas: TfrmConsultaCaixas;

implementation

{$R *.fmx}




procedure TfrmConsultaCaixas.btnAnteriorClick(Sender: TObject);
begin
  edtFiltro.Date := IncDay(edtFiltro.Date,-1);
  CarregarDados;
end;

procedure TfrmConsultaCaixas.btnCarregarClick(Sender: TObject);
begin
  CarregarDados;
end;

procedure TfrmConsultaCaixas.btnProximoClick(Sender: TObject);
begin
  edtFiltro.Date := IncDay(edtFiltro.Date,+1);
  CarregarDados;
end;

procedure TfrmConsultaCaixas.btnSelecionarClick(Sender: TObject);
begin
if BindSourceDB1.DataSet.FieldByName('COD_VENDAS').AsString<>'' then
begin
  ClientDataSet3.Active := False;
  RESTClient3.BaseURL := 'http://mablesaaf-com-br.umbler.net/vendas/carregar_itens_vendas/' + BindSourceDB1.DataSet.FieldByName('COD_VENDAS').AsString;
  RESTRequest3.ResetToDefaults;
  RESTRequest3.Execute;
  ClientDataSet3.Active := True;


  lblTotalVenda.Text := FormatFloat( 'R$ ,0.00',BindSourceDB1.DataSet.FieldByName('VALOR_VENDA').AsFloat );
  strGrid_DetalheVendas.Columns[0].Width := Self.Width * 0.50;
  strGrid_DetalheVendas.Columns[1].Width := Self.Width * 0.10;
  strGrid_DetalheVendas.Columns[2].Width := Self.Width * 0.15;
  strGrid_DetalheVendas.Columns[3].Width := Self.Width * 0.15;

  TabControl1.ActiveTab :=  tbItensVenda;
end;

end;

procedure TfrmConsultaCaixas.btnVoltarClick(Sender: TObject);
begin
  TabControl1.ActiveTab :=  tbVendas;
end;

procedure TfrmConsultaCaixas.CarregarDados;
var valor_total : Double ;
begin
  ClientDataSet1.Active := False;
  RESTClient1.BaseURL := 'http://mablesaaf-com-br.umbler.net/vendas/carregar_vendas/' + FormatDateTime('yyyy-mm-dd', edtFiltro.Date);
  RESTRequest1.ResetToDefaults;
  RESTRequest1.Execute;
  //RESTResponseDataSetAdapter1.active := False;
  //RESTResponseDataSetAdapter1.active := True;
  ClientDataSet1.Active := True;



  if cbListaEmp.Items.Count = 0 then
  begin
      RESTRequest2.ResetToDefaults;
      RESTRequest2.Execute;
      ClientDataSet2.Active := False;
      ClientDataSet2.Active := True;
      ClientDataSet2.Append;
      ClientDataSet2COD_EMP.AsInteger := 999;
      ClientDataSet2RAZAO_EMP.AsString := 'TODAS';
      ClientDataSet2FANTASIA_EMP.AsString :=  'TODAS';
      ClientDataSet2.Post;

      cbListaEmp.Items.Clear;
      ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin
        cbListaEmp.Items.Add(ClientDataSet2FANTASIA_EMP.AsString );

      ClientDataSet2.Next;
      end;
  end;


  ClientDataSet1.First;
  valor_total := 0;
  if ClientDataSet1.RecordCount >= 0 then
  begin
    while not ClientDataSet1.eof do begin
        try
            if ClientDataSet1VALOR_VENDA.AsString<>'' then
             valor_total := valor_total + ClientDataSet1VALOR_VENDA.AsFloat;
        except

        end;
    ClientDataSet1.Next;
    end;
  end;
  lblTotal.Text := FormatFloat( 'R$ ,0.00',valor_total);



  StringGrid1.Columns[0].Width := Self.Width * 0.15;
  StringGrid1.Columns[1].Width := Self.Width * 0.50;
  StringGrid1.Columns[2].Width := Self.Width * 0.25;

end;

procedure TfrmConsultaCaixas.cbListaEmpChange(Sender: TObject);
begin

  ClientDataSet1.Filtered := False;
  if cbListaEmp.Items.Strings[cbListaEmp.ItemIndex] = 'TODAS' then
    ClientDataSet1.Filter   := ''
  else
    ClientDataSet1.Filter   := 'FANTASIA_EMP = '''+cbListaEmp.Items.Strings[cbListaEmp.ItemIndex] +'''';

  ClientDataSet1.Filtered := True;

end;

procedure TfrmConsultaCaixas.FormActivate(Sender: TObject);
begin
  btnCarregarClick(self);
  TabControl1.ActiveTab :=  tbVendas;
end;

procedure TfrmConsultaCaixas.FormCreate(Sender: TObject);
begin
  edtFiltro.Date := now;
  cbListaEmp.Items.Clear;
end;

procedure TfrmConsultaCaixas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
btnSelecionarClick(self);
end;

end.
