unit UVendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.Rtti,
  FMX.Grid, FMX.Layouts, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, Datasnap.DBClient,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, FMX.EditBox, FMX.SpinBox,
  FMX.DateTimeCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ScrollBox, FMX.Memo;

type
  TFrmVendas = class(TForm)
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    imglogoTopo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    rectItemNome: TRectangle;
    lbPRODUTO: TLabel;
    rectLogo: TRectangle;
    mskCodigo: TEdit;
    rectCodB: TRectangle;
    Label3: TLabel;
    rectQtd: TRectangle;
    mskQuantidade: TEdit;
    Label4: TLabel;
    rectVlUni: TRectangle;
    edtValorUni: TEdit;
    Label5: TLabel;
    rectTotalItem: TRectangle;
    edtTotalItem: TEdit;
    Label6: TLabel;
    lbTitulo: TLabel;
    Rectangle5: TRectangle;
    grdVendas: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Rectangle6: TRectangle;
    lbAvisos: TLabel;
    Label8: TLabel;
    Rectangle7: TRectangle;
    Label10: TLabel;
    Label11: TLabel;
    Q_Clientes: TIBQuery;
    Q_ClientesCOD_CLI: TIntegerField;
    Q_ClientesNOME_CLI: TIBStringField;
    Q_ClientesLIMITE_CLI: TIBBCDField;
    Q_FPGTO: TIBQuery;
    Q_FPGTOCODIGO: TIntegerField;
    Q_FPGTODESCRICAO: TIBStringField;
    Q_BaixaItem: TIBQuery;
    QtdEstoqueItem: TIBQuery;
    QtdEstoqueItemCOD_PRO: TIntegerField;
    QtdEstoqueItemCODIGO_BARRA_PRO: TIBStringField;
    QtdEstoqueItemTP_PRODUTO: TIBStringField;
    QtdEstoqueItemNOME_PRO: TIBStringField;
    QtdEstoqueItemCOD_UNI_SAI: TIntegerField;
    QtdEstoqueItemPRECO_VAREJO: TIBBCDField;
    QtdEstoqueItemPRECO_PROMOCAO: TIBBCDField;
    QtdEstoqueItemQUANT_ESTOQ: TIBBCDField;
    QtdEstoqueItemATIVO_PRO: TIBStringField;
    Q_ProdCod: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IntegerField2: TIntegerField;
    IBBCDField1: TIBBCDField;
    IBBCDField2: TIBBCDField;
    IBBCDField3: TIBBCDField;
    IBStringField4: TIBStringField;
    QProd_CodBarra: TIBQuery;
    QProd_CodBarraCOD_PRO: TIntegerField;
    QProd_CodBarraCODIGO_BARRA_PRO: TIBStringField;
    QProd_CodBarraTP_PRODUTO: TIBStringField;
    QProd_CodBarraNOME_PRO: TIBStringField;
    QProd_CodBarraCOD_UNI_SAI: TIntegerField;
    QProd_CodBarraPRECO_VAREJO: TIBBCDField;
    QProd_CodBarraPRECO_PROMOCAO: TIBBCDField;
    QProd_CodBarraQUANT_ESTOQ: TIBBCDField;
    QProd_CodBarraATIVO_PRO: TIBStringField;
    Q_Items_Vendas: TIBQuery;
    Q_PegaUltmoCodVenda: TIBQuery;
    Q_PegaUltmoCodVendaCOD_VENDA: TIntegerField;
    Q_PegaUltmoCodVendaCOD_CLIENTE: TIntegerField;
    Q_PegaUltmoCodVendaCOD_FPGTO: TIntegerField;
    Q_PegaUltmoCodVendaCOD_VENDEDOR: TIntegerField;
    BitBtn1: TButton;
    spCodVenda: TEdit;
    EdtTotal: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PNL_Fechamento: TRectangle;
    Label7: TLabel;
    Rectangle1: TRectangle;
    Label9: TLabel;
    EDT_Cliente: TEdit;
    lbCliente: TEdit;
    Label12: TLabel;
    Rectangle2: TRectangle;
    EDT_CondPagto: TEdit;
    Lbfp: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Rectangle3: TRectangle;
    EdtDesconto: TEdit;
    Label15: TLabel;
    edtSubToltal: TEdit;
    Label16: TLabel;
    Rectangle4: TRectangle;
    edtTotalCom: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Rectangle8: TRectangle;
    Edit7: TEdit;
    DateRecebimento: TDateEdit;
    Label19: TLabel;
    Rectangle9: TRectangle;
    edtTroco: TEdit;
    Label20: TLabel;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    ShadowEffect8: TShadowEffect;
    ImgLogo: TImage;
    cdsitensVendas: TFDMemTable;
    cdsitensVendascod: TIntegerField;
    cdsitensVendasdescricao: TStringField;
    cdsitensVendasqtd: TCurrencyField;
    cdsitensVendasvl_item: TCurrencyField;
    cdsitensVendasTotal_Item: TCurrencyField;
    cdsitensVendascodBarra: TStringField;
    cdsitensVendasvl_unitario: TCurrencyField;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    cdsitensVendasTotal: TAggregateField;
    EdtLimitCli: TEdit;
    edtRecebido: TEdit;
    pnlObs: TPanel;
    Memo1: TMemo;
    BitBtn2: TButton;
    BitBtn3: TButton;
    BtnDateRecebimento: TButton;
    SpCod_Usuario: TEdit;
    Label21: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label22: TLabel;
    SpeedButton5: TSpeedButton;
    Image2: TImage;
    SpeedButton3: TSpeedButton;
    Image3: TImage;
    SpeedButton4: TSpeedButton;
    Image4: TImage;
    SpeedButton6: TSpeedButton;
    Image5: TImage;
    procedure mskCodigoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure mskQuantidadeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtValorUniKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtTotalItemKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mskQuantidadeExit(Sender: TObject);
    procedure edtValorUniExit(Sender: TObject);
    procedure edtTotalItemExit(Sender: TObject);
    procedure mskQuantidadeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure spCodVendaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure mskCodigoChangeTracking(Sender: TObject);
    procedure EDT_ClienteChangeTracking(Sender: TObject);
    procedure EdtLimitCliChangeTracking(Sender: TObject);
    procedure EDT_CondPagtoChangeTracking(Sender: TObject);
    procedure edtRecebidoChangeTracking(Sender: TObject);
    procedure EDT_ClienteExit(Sender: TObject);
    procedure EDT_CondPagtoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtDescontoEnter(Sender: TObject);
    procedure EdtDescontoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure DateRecebimentoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDT_ClienteKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EDT_CondPagtoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdtDescontoChangeTracking(Sender: TObject);
    procedure BtnDateRecebimentoClick(Sender: TObject);
    procedure edtRecebidoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure grdVendasKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function VendeItem(qtd, vlunit: Double): Double;
    function GeneratorID(aName: string; Connection: TIBDatabase;
      Incrementa: Boolean): integer;
    function PegaCodVenda: integer;
    function FinnalizaVenda(Cod_Venda: integer): Boolean;
    function BaixaItemVenda(Cod_Venda, COD_PRO, COD_EMP, ORDEM: integer;
      QUANT_ITEM: Currency; VALOR_ITEM: Currency): Boolean;
    procedure AddItemVenda;
  end;

var
  FrmVendas: TFrmVendas;
  VendaAberta: Boolean;
  NumVenda: String;

implementation

{$R *.fmx}

Uses Udm, UFrmConsProduto, untImpressao, UfrmLogin, UFrmConsCliente;

function Excluir(Tabela, campo_tabela, campo_excluir: string): Boolean;
begin
  try
    try
      with DmDados.Q_executa do
      begin
        sql.Clear;
        sql.Add('DELETE FROM ' + Tabela + ' WHERE ' + campo_tabela + ' = ' + #39
          + campo_excluir + #39);
        ExecSQL;
      end;

      Result := true;
      DmDados.IBTransaction1.CommitRetaining;

    except
      DmDados.IBTransaction1.RollbackRetaining;
      Result := false;
    end;
  finally
    DmDados.Q_executa.Close;
  end;

end;

procedure TFrmVendas.mskCodigoChangeTracking(Sender: TObject);
begin
  if (mskCodigo.Text <> '') then
  begin
    with QProd_CodBarra do
    begin
      Close;
      ParamByName('cod').Value := mskCodigo.Text;
      Open;
      FetchAll;
    end;

    if (QProd_CodBarra.RecordCount > 0) then
    begin
      lbPRODUTO.Text := QProd_CodBarraNOME_PRO.AsString;

      if (QProd_CodBarraPRECO_PROMOCAO.Value <> 0) then
      begin
        edtValorUni.Text := QProd_CodBarraPRECO_PROMOCAO.AsString;
        edtValorUniExit(Self);
      end
      else
      begin
        edtValorUni.Text := QProd_CodBarraPRECO_VAREJO.AsString;
        edtValorUniExit(Self);
      end;
    end
    else
    begin
      lbPRODUTO.Text := 'PRODUTO NÃO ENCONTRADO...'
    end;

  end;
end;

procedure TFrmVendas.mskCodigoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  TotalItem: Double;
begin
  if (Key = VKF3) then
  begin
    Application.CreateForm(TFrmConsProduto, FrmConsProduto);
    FrmConsProduto.Tag := 0;
    FrmConsProduto.Showmodal;
    FrmConsProduto.Hide;
    FrmConsProduto.Free;
  end;

  if (Key = vkReturn) then
  begin
    mskQuantidade.Text := '1';

    if (StrToFloat(mskQuantidade.Text) > 0) then
    begin
      TotalItem := VendeItem(StrToFloat(StringReplace(mskQuantidade.Text, '.',
        ',', [rfReplaceAll])), StrToFloat(StringReplace(edtValorUni.Text, '.',
        ',', [rfReplaceAll])));

        edtTotalItem.Text := edtTotalItem.Text;
        edtTotalItemExit(Self);

      mskCodigo.SetFocus;
    end
    else
    begin
        MessageDlg('Você deve informar a quantidade.',
        System.UITypes.TMsgDlgType.mtWarning,
        [System.UITypes.TMsgDlgBtn.mbOK], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrOk:
              begin
{$IFDEF WIN32}
                mskQuantidade.Text := '1';
                mskQuantidade.SetFocus;
                Abort;
{$ENDIF}
              end;
          end;
        end);

    end;
    mskQuantidade.SetFocus;
  end;
end;

procedure TFrmVendas.mskQuantidadeChange(Sender: TObject);
begin
  mskQuantidade.Text := FormatFloat('###,###,##0.000',
    mskQuantidade.Text.ToDouble());
  // mskQuantidade.Text := CurrToStrF(StrToCurr(Trim(mskQuantidade.Text)),ffFixed,3);
end;

procedure TFrmVendas.mskQuantidadeExit(Sender: TObject);
begin
  // mskQuantidade.Text := FormatFloat('###,###,##0.000', mskQuantidade.Text.ToDouble());
end;

procedure TFrmVendas.mskQuantidadeKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
var
  TotalItem: Double;
begin
  if (Key = vkReturn) then
  begin
    with QProd_CodBarra do
    begin
      Close;
      ParamByName('cod').Value := mskCodigo.Text;
      Open;
      FetchAll;
    end;

    if (QProd_CodBarra.RecordCount > 0) then
    begin
      if (mskCodigo.Text = '') then
      begin
        mskCodigo.SetFocus;
        Abort;
      end;

      if (StrToFloat(mskQuantidade.Text) > 0) then
      begin
        TotalItem := VendeItem(StrToFloat(StringReplace(mskQuantidade.Text, '.',
          ',', [rfReplaceAll])), StrToFloat(StringReplace(edtValorUni.Text, '.',
          ',', [rfReplaceAll])));
        edtTotalItem.Text := TotalItem.ToString();
        edtTotalItemExit(Self);
        mskQuantidadeChange(Self);
        AddItemVenda;

        {edtValorUni.Text := '0';}
        edtValorUniExit(Self);
        edtTotalItemExit(Self);

        mskCodigo.SetFocus;
        mskCodigo.Text := '';
      end
      else
      begin
          MessageDlg('Você deve informar a quantidade.',
          System.UITypes.TMsgDlgType.mtWarning,
          [System.UITypes.TMsgDlgBtn.mbOK], 0,
          procedure(const AResult: System.UITypes.TModalResult)
          begin
            case AResult of
              mrOk:
              {$IFDEF WIN32}
                // Application.Terminate;
              {$ENDIF}
              end;
            end);
          end;
          mskQuantidade.Text := '1';
          mskQuantidadeChange(Self);
          Abort;
        end;
      end;
end;

    function TFrmVendas.PegaCodVenda: integer;
    var
      IDVenda: integer;
    begin
      try
        try
          with DmDados.Q_executa do
          begin
            Close;
            sql.Clear;
            sql.Add('INSERT INTO VENDAS(COD_VENDEDOR,COD_CLIENTE,COD_FPGTO,TOTAL,DATA,HORA) VALUES(:cod_vendedor,:cod_cli,:cod_fp,:tot,:dt,:hr)');
            ParamByName('cod_vendedor').Value := 1;
            ParamByName('cod_cli').Value := 0;
            ParamByName('cod_fp').Value := 0;
            ParamByName('tot').Value := 0;
            ParamByName('dt').Value := Date;
            ParamByName('hr').Value := Time;
            ExecSQL;
          end;

          DmDados.IBTransaction1.CommitRetaining;

          IDVenda := GeneratorID('GEN_VENDAS_ID', DmDados.conexao, false);

          Result := IDVenda;

        except
          on e: exception do
          begin
            Result := 0;
          end;
        end;
      finally
        DmDados.Q_executa.Close;
      end;
    end;

    procedure TFrmVendas.spCodVendaChange(Sender: TObject);
    begin
      NumVenda := Format('%5.5d', [spCodVenda.Text.ToInteger()]);
      // resulta '00123' 5 Dígitos;
    end;

    procedure TFrmVendas.SpeedButton1Click(Sender: TObject);
    begin
      if not(VendaAberta) then
      begin
        VendaAberta := true;
        spCodVenda.Text := PegaCodVenda.ToString();
        lbAvisos.Text := Format('%5.5d', [spCodVenda.Text.ToInteger()])+' - CAIXA OCUPADO';

        // Prepara a tabela de Venda
        with cdsitensVendas do
        begin
          Active := false;
          Active := true;
          EmptyDataSet;
        end;

        { grdVendas.Color := clWhite;
          grdVendas.Enabled := True; }

        rectCodB.Fill.Color := $FFFCFCFC;
        rectCodB.Enabled := true;

        rectQtd.Fill.Color := $FFFCFCFC;
        rectQtd.Enabled := true;

        rectVlUni.Fill.Color := $FFFCFCFC;
        rectVlUni.Enabled := true;

        rectTotalItem.Fill.Color := $FFFCFCFC;
        rectTotalItem.Enabled := true;

        mskCodigo.SetFocus;


      end;
    end;

    procedure TFrmVendas.SpeedButton2Click(Sender: TObject);
    begin
      if (VendaAberta) then
      begin
        PNL_Fechamento.Visible := true;
        lbAvisos.Text := 'FINALIZANDO VENDA';

         edtSubToltal.Text := FormatFloat('##,###,##0.00', EdtTotal.Text.ToDouble());
         edtTotalCom.Text := FormatFloat('##,###,##0.00', EdtTotal.Text.ToDouble());

        EDT_Cliente.SetFocus;
      end
      else
      begin

          {MessageDlg('A venda precisa estar aberta para realizar a operação!',
          System.UITypes.TMsgDlgType.mtWarning,
          [System.UITypes.TMsgDlgBtn.mbOK], 0,
          procedure(const AResult: System.UITypes.TModalResult)
          begin
            case AResult of
              mrOk:
                {$IFDEF WIN32}
                  //Exit;
               { {$ENDIF}
            {end;
          end);}
        lbAvisos.Text := 'CAIXA LIVRE';
        Exit;
      end;
    end;

procedure TFrmVendas.SpeedButton3Click(Sender: TObject);
begin
      {if (VendaAberta) then
      begin
        lbAvisos.Text := 'CAIXA OCUPADO';
        MessageDlg('Deseja realmente cancelar esta venda?', System.UITypes.TMsgDlgType.mtConfirmation,
          [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
          procedure(const AResult: System.UITypes.TModalResult)
          begin
            case AResult of
              mrYES:
                if (Excluir('VENDAS', 'COD_VENDAS', spCodVenda.Text)) then
                begin
                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  lbPRODUTO.Text.Empty;
                  mskCodigo.Text.Empty;
                  mskQuantidade.Text.Empty;
                  edtValorUni.Text := '0,00';
                  edtTotalItem.Text := '0,00';
                  EdtTotal.Text := '0,00';
                  // Memo1.Clear;

                  { edtRecebido.Clear;
                    EDT_Cliente.Clear;
                    EDT_CondPagto.Clear;
                    edtTroco.Clear; }
       {           spCodVenda.Text.Empty;
                  lbAvisos.Text.Empty;

                  cdsitensVendas.Close;

                  if (PNL_Fechamento.Visible = true) then
                  begin
                    PNL_Fechamento.Visible := false;
                  end;

                  VendaAberta := false;
                  lbAvisos.Text := 'CAIXA LIVRE';
                end;
            end;
          end);
      end

      else
      begin
        MessageDlg('A venda precisa estar aberta para realizar a operação!',
          System.UITypes.TMsgDlgType.mtWarning,
          [System.UITypes.TMsgDlgBtn.mbOK], 0,
          procedure(const AResult: System.UITypes.TModalResult)
          begin
            case AResult of
              mrOk:
{$IFDEF WIN32}
     {           Exit;
{$ENDIF}
     {       end;
          end);
      end;}

    SpeedButton2Click(Self);

end;

procedure TFrmVendas.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton3Click(Self);
end;

procedure TFrmVendas.SpeedButton5Click(Sender: TObject);
begin
    SpeedButton1Click(Self);
end;

procedure TFrmVendas.SpeedButton6Click(Sender: TObject);
begin
  {$IFDEF WIN32}
    Application.Terminate;
  {$ENDIF}
end;

function TFrmVendas.VendeItem(qtd, vlunit: Double): Double;
    begin
      Result := FormatFloat('###,###,##0.00', (qtd) * (vlunit)).ToDouble();
    end;

    procedure TFrmVendas.edtValorUniExit(Sender: TObject);
    begin
      edtValorUni.Text := FormatFloat('###,###,##0.00',
        edtValorUni.Text.ToDouble());
    end;

    procedure TFrmVendas.edtValorUniKeyDown(Sender: TObject; var Key: Word;
    var KeyChar: Char; Shift: TShiftState);
    begin
      if (Key = vkReturn) then
      begin
        EdtTotal.SetFocus;
      end;
    end;

    procedure TFrmVendas.EDT_ClienteChangeTracking(Sender: TObject);
begin
    if (EDT_Cliente.Text <> '') then
    begin
        with Q_Clientes do
        begin
            Close;
            ParamByName('cod').Value := EDT_Cliente.Text;
            Open;
            FetchAll;
        end;

        if (Q_Clientes.RecordCount > 0) then
        begin
            lbCliente.Text := Q_ClientesNOME_CLI.AsString;
            EdtLimitCli.Text := Q_ClientesLIMITE_CLI.AsString;
        end
        else
        begin
            lbCliente.Text := 'Nada foi encontrado...'
        end;
    end;
end;

procedure TFrmVendas.EDT_ClienteExit(Sender: TObject);
begin
{if (EDT_Cliente.Text = '') then
    begin
        MessageDlg('Por favor informe o cliente para a venda!',
        System.UITypes.TMsgDlgType.mtError,
        [System.UITypes.TMsgDlgBtn.mbOK], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrOk:
              begin
                {$IFDEF WIN32}
 {               {$ENDIF}
  {            end;
          end;
        end);

        if (PNL_Fechamento.Visible) then
        begin
            EDT_Cliente.SetFocus;
        end;
        Abort;
    end;}
end;

procedure TFrmVendas.EDT_ClienteKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = VKF3) then
  begin
    Application.CreateForm(TFrmConsCliente, FrmConsCliente);
    FrmConsCliente.Tag := 0;
    FrmConsCliente.Showmodal;
    FrmConsCliente.Hide;
    FrmConsCliente.Free;
    Abort;
  end;

  if (Key = VkReturn) then
  begin
    EDT_CondPagto.SetFocus;
  end;
end;

procedure TFrmVendas.EDT_CondPagtoChangeTracking(Sender: TObject);
begin
    if (EDT_CondPagto.Text <> '') then
    begin
        with Q_FPGTO do
        begin
            Close;
            ParamByName('cod').Value := EDT_CondPagto.Text;
            Open;
            FetchAll;
        end;

        if (Q_FPGTO.RecordCount > 0) then
        begin
            Lbfp.Text := Q_FPGTODESCRICAO.AsString;
        end
        else
        begin
            Lbfp.Text := 'Nada foi encontrado...'
        end;
    end;

    if (EDT_CondPagto.Text = '4') then
    begin
      Label19.Visible := false;
      Rectangle9.Visible := false;
      btnDateRecebimento.Visible := true;
      DateRecebimento.Visible := true;
    end
    else
    begin
      Label19.Visible := true;
      Rectangle9.Visible := true;
      btnDateRecebimento.Visible := false;
      DateRecebimento.Visible := false;
    end;
end;

procedure TFrmVendas.EDT_CondPagtoExit(Sender: TObject);
begin
    if (EDT_CondPagto.Text = '') then
    begin
        MessageDlg('Por favor informe a forma de pagamento para a venda!',
        System.UITypes.TMsgDlgType.mtError,
        [System.UITypes.TMsgDlgBtn.mbOK], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrOk:
              begin
                {$IFDEF WIN32}
                {$ENDIF}
              end;
          end;
        end);
        if (PNL_Fechamento.Visible) then
        begin
            EDT_CondPagto.SetFocus;
        end;
        Abort;
    end;

    if (EDT_CondPagto.Text = '4') then
    begin
      if (EdtTotal.Text.ToDouble() > Q_ClientesLIMITE_CLI.Value) then
      begin
        MessageDlg('O limite do cliente é menor do que o valor da venda!',
        System.UITypes.TMsgDlgType.mtError,
        [System.UITypes.TMsgDlgBtn.mbOK], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrOk:
              begin
                {$IFDEF WIN32}
                {$ENDIF}
              end;
          end;
        end);
        EDT_Cliente.SetFocus;
        Abort;
      end;


      if (EDT_CondPagto.Text = '4') then
      begin
        if (pnlObs.Visible = false) then
        begin
          DateRecebimento.Visible := true;
          DateRecebimento.Date := Date;
          BtnDateRecebimento.Visible := true;
          pnlObs.Visible := true;
          Memo1.SetFocus;
          //Abort;
        end;
      end;
    end;

    if (EDT_CondPagto.Text = '2') then  // Cartão de débito
    begin
      DateRecebimento.Visible := true;
      DateRecebimento.Date := Date + 1;
      BtnDateRecebimento.Visible := true;
      edtRecebido.Visible := false;
      //Abort;
    end;

    if (EDT_CondPagto.Text = '3') then  // Cartão de Crédito
    begin
      DateRecebimento.Visible := true;
      DateRecebimento.Date := Date + 14;
      BtnDateRecebimento.Visible := True;
      edtRecebido.Visible := false;
      //Abort;
    end;

    if (EDT_CondPagto.Text = '1') then  // Cartão de Crédito
    begin
      DateRecebimento.Visible := false;
      BtnDateRecebimento.Visible := false;
      edtRecebido.Visible := true;
      //Abort;
    end;
end;

procedure TFrmVendas.EDT_CondPagtoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = VkReturn) then
  begin
    EdtDesconto.SetFocus;
  end;
end;

function TFrmVendas.FinnalizaVenda(Cod_Venda: integer): Boolean;
begin
   try
      try
        with DmDados.Q_executa do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE VENDAS SET COD_VENDEDOR = :COD_VENDEDOR, COD_CLIENTE = :COD_CLI, COD_FPGTO = :COD_FP, TOTAL = :TOT, DATA = :DT, HORA = :HR, OBS = :OBS, DIAS_RECEBER = :DIAS WHERE VENDAS.COD_VENDAS = :cod');
          ParamByName('cod').Value := Cod_Venda;
          ParamByName('cod_vendedor').Value := 1;
          ParamByName('cod_cli').Value := EDT_Cliente.Text;
          ParamByName('cod_fp').Value := EDT_CondPagto.Text;
          ParamByName('tot').Value := EdtTotal.Text.ToDouble;
          ParamByName('dt').Value := Date;
          ParamByName('hr').Value := Time;
          ParamByName('obs').Value := Memo1.Text;

          if (edt_CondPagto.Text = '1') then
          begin
            ParamByName('dias').Value := 0;
          end;

          if (edt_CondPagto.Text = '2') then
          begin
            ParamByName('dias').Value := 1;
          end;

          if (edt_CondPagto.Text = '3') then
          begin
            ParamByName('dias').Value := 14;
          end;

          if (edt_CondPagto.Text = '4') then
          begin
            ParamByName('dias').Value := DateRecebimento.Date - Date;
          end;

          ExecSQL;
        end;

        DmDados.IBTransaction1.CommitRetaining;

        cdsitensVendas.First;

        while not cdsitensVendas.Eof do
        begin
          // Salva o item da venda e baixa no estoque
          BaixaItemVenda(spCodVenda.Text.ToInteger(), cdsitensVendascod.Value, 1, 0, cdsitensVendasqtd.Value, cdsitensVendasTotal_Item.Value);
          cdsitensVendas.Next;
        end;

          Result := True;

        except
        on e: exception do
        begin
          DmDados.IBTransaction1.RollbackRetaining;
          Result := False;
        end;
      end;
    finally
    DmDados.Q_executa.Close;
    end;
end;

procedure TFrmVendas.FormActivate(Sender: TObject);
begin
  WindowState := TWindowState.wsMaximized;
end;

procedure TFrmVendas.FormCreate(Sender: TObject);
begin
  {Chama o Login}
  Application.CreateForm(TFrrmLogin,FrrmLogin);
  FrrmLogin.ShowModal;
  FrrmLogin.Hide;
  FrrmLogin.Free;


  ImgLogo.MultiResBitmap := nil;
  ImgLogo.MultiResBitmap.Items[0].Bitmap.LoadFromFile('logo.png');

  cdsitensVendas.CreateDataSet;

  lbAvisos.Text := 'CAIXA LIVRE';

  mskCodigo.SetFocus;
  edtValorUniExit(Self);
  mskQuantidadeChange(Self);
  edtTotalItemExit(Self);

  rectCodB.Fill.Color := $FFE0E0E0;
  rectCodB.Enabled := false;

  rectQtd.Fill.Color := $FFE0E0E0;
  rectQtd.Enabled := false;

  rectVlUni.Fill.Color := $FFE0E0E0;
  rectVlUni.Enabled := false;

  rectTotalItem.Fill.Color := $FFE0E0E0;
  rectTotalItem.Enabled := false;

  PNL_Fechamento.Visible := false;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = VKF2) then
  begin
    SpeedButton1Click(Self);
  end;

  if (Key = VKF4) then
  begin
    SpeedButton2Click(Self);
  end;

  if (Key = VKEscape) then
  begin
    if (PNL_Fechamento.Visible = true) then
    begin
      PNL_Fechamento.Visible := false;
      lbAvisos.Text := 'CAIXA OCUPADO';
    end;
  end;

  if (Key = VKF5) then
  begin
    SpeedButton3Click(Self);
  end;
end;

procedure TFrmVendas.FormResize(Sender: TObject);
begin
  FrmVendas.WindowState := TWindowState.wsMaximized;
end;

function TFrmVendas.GeneratorID(aName: string; Connection: TIBDatabase;
Incrementa: Boolean): integer;
var
  Qry: TIBQuery;
begin
  Qry := TIBQuery.Create(nil);
  try
    Qry.Database := Connection;
    if Incrementa then
      Qry.sql.Add('SELECT GEN_ID(' + aName + ', 1) FROM RDB$DATABASE')
    else
      Qry.sql.Add('SELECT GEN_ID(' + aName + ', 0) FROM RDB$DATABASE');
    Qry.Open;
    Result := Qry.Fields[0].AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TFrmVendas.grdVendasKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Key = VKF6) then
    begin
      case MessageDlg('Deseja realmente excluir o item '+ cdsitensVendasdescricao.AsString +' da venda?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
            begin
              {$IFDEF WIN32}
                cdsitensVendas.Delete;

                if (cdsitensVendas.RecordCount > 0) then
                begin
                  EdtTotal.Text := FormatFloat('##,###,##0.00', cdsitensVendasTotal.Value);
                end
                else
                begin
                  EdtTotal.Text := FormatFloat('##,###,##0.00', 0);
                end;
              {$ENDIF}
            end;

            mrCancel:
            begin
              {$IFDEF WIN32}

              {$ENDIF}
            end;
        end;
      Abort;
    end;
end;

procedure TFrmVendas.Label21Click(Sender: TObject);
begin
  Button1Click(Self);
end;

procedure TFrmVendas.AddItemVenda;
begin
  try

    cdsitensVendas.Insert;
    cdsitensVendascod.Value := QProd_CodBarraCOD_PRO.Value;
    cdsitensVendasdescricao.Value := QProd_CodBarraNOME_PRO.Value;
    cdsitensVendasqtd.Value := mskQuantidade.Text.ToDouble;
    cdsitensVendasvl_item.Value := edtValorUni.Text.ToDouble;
    cdsitensVendasTotal_Item.Value := edtTotalItem.Text.ToDouble;
    cdsitensVendascodBarra.Value := QProd_CodBarraCODIGO_BARRA_PRO.AsString;
    // cdsitensVendasvl_unitario.Value := vlunit;
    cdsitensVendas.Post;

    EdtTotal.Text := FormatFloat('###,###,##0.00', cdsitensVendasTotal.Value);

  except
    on e: exception do
    begin
      MessageDlg(PChar('Erro ao tentar inserir o produto na venda!' + #13 +
        'Obs: ' + e.Message), System.UITypes.TMsgDlgType.mtError,
        [System.UITypes.TMsgDlgBtn.mbOK], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrOk:
{$IFDEF WIN32}
              // Application.Terminate;
{$ENDIF}
            end;
          end);
        end;
      end;
    end;

function TFrmVendas.BaixaItemVenda(Cod_Venda, COD_PRO, COD_EMP,
ORDEM: integer; QUANT_ITEM, VALOR_ITEM: Currency): Boolean;
var
Qtdreal, QtdBaixa: String;
begin
try
  with QtdEstoqueItem do
  begin
    Close;
    ParamByName('cod').Value := COD_PRO;
    Open;
  end;

  Qtdreal := StringReplace(FloatToStr(QUANT_ITEM), ',', '.',
    [rfReplaceAll]);

  // Baixa a Qtd. no Estoque   ERRo AQUI
  with DmDados.Q_executa do
  begin
    Close;
    sql.Clear;
    sql.Add('execute procedure atualiza_estoque (' + IntToStr(COD_PRO)
      + ',' + #39 + 'S' + #39 + ', ' + Qtdreal + ')');
    ExecSQL;
  end;

  DmDados.IBTransaction1.CommitRetaining;

  with Q_BaixaItem do
  begin
    Close;
    ParamByName('1').Value := Cod_Venda;
    ParamByName('2').Value := COD_PRO;
    ParamByName('3').Value := COD_EMP;
    ParamByName('4').Value := ORDEM;
    ParamByName('5').Value := QUANT_ITEM;
    ParamByName('6').Value := VALOR_ITEM;
    ExecSQL;
  end;

  DmDados.IBTransaction1.CommitRetaining;

  Result := true;
except
  on e: exception do
  begin
    Result := false;
    MessageDlg(PChar('Erro ao tentar inserir o produto na venda!' +
      #13 + 'Obs: ' + e.Message), System.UITypes.TMsgDlgType.mtError,
      [System.UITypes.TMsgDlgBtn.mbOK], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
        case AResult of
          mrOk:
            {$IFDEF WIN32}
            // Application.Terminate;
            {$ENDIF}
          end;
        end);
      end;
    end;
  end;

procedure TFrmVendas.BitBtn1Click(Sender: TObject);
var
  IDVenda: integer;
begin
  IDVenda := GeneratorID('GEN_VENDAS_ID', DmDados.conexao, false);
  spCodVenda.Text := IDVenda.ToString();
end;

procedure TFrmVendas.BitBtn2Click(Sender: TObject);
begin
  pnlObs.Visible := false;
  EdtDesconto.SetFocus;
end;

procedure TFrmVendas.BitBtn3Click(Sender: TObject);
begin
  pnlObs.Visible := false;
  EdtDesconto.SetFocus;
end;

procedure TFrmVendas.BtnDateRecebimentoClick(Sender: TObject);
var
 Total_ : String;
 //Saldo_Cupom :
begin
    if (EDT_CondPagto.Text = '4') then
    begin
          if (EdtLimitCli.Text.ToDouble() < EdtTotal.Text.ToDouble()) then
          begin
              MessageDlg('O valor do limte de crédito do cliente é menor que o valor da venda!', System.UITypes.TMsgDlgType.mtWarning,
              [System.UITypes.TMsgDlgBtn.mbOK], 0,
              procedure(const AResult: System.UITypes.TModalResult)
              begin
                case AResult of
                  mrOk:
                    {$IFDEF WIN32}
                    // Application.Terminate;
                    {$ENDIF}
                  end;
                end);
              edtRecebido.SetFocus;
              Exit;
          end;

          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
            begin
              Total_ := edtTotal.Text;
              if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
              begin

                  with DmDados.Q_executa do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' UPDATE CLIENTE');
                    SQL.Add(' SET LIMITE_CLI = :lmt');
                    SQL.Add(' WHERE CLIENTE.COD_CLI = :cod');
                    ParamByName('lmt').Value := EdtLimitCli.Text.ToDouble() - EdtTotal.Text.ToDouble();
                    ParamByName('cod').Value := strToInt(EDT_Cliente.Text);
                    ExecSQL;
                  end;

                  EDT_ClienteChangeTracking(Self);

                  {grdVendas.Color := clBtnFace;
                  grdVendas.Enabled := False;}

                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  LBpRODUTO.Text := '';
                  mskCodigo.Text := '';
                  mskQuantidade.Text := '1,000';
                  edtValorUni.Text := '0,00';
                  edtTotalItem.Text := '0,00';
                  //EdtTotal.Clear;


                  edtRecebido.Text := '0,00';

                  EDT_Cliente.Text := '';

                  edtTroco.Text := '0,00';
                  Memo1.Text := '';

                  DateRecebimento.Visible := false;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;


                  case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                  mrOk:
                    begin
                      if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                      lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtDesconto.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtTotal.Text)),
                      formatfloat('##,###,##0.00', StrToFloat(edtTroco.Text))) then
                      begin
                        //ShowMessage('O cupom foi impresso com sucesso!');
                      end;
                    end;
                  mrCancel:
                    begin
                      //ShowMessage('Don''t hesitate to contact us when you need more information.');
                    end;
                  end;


                  EDT_CondPagto.Text := '';
                  lbCliente.Text := '';
                  Lbfp.Text := '';

                  EdtTotal.Text := '0,00';

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
                  lbAvisos.Text := 'CAIXA LIVRE';
              end;
            end;
            mrCancel:
            begin
                //ShowMessage('Don''t hesitate to contact us when you need more information.');
            end;
        end;
    end;


    // Cartão de Débito
    if (EDT_CondPagto.Text = '2') then
    begin
          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
          mrOk:
            begin
              Total_ := EdtTotal.Text;
              if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
              begin

                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  LBpRODUTO.Text := '';
                  mskCodigo.Text := '';
                  mskQuantidade.Text := '';
                  edtValorUni.Text := '';
                  edtTotalItem.Text := '';

                  edtRecebido.Text := '';
                  EDT_Cliente.Text := '';
                  EDT_CondPagto.Text := '';
                  edtTroco.Text := '';
                  Memo1.Text := '';

                  DateRecebimento.Visible := False;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;


                  case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                  mrOk:
                    begin
                      if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                      lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', EdtDesconto.Text.ToDouble()), formatfloat('##,###,##0.00', EdtTotal.Text.ToDouble()),
                      formatfloat('##,###,##0.00', edtTroco.Text.ToDouble())) then
                      begin
                        //ShowMessage('O cupom foi impresso com sucesso!');
                      end;
                    end;
                  mrCancel:
                    begin
                      //ShowMessage('Don''t hesitate to contact us when you need more information.');
                    end;
                  end;

                  lbCliente.Text := '';
                  Lbfp.Text := '';

                  EdtTotal.Text := '';

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
            end;
          mrCancel:
            begin
              //ShowMessage('Don''t hesitate to contact us when you need more information.');
            end;
        end;
    end;

    // Cartão de Débito
    if (EDT_CondPagto.Text = '3') then
    begin
          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
              begin
                Total_ := EdtTotal.Text;
                if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
                begin
                    rectCodB.Fill.Color := $FFE0E0E0;
                    rectCodB.Enabled := false;

                    rectQtd.Fill.Color := $FFE0E0E0;
                    rectQtd.Enabled := false;

                    rectVlUni.Fill.Color := $FFE0E0E0;
                    rectVlUni.Enabled := false;

                    rectTotalItem.Fill.Color := $FFE0E0E0;
                    rectTotalItem.Enabled := false;

                    LBpRODUTO.Text := '';
                    mskCodigo.Text := '';
                    mskQuantidade.Text := '';
                    edtValorUni.Text := '';
                    edtTotalItem.Text := '';
                    //EdtTotal.Clear;

                    edtRecebido.Text := '';
                    EDT_Cliente.Text := '';
                    EDT_CondPagto.Text := '';
                    edtTroco.Text := '';
                    Memo1.Text := '';

                    DateRecebimento.Visible := False;


                    if (PNL_Fechamento.Visible = true) then
                    begin
                        PNL_Fechamento.Visible := False;
                    end;

                    case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                    mrOk:
                      begin
                        // Imprime o cupom
                        if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                        lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', EdtDesconto.Text.ToDouble()), formatfloat('##,###,##0.00', EdtTotal.Text.ToDouble()),
                        formatfloat('##,###,##0.00', edtTroco.Text.ToDouble())) then
                        begin
                          //ShowMessage('O cupom foi impresso com sucesso!');
                        end;
                      end;
                    mrCancel:
                      begin
                        //ShowMessage('Don''t hesitate to contact us when you need more information.');
                      end;
                    end;

                    lbCliente.Text := '';
                    Lbfp.Text := '';

                    EdtTotal.Text := '';

                    // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                    cdsitensVendas.Close;

                  // Fecha a Venda
                    VendaAberta := false;
                end;
              end;
            mrCancel:
              begin
                //ShowMessage('Don''t hesitate to contact us when you need more information.');
              end;
          end;
    end;
end;

procedure TFrmVendas.Button1Click(Sender: TObject);
begin
  {$IFDEF WIN32}
    Application.Terminate;
  {$ENDIF}
end;

procedure TFrmVendas.Button2Click(Sender: TObject);
begin
  {$IFDEF WIN32}
    WindowState := TWindowState.wsMinimized;
  {$ENDIF}
end;

procedure TFrmVendas.DateRecebimentoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 Total_ : String;
 //Saldo_Cupom :
begin
  if (Key = VKReturn) then
  begin
    if (EDT_CondPagto.Text = '4') then
    begin
          if (EdtLimitCli.Text.ToDouble() < EdtTotal.Text.ToDouble()) then
          begin
              MessageDlg('O valor do limte de crédito do cliente é menor que o valor da venda!', System.UITypes.TMsgDlgType.mtWarning,
              [System.UITypes.TMsgDlgBtn.mbOK], 0,
              procedure(const AResult: System.UITypes.TModalResult)
              begin
                case AResult of
                  mrOk:
                    {$IFDEF WIN32}
                    // Application.Terminate;
                    {$ENDIF}
                  end;
                end);
              edtRecebido.SetFocus;
              Exit;
          end;

          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtError, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
            begin
              Total_ := edtTotal.Text;
              if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
              begin

                  with DmDados.Q_executa do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' UPDATE CLIENTE');
                    SQL.Add(' SET LIMITE_CLI = :lmt');
                    SQL.Add(' WHERE CLIENTE.COD_CLI = :cod');
                    ParamByName('lmt').Value := EdtLimitCli.Text.ToDouble() - EdtTotal.Text.ToDouble();
                    ParamByName('cod').Value := strToInt(EDT_Cliente.Text);
                    ExecSQL;
                  end;

                  EDT_ClienteChangeTracking(Self);

                  {grdVendas.Color := clBtnFace;
                  grdVendas.Enabled := False;}

                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  LBpRODUTO.Text := '';
                  mskCodigo.Text := '';
                  mskQuantidade.Text := '';
                  edtValorUni.Text := '';
                  edtTotalItem.Text := '';
                  //EdtTotal.Clear;


                  edtRecebido.Text := '';

                  EDT_Cliente.Text := '';

                  edtTroco.Text := '';
                  Memo1.Text := '';

                  DateRecebimento.Visible := false;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;


                  case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                  mrOk:
                    begin
                      if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                      lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtDesconto.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtTotal.Text)),
                      formatfloat('##,###,##0.00', StrToFloat(edtTroco.Text))) then
                      begin
                        //ShowMessage('O cupom foi impresso com sucesso!');
                      end;
                    end;
                  mrCancel:
                    begin
                      //ShowMessage('Don''t hesitate to contact us when you need more information.');
                    end;
                  end;


                  EDT_CondPagto.Text := '';
                  lbCliente.Text := '';
                  Lbfp.Text := '';

                  EdtTotal.Text := '0,00';

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
            end;
            mrCancel:
            begin
                //ShowMessage('Don''t hesitate to contact us when you need more information.');
            end;
        end;
    end;


    // Cartão de Débito
    if (EDT_CondPagto.Text = '2') then
    begin
          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtError, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
          mrOk:
            begin
              Total_ := EdtTotal.Text;
              if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
              begin

                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  LBpRODUTO.Text := '';
                  mskCodigo.Text := '';
                  mskQuantidade.Text := '';
                  edtValorUni.Text := '';
                  edtTotalItem.Text := '';

                  edtRecebido.Text := '';
                  EDT_Cliente.Text := '';
                  EDT_CondPagto.Text := '';
                  edtTroco.Text := '';
                  Memo1.Text := '';

                  DateRecebimento.Visible := False;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;


                  case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                  mrOk:
                    begin
                      if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                      lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', EdtDesconto.Text.ToDouble()), formatfloat('##,###,##0.00', EdtTotal.Text.ToDouble()),
                      formatfloat('##,###,##0.00', edtTroco.Text.ToDouble())) then
                      begin
                        //ShowMessage('O cupom foi impresso com sucesso!');
                      end;
                    end;
                  mrCancel:
                    begin
                      //ShowMessage('Don''t hesitate to contact us when you need more information.');
                    end;
                  end;

                  lbCliente.Text := '';
                  Lbfp.Text := '';

                  EdtTotal.Text := '';

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
            end;
          mrCancel:
            begin
              //ShowMessage('Don''t hesitate to contact us when you need more information.');
            end;
        end;
    end;

    // Cartão de Débito
    if (EDT_CondPagto.Text = '3') then
    begin
          case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtError, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
              begin
                Total_ := EdtTotal.Text;
                if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
                begin
                    rectCodB.Fill.Color := $FFE0E0E0;
                    rectCodB.Enabled := false;

                    rectQtd.Fill.Color := $FFE0E0E0;
                    rectQtd.Enabled := false;

                    rectVlUni.Fill.Color := $FFE0E0E0;
                    rectVlUni.Enabled := false;

                    rectTotalItem.Fill.Color := $FFE0E0E0;
                    rectTotalItem.Enabled := false;

                    LBpRODUTO.Text := '';
                    mskCodigo.Text := '';
                    mskQuantidade.Text := '';
                    edtValorUni.Text := '';
                    edtTotalItem.Text := '';
                    //EdtTotal.Clear;

                    edtRecebido.Text := '';
                    EDT_Cliente.Text := '';
                    EDT_CondPagto.Text := '';
                    edtTroco.Text := '';
                    Memo1.Text := '';

                    DateRecebimento.Visible := False;


                    if (PNL_Fechamento.Visible = true) then
                    begin
                        PNL_Fechamento.Visible := False;
                    end;

                    case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                    mrOk:
                      begin
                        // Imprime o cupom
                        if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                        lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', EdtDesconto.Text.ToDouble()), formatfloat('##,###,##0.00', EdtTotal.Text.ToDouble()),
                        formatfloat('##,###,##0.00', edtTroco.Text.ToDouble())) then
                        begin
                          //ShowMessage('O cupom foi impresso com sucesso!');
                        end;
                      end;
                    mrCancel:
                      begin
                        //ShowMessage('Don''t hesitate to contact us when you need more information.');
                      end;
                    end;

                    lbCliente.Text := '';
                    Lbfp.Text := '';

                    EdtTotal.Text := '';

                    // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                    cdsitensVendas.Close;

                  // Fecha a Venda
                    VendaAberta := false;
                end;
              end;
            mrCancel:
              begin
                //ShowMessage('Don''t hesitate to contact us when you need more information.');
              end;
          end;
    end;
  end;
end;

procedure TFrmVendas.EdtDescontoChangeTracking(Sender: TObject);
begin
  EdtDescontoExit(Self);
end;

procedure TFrmVendas.EdtDescontoEnter(Sender: TObject);
begin
  EdtDesconto.Text := formatfloat('##,###,##0.00', 0);
  EdtDesconto.SelectAll;
end;

procedure TFrmVendas.EdtDescontoExit(Sender: TObject);
var
  Total : Double;
  Total_ : String;
begin
  Total :=  cdsitensVendasTotal.Value;

  if (EdtDesconto.Text.ToDouble > 0) then
  begin
    EdtTotal.Text := formatfloat('##,###,##0.00', Total - EdtDesconto.Text.ToDouble);
    edtTotalCom.Text := formatfloat('##,###,##0.00', EdtTotal.Text.ToDouble());
  end
  else
  begin
    EdtTotal.Text := formatfloat('##,###,##0.00', cdsitensVendasTotal.Value);
    edtTotalCom.Text := formatfloat('##,###,##0.00', StrToFloat(edtSubToltal.Text));
  end;
end;

procedure TFrmVendas.EdtDescontoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (key = vkReturn) then
  begin
      if (edtRecebido.Visible) then
      begin
        edtRecebido.SetFocus;
      end
      else
      begin
        BtnDateRecebimento.SetFocus;
      end;
  end;
end;

procedure TFrmVendas.EdtLimitCliChangeTracking(Sender: TObject);
begin
  EdtLimitCli.Text := FormatFloat('###,###,##0.00', EdtLimitCli.Text.ToDouble());
end;

procedure TFrmVendas.edtRecebidoChangeTracking(Sender: TObject);
begin
  edtRecebido.Text := FormatFloat('###,###,##0.00',
    edtRecebido.Text.ToDouble());

  edtTroco.Text := FormatFloat('###,###,##0.00',(edtRecebido.Text.ToDouble - EdtTotal.Text.ToDouble()));
end;

procedure TFrmVendas.edtRecebidoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  Total : String;
begin
    if (Key = vkReturn) then
    begin
        if (edtRecebido.Text.ToDouble() < EdtTotal.Text.ToDouble()) then
        begin
            MessageDlg('O valor recebdo é menor que o valor da venda, Por favor corrigir!', System.UITypes.TMsgDlgType.mtWarning,
            [System.UITypes.TMsgDlgBtn.mbOK], 0,
            procedure(const AResult: System.UITypes.TModalResult)
            begin
              case AResult of
                mrOk:
                  {$IFDEF WIN32}
                  // Application.Terminate;
                  {$ENDIF}
                end;
              end);
            edtRecebido.SetFocus;
            Exit;
        end;

        case MessageDlg('Deseja finaliza a venda?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
            begin
              Total := edtTotal.Text;
              if (FinnalizaVenda(spCodVenda.Text.ToInteger())) then
              begin
                  rectCodB.Fill.Color := $FFE0E0E0;
                  rectCodB.Enabled := false;

                  rectQtd.Fill.Color := $FFE0E0E0;
                  rectQtd.Enabled := false;

                  rectVlUni.Fill.Color := $FFE0E0E0;
                  rectVlUni.Enabled := false;

                  rectTotalItem.Fill.Color := $FFE0E0E0;
                  rectTotalItem.Enabled := false;

                  LBpRODUTO.Text := '';
                  mskCodigo.Text := '';
                  mskQuantidade.Text := '1,000';
                  edtValorUni.Text := '0,00';
                  edtTotalItem.Text := '0,00';

                  edtRecebido.Text := '0,00';
                  EDT_Cliente.Text := '';
                  edtTroco.Text := '0,00';
                  Memo1.Text := '';

                  EDT_CondPagto.Text := '';
                  Memo1.Text := '';


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;

                  case MessageDlg('Deseja finaliza a venda e imprimir o cumpom?', System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
                  mrOk:
                    begin
                      if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, spCodVenda.Text,
                      lbCliente.Text, Lbfp.Text, formatfloat('##,###,##0.00', StrToFloat(edtTotalCom.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtDesconto.Text)), formatfloat('##,###,##0.00', StrToFloat(EdtTotal.Text)),
                      formatfloat('##,###,##0.00', StrToFloat(edtTroco.Text))) then
                      begin
                        //ShowMessage('O cupom foi impresso com sucesso!');
                      end;
                    end;
                  mrCancel:
                    begin
                      //ShowMessage('Don''t hesitate to contact us when you need more information.');
                    end;
                  end;

                  lbCliente.Text := '';
                  Lbfp.Text := '';

                  EdtTotal.Text := '0,00';

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;

                  lbAvisos.Text := 'CAIXA LIVRE';
              end;
            end;
        end;
    end;
end;

procedure TFrmVendas.edtTotalItemExit(Sender: TObject);
begin
  EdtTotal.Text := FormatFloat('###,###,##0.00',
    EdtTotal.Text.ToDouble());
end;

procedure TFrmVendas.edtTotalItemKeyDown(Sender: TObject;
var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) then
  begin
    mskCodigo.SetFocus;
  end;
end;

end.
