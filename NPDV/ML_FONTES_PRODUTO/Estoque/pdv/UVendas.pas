unit UVendas;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, ImgList, DBCtrls, Mask, StdCtrls,
    Buttons, Grids, DBGrids, jpeg, pngimage, DB, IBCustomDataSet, IBQuery,
    Spin, DBClient, IBDatabase,  System.ImageList, RxToolEdit, RxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
    TFrmVendas = class(TForm)
        Image1: TImage;
        lbPrecoUnitario: TLabel;
        LBpRODUTO: TLabel;
        Label1: TLabel;
        lblCartao: TLabel;
        lblCheque: TLabel;
        Label9: TLabel;
        Label10: TLabel;
        lbTotalIem: TLabel;
        Label13: TLabel;
        grdVendas: TDBGrid;
        Panel1: TPanel;
        mskCodigo: TMaskEdit;
        ImageList1: TImageList;
        Timer1: TTimer;
        Label2: TLabel;
        lbTotal: TLabel;
        Image2: TImage;
        Label5: TLabel;
        Label6: TLabel;
        PNL_Fechamento: TPanel;
        Image3: TImage;
        lbTotalCom: TLabel;
        fldTroco: TLabel;
        lbSubTotal: TLabel;
        lblTotalSem: TLabel;
        lblTotalCom: TLabel;
        fldDesconto: TLabel;
        lblDesconto: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        EDT_Cliente: TEdit;
        EDT_CondPagto: TEdit;
        edtRecebido: TCurrencyEdit;
        Q_Clientes: TFDQuery;
        Q_FPGTO: TFDQuery;
        Q_FPGTOCODIGO: TIntegerField;
        Q_FPGTODESCRICAO: TStringField;
        QProd_CodBarra: TFDQuery;
        Q_ProdCod: TFDQuery;
        Q_Items_Vendas: TFDQuery;
        Q_PegaUltmoCodVenda: TFDQuery;
        Q_PegaUltmoCodVendaCOD_VENDA: TIntegerField;
        Q_PegaUltmoCodVendaCOD_CLIENTE: TIntegerField;
        Q_PegaUltmoCodVendaCOD_FPGTO: TIntegerField;
        Q_PegaUltmoCodVendaCOD_VENDEDOR: TIntegerField;
        spCodVenda: TSpinEdit;
        Lbfp: TLabel;
        lbCliente: TLabel;
        Label7: TLabel;
        EdtTotal: TCurrencyEdit;
        edtTroco: TCurrencyEdit;
        edTotalItem: TCurrencyEdit;
        edtValorUni: TCurrencyEdit;
        cdsitensVendas: TClientDataSet;
        cds_itensVendas: TDataSource;
        cdsitensVendascod: TIntegerField;
        cdsitensVendasdescricao: TStringField;
        cdsitensVendasqtd: TCurrencyField;
        cdsitensVendasvl_item: TCurrencyField;
        cdsitensVendasTotal: TAggregateField;
        cdsitensVendasTotal_Item: TCurrencyField;
        cdsitensVendascodBarra: TStringField;
        BitBtn1: TBitBtn;
        Q_BaixaItem: TFDQuery;
        QtdEstoqueItem: TFDQuery;
        Label3: TLabel;
        Label8: TLabel;
    pnlObs: TPanel;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    EdtDesconto: TCurrencyEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    DateRecebimento: TDateEdit;
    SpCod_Usuario: TSpinEdit;
    EdtLimitCli: TCurrencyEdit;
    cdsitensVendasvl_unitario: TCurrencyField;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    mskQuantidade: TCurrencyEdit;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Q_ClientesCOD_CLI: TIntegerField;
    Q_ClientesNOME_CLI: TStringField;
    Q_ClientesLIMITE_CLI: TBCDField;
    Q_ClientesLIMITE_CHEQUE: TBCDField;
    QProd_CodBarraCOD_PRO: TIntegerField;
    QProd_CodBarraCODIGO_BARRA_PRO: TStringField;
    QProd_CodBarraTP_PRODUTO: TStringField;
    QProd_CodBarraNOME_PRO: TStringField;
    QProd_CodBarraCOD_UNI_SAI: TIntegerField;
    QProd_CodBarraPRECO_VAREJO: TBCDField;
    QProd_CodBarraPRECO_PROMOCAO: TBCDField;
    QProd_CodBarraQUANT_ESTOQ: TBCDField;
    QProd_CodBarraATIVO_PRO: TStringField;
    Q_ProdCodCOD_PRO: TIntegerField;
    Q_ProdCodCODIGO_BARRA_PRO: TStringField;
    Q_ProdCodTP_PRODUTO: TStringField;
    Q_ProdCodNOME_PRO: TStringField;
    Q_ProdCodCOD_UNI_SAI: TIntegerField;
    Q_ProdCodPRECO_VAREJO: TBCDField;
    Q_ProdCodPRECO_PROMOCAO: TBCDField;
    Q_ProdCodQUANT_ESTOQ: TBCDField;
    Q_ProdCodATIVO_PRO: TStringField;
    QtdEstoqueItemCOD_PRO: TIntegerField;
    QtdEstoqueItemCODIGO_BARRA_PRO: TStringField;
    QtdEstoqueItemTP_PRODUTO: TStringField;
    QtdEstoqueItemNOME_PRO: TStringField;
    QtdEstoqueItemCOD_UNI_SAI: TIntegerField;
    QtdEstoqueItemPRECO_VAREJO: TBCDField;
    QtdEstoqueItemPRECO_PROMOCAO: TBCDField;
    QtdEstoqueItemQUANT_ESTOQ: TBCDField;
    QtdEstoqueItemATIVO_PRO: TStringField;
        procedure EDT_ClienteChange(Sender: TObject);
        procedure EDT_CondPagtoChange(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormKeyPress(Sender: TObject; var Key: Char);
        procedure FormShow(Sender: TObject);
        procedure mskCodigoChange(Sender: TObject);
        procedure mskCodigoKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure EdtTotalChange(Sender: TObject);
        procedure mskQuantidadeChange(Sender: TObject);
        procedure edTotalItemChange(Sender: TObject);
        procedure edtValorUniChange(Sender: TObject);
        procedure edtTrocoChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure mskQuantidadeKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure mskQuantidadeEnter(Sender: TObject);
        procedure grdVendasKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure edtRecebidoKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure edtRecebidoChange(Sender: TObject);
        procedure EDT_ClienteExit(Sender: TObject);
        procedure EDT_CondPagtoExit(Sender: TObject);
        procedure mskCodigoExit(Sender: TObject);
        procedure EDT_ClienteKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure BitBtn1Click(Sender: TObject);
        procedure spCodVendaChange(Sender: TObject);
        procedure mskQuantidadeKeyPress(Sender: TObject; var Key: Char);
        procedure grdVendasKeyPress(Sender: TObject; var Key: Char);
        procedure EDT_ClienteKeyPress(Sender: TObject; var Key: Char);
        procedure EDT_CondPagtoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoEnter(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EDT_CondPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure DateRecebimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
        function PegaCodVenda: Integer;
        function FinnalizaVenda(Cod_Venda: Integer): Boolean;
        function BaixaItemVenda(COD_VENDA, COD_PRO, COD_EMP, ORDEM: Integer; QUANT_ITEM : Currency; VALOR_ITEM: Currency): Boolean;
        procedure AddItemVenda;
        function GeneratorID(aName: string; Connection: TFDConnection; Incrementa: Boolean): integer;
        
    end;

var
    FrmVendas: TFrmVendas;
    VendaAberta: Boolean;

    //procedure SQL atualiza_estoque

implementation

{$R *.dfm}

uses Udm, UFrmConsCliente, UFrmConsProduto, UFrmCupom, UfrmLogin, untImpressao;

{ TFrmVendas }

{
  UPDATE VENDAS SET COD_VENDEDOR = :COD_VENDEDOR, COD_CLIENTE = :COD_CLI, COD_FPGTO = :COD_FP, TOTAL = :TOT, DATA = :DT, HORA = :HR WHERE VENDAS.COD_VENDAS = :cod
}

function Excluir(Tabela, campo_tabela, campo_excluir: string): Boolean;
begin
    try
        try
            DmDados.IBTransaction1.StartTransaction;
            with DmDados.Q_executa do
            begin
                sql.Clear;
                sql.Add('DELETE FROM ' + tabela + ' WHERE ' + campo_tabela + ' = ' + #39 + campo_excluir + #39);
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

function TFrmVendas.FinnalizaVenda(Cod_Venda: Integer): Boolean;
begin
    try
        try
            DmDados.IBTransaction1.StartTransaction;
            with DmDados.Q_executa do
            begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE VENDAS SET COD_VENDEDOR = :COD_VENDEDOR, COD_CLIENTE = :COD_CLI, COD_FPGTO = :COD_FP, TOTAL = :TOT, DATA = :DT, HORA = :HR, OBS = :OBS, DIAS_RECEBER = :DIAS WHERE VENDAS.COD_VENDAS = :cod');
                ParamByName('cod').Value := Cod_Venda;
                ParamByName('cod_vendedor').Value := 1;
                ParamByName('cod_cli').Value := EDT_Cliente.Text;
                ParamByName('cod_fp').Value := EDT_CondPagto.Text;
                ParamByName('tot').Value := EdtTotal.Value;
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
                BaixaItemVenda(spCodVenda.Value, cdsitensVendascod.Value, 1, 0, cdsitensVendasqtd.Value, cdsitensVendasTotal_Item.Value);
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

function TFrmVendas.PegaCodVenda: Integer;
var
    IDVenda: Integer;
begin
    try
        try
            DmDados.IBTransaction1.StartTransaction;

            with DmDados.Q_executa do
            begin
                Close;
                SQL.Clear;
                SQL.Add('INSERT INTO VENDAS(COD_VENDEDOR,COD_CLIENTE,COD_FPGTO,TOTAL,DATA,HORA) VALUES(:cod_vendedor,:cod_cli,:cod_fp,:tot,:dt,:hr)');
                ParamByName('cod_vendedor').Value := 1;
                ParamByName('cod_cli').Value := 0;
                ParamByName('cod_fp').Value := 0;
                ParamByName('tot').Value := 0;
                ParamByName('dt').Value := Date;
                ParamByName('hr').Value := Time;
                ExecSQL;
            end;

            DmDados.IBTransaction1.CommitRetaining;

            IDVenda := GeneratorID('GEN_VENDAS_ID', DmDados.conexao, False);

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

procedure TFrmVendas.EDT_ClienteChange(Sender: TObject);
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
            lbCliente.Caption := Q_ClientesNOME_CLI.AsString;
            EdtLimitCli.Value := Q_ClientesLIMITE_CLI.Value;
        end
        else
        begin
            lbCliente.Caption := 'Nada foi encontrado...'
        end;
    end;
end;

procedure TFrmVendas.EDT_CondPagtoChange(Sender: TObject);
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
            Lbfp.Caption := Q_FPGTODESCRICAO.AsString;
        end
        else
        begin
            Lbfp.Caption := 'Nada foi encontrado...'
        end;
    end;

    if (EDT_CondPagto.Text = '4') then
    begin
      edtRecebido.Visible := false;
    end
    else
    begin
      edtRecebido.Visible := true;
    end;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F2) then
    begin
      SpeedButton1Click(Self);
    end;

    if (Key = VK_F4) then
    begin
      SpeedButton2Click(Self);    
    end;

    if (Key = VK_Escape) then
    begin
        if (PNL_Fechamento.Visible = true) then
        begin
            PNL_Fechamento.Visible := False;
        end;
    end;

    if (Key = VK_F5) then
    begin
      SpeedButton3Click(Self);    
    end;
end;

procedure TFrmVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
{    if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;   }
end;

procedure TFrmVendas.FormShow(Sender: TObject);
var
   r : TRect;
begin
    //SystemParametersInfo(SPI_GETWORKAREA, 0, @r,0) ;
    //SetBounds(r.Left, r.Top, r.Right-r.Left, r.Bottom-r.Top) ;

    VendaAberta := false;

    grdVendas.Color := clBtnFace;
    grdVendas.Enabled := False;

    mskCodigo.Color := clBtnFace;
    mskCodigo.Enabled := False;

    mskQuantidade.Color := clBtnFace;
    mskQuantidade.Enabled := False;
end;

procedure TFrmVendas.mskCodigoChange(Sender: TObject);
begin
  //7894900014211
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
            LBpRODUTO.Caption := QProd_CodBarraNOME_PRO.AsString;

            if (QProd_CodBarraPRECO_PROMOCAO.Value <> 0) then
            begin
              edtValorUni.Value := QProd_CodBarraPRECO_PROMOCAO.Value;
            end
            else
            begin
              edtValorUni.Value := QProd_CodBarraPRECO_VAREJO.Value;
            end;
        end
        else
        begin
            LBpRODUTO.Caption := 'PRODUTO NÃO ENCONTRADO...'
        end;

    end;
end;

procedure TFrmVendas.mskCodigoKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F3) then
    begin
        Application.CreateForm(TFrmConsProduto, FrmConsProduto);
        FrmConsProduto.Tag := 0;
        FrmConsProduto.Showmodal;
        FrmConsProduto.Hide;
        FrmConsProduto.Free;
    end;

    if (Key = VK_Return) then
    begin
        mskQuantidade.Value := 1;

        if (mskQuantidade.Value > 0) then
        begin
          edTotalItem.Value := ({QProd_CodBarraPRECO_VAREJO.Value} edtValorUni.Value * mskQuantidade.Value);
        end
        else
        begin
          Application.MessageBox('Você deve informar a quantidade.','Aviso', MB_OK+MB_ICONWARNING);
          mskQuantidade.Value := 1;
          mskQuantidade.SetFocus;
          Abort;
        end;

        mskQuantidade.SetFocus;

    end;

end;

procedure TFrmVendas.EdtTotalChange(Sender: TObject);
begin
    lbTotal.Caption := formatfloat('R$ ##,###,##0.00', EdtTotal.Value);
end;

procedure TFrmVendas.mskQuantidadeChange(Sender: TObject);
begin
    edTotalItem.Value := (QProd_CodBarraPRECO_VAREJO.Value * mskQuantidade.Value);
end;

procedure TFrmVendas.edTotalItemChange(Sender: TObject);
begin
    lbTotalIem.Caption := formatfloat('##,###,##0.00', edTotalItem.Value);
end;

procedure TFrmVendas.edtValorUniChange(Sender: TObject);
begin
    lbPrecoUnitario.Caption := formatfloat('##,###,##0.00', edtValorUni.Value);
end;

procedure TFrmVendas.edtTrocoChange(Sender: TObject);
begin
    fldTroco.Caption := formatfloat('##,###,##0.00', edtTroco.Value);
end;

procedure TFrmVendas.AddItemVenda;
begin
    try

        cdsitensVendas.Append;
        cdsitensVendascod.Value := QProd_CodBarraCOD_PRO.Value;
        cdsitensVendasdescricao.Value := QProd_CodBarraNOME_PRO.Value;
        cdsitensVendasqtd.Value := mskQuantidade.Value;
        cdsitensVendasvl_item.Value := edtValorUni.Value;
        cdsitensVendasTotal_Item.Value := edTotalItem.Value;
        cdsitensVendascodBarra.Value := QProd_CodBarraCODIGO_BARRA_PRO.AsString;
        //cdsitensVendasvl_unitario.Value := vlunit;
        cdsitensVendas.Post;

        EdtTotal.Value := cdsitensVendasTotal.Value;

        mskCodigo.SetFocus;

    except
        on e: exception do
        begin
            Application.MessageBox(PChar('Erro ao tentar inserir o produto na venda!' + #13 + 'Obs: ' + e.Message), 'Erro', mb_ok + MB_ICONERROR);
        end;
    end;

end;

procedure TFrmVendas.FormCreate(Sender: TObject);
begin
    cdsitensVendas.CreateDataSet;

    WindowState := wsMaximized;

    


    Application.CreateForm(TFrrmLogin,FrrmLogin);
    FrrmLogin.ShowModal;
    FrrmLogin.Hide;
    FrrmLogin.Free;
end;

procedure TFrmVendas.mskQuantidadeKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_Return) then
    begin
     if (QProd_CodBarra.RecordCount > 0) then
     begin
      if (mskQuantidade.Value > 0) then
      begin
        edTotalItem.Value := ({QProd_CodBarraPRECO_VAREJO.Value} edtValorUni.Value * mskQuantidade.Value);
        AddItemVenda;
      end
      else
      begin
        Application.MessageBox('Você deve informar a quantidade.','Aviso', MB_OK+MB_ICONWARNING);
        mskQuantidade.Value := 1;
        mskQuantidade.SetFocus;
        Abort;
      end;
     end
     else
     begin
      Application.MessageBox('Você deve informar um produto que exista no estoque!','Produto não encontrado', MB_OK+MB_ICONERROR);
      mskCodigo.SetFocus;
     end;

    end;
end;

procedure TFrmVendas.mskQuantidadeEnter(Sender: TObject);
begin
{    mskCodigo.AutoSelect := true;
    mskQuantidade.Value := 1;}
end;

procedure TFrmVendas.grdVendasKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F6) then
    begin
        try
          if application.MessageBox('Deseja realmente excluir o produto da venda?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
          begin
              cdsitensVendas.Delete;

              if (cdsitensVendas.RecordCount > 0) then
              begin
                EdtTotal.Value := cdsitensVendasTotal.Value;
              end
              else
              begin
                EdtTotal.Value := 0;
              end;

              LBpRODUTO.Caption := '';
              mskCodigo.Clear;
              mskQuantidade.Clear;
              edtValorUni.Clear;
              edTotalItem.Clear;
              mskCodigo.SetFocus;
          end;
        except
            on e: exception do
            begin
                Application.MessageBox(PChar('Erro ao tentar excluir o produto na venda!' + #13 + 'Obs: ' + e.Message), 'Erro', mb_ok + MB_ICONERROR);
            end;
        end;
    end;
end;

procedure TFrmVendas.edtRecebidoKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  Total : String;
begin
    if (Key = VK_Return) then
    begin
        if (edtRecebido.Value < EdtTotal.Value) then
        begin
            Application.MessageBox('O valor recebdo é menor que o valor da venda, Por favor corrigir!', 'Erro', mb_ok + MB_ICONERROR);
            edtRecebido.SetFocus;
            Exit;
        end;

        if application.MessageBox('Deseja finaliza a venda?', 'Finalização de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
        begin
            Total := lbTotal.Caption;
            if (FinnalizaVenda(spCodVenda.Value)) then
            begin
                grdVendas.Color := clBtnFace;
                grdVendas.Enabled := False;

                mskCodigo.Color := clBtnFace;
                mskCodigo.Enabled := False;

                mskQuantidade.Color := clBtnFace;
                mskQuantidade.Enabled := False;

                LBpRODUTO.Caption := '';
                mskCodigo.Clear;
                mskQuantidade.Clear;
                edtValorUni.Clear;
                edTotalItem.Clear;
                //EdtTotal.Clear;

                edtRecebido.Clear;
                EDT_Cliente.Clear;
                EDT_CondPagto.Clear;
                edtTroco.Clear;
                Memo1.Clear;


                if (PNL_Fechamento.Visible = true) then
                begin
                    PNL_Fechamento.Visible := False;
                end;

                if application.MessageBox('Deseja finaliza a venda e imprimir o cumpom?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
                begin

                  if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, Label8.Caption,
                  lbCliente.Caption, Lbfp.Caption, formatfloat('##,###,##0.00', StrToFloat(lbTotalCom.Caption)), formatfloat('##,###,##0.00', EdtDesconto.Value), formatfloat('##,###,##0.00', EdtTotal.Value),
                  formatfloat('##,###,##0.00', edtTroco.Value)) then
                  begin
                    //ShowMessage('O cupom foi impresso com sucesso!');
                  end;


                end;

                lbCliente.Caption := '';
                Lbfp.Caption := '';

                EdtTotal.Clear;

                // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                cdsitensVendas.Close;

              // Fecha a Venda
                VendaAberta := false;
            end;
        end;
    end;
end;

procedure TFrmVendas.edtRecebidoChange(Sender: TObject);
begin
    edtTroco.Value := (edtRecebido.Value - EdtTotal.Value);
end;

procedure TFrmVendas.EDT_ClienteExit(Sender: TObject);
begin
    if (EDT_Cliente.Text = '') then
    begin
        Application.MessageBox('Por favor informe o cliente para a venda!', 'Erro', mb_ok + MB_ICONERROR);
        if (PNL_Fechamento.Visible) then
        begin
            EDT_Cliente.SetFocus;
        end;
        Abort;
    end;
end;

procedure TFrmVendas.EDT_CondPagtoExit(Sender: TObject);
begin
    if (EDT_CondPagto.Text = '') then
    begin
        Application.MessageBox('Por favor informe a forma de pagamento para a venda!', 'Erro', mb_ok + MB_ICONERROR);
        if (PNL_Fechamento.Visible) then
        begin
            EDT_CondPagto.SetFocus;
        end;
        Abort;
    end;

    if (EDT_CondPagto.Text = '4') then
    begin
      if (EdtTotal.Value > Q_ClientesLIMITE_CLI.Value) then
      begin
        Application.MessageBox('O limite do cliente é menor do que o valor da venda!', 'Erro', mb_ok + MB_ICONERROR);
        EDT_Cliente.SetFocus;
        Abort;
      end;

      if (EDT_CondPagto.Text = '4') then
      begin
        if (pnlObs.Visible = false) then
        begin
          DateRecebimento.Visible := true;
          DateRecebimento.Date := Date;
          pnlObs.Visible := true;
          Memo1.SetFocus;
        end;
      end;
    end;

    if (EDT_CondPagto.Text = '2') then  // Cartão de débito
    begin
      DateRecebimento.Visible := true;
      DateRecebimento.Date := Date + 1;
      edtRecebido.Visible := false;
    end;

    if (EDT_CondPagto.Text = '3') then  // Cartão de Crédito
    begin
      DateRecebimento.Visible := true;
      DateRecebimento.Date := Date + 14;
      edtRecebido.Visible := false;
    end;

    if (EDT_CondPagto.Text = '1') then  // Cartão de Crédito
    begin
      DateRecebimento.Visible := false;
      edtRecebido.Visible := true;
    end;

end;

procedure TFrmVendas.mskCodigoExit(Sender: TObject);
begin
   { if (QProd_CodBarra.RecordCount > 0) then
    begin
        //LBpRODUTO.Caption := QProd_CodBarraNOME_PRO.AsString;
        //edtValorUni.Value := QProd_CodBarraPRECO_VAREJO.Value;
    end
    else
    begin
        Application.MessageBox('Por favor, insira um produto válido!', 'Erro', mb_ok + MB_ICONERROR);
        mskCodigo.SetFocus;
        Exit;
    end;}
end;

procedure TFrmVendas.EDT_ClienteKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F3) then
    begin
        //Showmessage('Abrindo o forme de pesquisa');
        Application.CreateForm(TFrmConsCliente, FrmConsCliente);
        FrmConsCliente.Tag := 0;
        FrmConsCliente.ShowModal;
        FrmConsCliente.Hide;
        FrmConsCliente.Free;
    end;
end;

function TFrmVendas.GeneratorID(aName: string; Connection: TFDConnection;
    Incrementa: Boolean): integer;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    try
        Qry.Connection  := Connection;
        if Incrementa then
            Qry.SQL.Add(
                'SELECT GEN_ID(' + aName + ', 1) FROM RDB$DATABASE')
        else
            Qry.SQL.Add(
                'SELECT GEN_ID(' + aName + ', 0) FROM RDB$DATABASE');
        Qry.Open;
        Result := Qry.Fields[0].AsInteger;
    finally
        FreeAndNil(Qry);
    end;
end;

procedure TFrmVendas.BitBtn1Click(Sender: TObject);
var
    IDVenda: Integer;
begin
  // select gen_id(nome_generator,1) from rdb$database
    IDVenda := GeneratorID('GEN_VENDAS_ID', DmDados.conexao, False);
    spCodVenda.Value := IDVenda;
  //ShowMessage('O ID da Venda é: '+ IntToStr(IDVenda));
end;

function TFrmVendas.BaixaItemVenda(COD_VENDA, COD_PRO, COD_EMP, ORDEM: Integer; QUANT_ITEM : Currency; VALOR_ITEM: Currency): Boolean;
var
  Qtdreal, QtdBaixa : String;
begin
    try
        with QtdEstoqueItem do
        begin
            Close;
            ParamByName('cod').Value := COD_PRO;
            Open;
        end;

        Qtdreal := StringReplace( FloatToStr(QUANT_ITEM), ',', '.', [rfReplaceAll] );
          {QtdBaixa := FormatCurr('#,##0', QUANT_ITEM);  }

        //Qtdreal := StrToCurrDef(QtdEstoqueItemQUANT_ESTOQ.AsString,ffNumber,2);

        //valorreal := FormatCurr('#,##0', QtdEstoqueItemQUANT_ESTOQ.Value) - FormatCurr('#,##0', QUANT_ITEM);
         DmDados.IBTransaction1.StartTransaction;
        //Baixa a Qtd. no Estoque   ERRo AQUI
        with DmDados.Q_executa do
        begin
            Close;
            SQL.Clear;
            //SQL.Add('execute procedure atualiza_estoque ('+IntToStr(COD_PRO)+','+#39+'S'+#39+', '+Qtdreal+')');
            SQL.Add(' UPDATE ');
            SQL.Add('  PRODUTO ');
            SQL.Add(' SET ');
            SQL.Add('  QUANT_ESTOQ = :qtd ');
            SQL.Add(' WHERE ');
            SQL.Add('  COD_PRO = :COD ');
            ParamByName('qtd').Value := (QtdEstoqueItemQUANT_ESTOQ.Value - QUANT_ITEM);
            ParamByName('cod').Value := COD_PRO;
            ExecSQL;
        end;

        DmDados.IBTransaction1.CommitRetaining;

        DmDados.IBTransaction1.StartTransaction;
        with Q_BaixaItem do
        begin
            Close;
            ParamByName('1').Value := COD_VENDA;
            ParamByName('2').Value := COD_PRO;
            ParamByName('3').Value := COD_EMP;
            ParamByName('4').Value := ORDEM;
            ParamByName('5').Value := QUANT_ITEM;
            ParamByName('6').Value := VALOR_ITEM;
            ExecSQL;
        end;

        DmDados.IBTransaction1.CommitRetaining;

        Result := True;
    except
        on e: exception do
        begin
            Result := False;
            Application.MessageBox(PChar('Erro ao tentar inserir o produto na venda!' + #13 + 'Obs: ' + e.Message), 'Erro', mb_ok + MB_ICONERROR);
        end;
    end;
end;

procedure TFrmVendas.spCodVendaChange(Sender: TObject);
begin
    label8.Caption := Format('%5.5d', [spCodVenda.Value]); // resulta '00123' 5 Dígitos;
end;

procedure TFrmVendas.mskQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
    {if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;}
end;

procedure TFrmVendas.grdVendasKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;
end;

procedure TFrmVendas.EDT_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;
end;

procedure TFrmVendas.EDT_CondPagtoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;
end;

procedure TFrmVendas.BitBtn2Click(Sender: TObject);
begin
  pnlObs.Visible := false;
  EdtDesconto.SetFocus;
end;

procedure TFrmVendas.EdtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        Key := #0;
        SelectNext(ActiveControl, True, True);
    end;
end;

procedure TFrmVendas.EdtDescontoEnter(Sender: TObject);
begin
  EdtDesconto.Value := 0;
  EdtDesconto.SelectAll;
end;

procedure TFrmVendas.EdtDescontoExit(Sender: TObject);
var
  Total : Double;
  Total_ : String;
begin
  Total :=  cdsitensVendasTotal.Value;

  if (EdtDesconto.Value > 0) then
  begin
    EdtTotal.Value := Total - EdtDesconto.Value;
    lbTotalCom.Caption := formatfloat('##,###,##0.00', EdtTotal.Value);
  end
  else
  begin
    EdtTotal.Value := cdsitensVendasTotal.Value;
    lbTotalCom.Caption := formatfloat('##,###,##0.00', StrToFloat(lbSubTotal.Caption));
  end;

end;

procedure TFrmVendas.SpeedButton1Click(Sender: TObject);
begin
  if not (VendaAberta) then
        begin
            VendaAberta := True;

            // Prepara a tabela de Venda
            with cdsitensVendas do
            begin
                Active := False;
                Active := True;
                EmptyDataSet;
            end;

            grdVendas.Color := clWhite;
            grdVendas.Enabled := True;

            mskCodigo.Color := clWhite;
            mskCodigo.Enabled := True;

            mskQuantidade.Color := clWhite;
            mskQuantidade.Enabled := True;

            mskCodigo.SetFocus;

            spCodVenda.Value := PegaCodVenda;
        end;
end;

procedure TFrmVendas.SpeedButton2Click(Sender: TObject);
begin
  if (VendaAberta) then
        begin
            PNL_Fechamento.Visible := True;
            {Centraliza a imagem da LOGO}
            PNL_Fechamento.Left := (FrmVendas.Width - PNL_Fechamento.Width) div 2;
            PNL_Fechamento.Top := (FrmVendas.Height - PNL_Fechamento.Height) div 2;

            lbSubTotal.Caption := formatfloat('##,###,##0.00', EdtTotal.Value);
            lbTotalCom.Caption := formatfloat('##,###,##0.00', EdtTotal.Value);

            EDT_Cliente.SetFocus;
        end
        else
        begin
            Application.MessageBox('A venda precisa estar aberta para realizar a operação!', 'Informação', mb_ok + MB_ICONEXCLAMATION);
            Exit;
        end;
end;

procedure TFrmVendas.SpeedButton3Click(Sender: TObject);
begin
  if (VendaAberta) then
        begin
            if application.MessageBox('Deseja realmente cancelar esta venda?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
            begin
                if (excluir('VENDAS', 'COD_VENDAS', spCodVenda.Text)) then
                begin
                    grdVendas.Color := clBtnFace;
                    grdVendas.Enabled := False;

                    mskCodigo.Color := clBtnFace;
                    mskCodigo.Enabled := False;

                    mskQuantidade.Color := clBtnFace;
                    mskQuantidade.Enabled := False;

                    LBpRODUTO.Caption := '';
                    mskCodigo.Clear;
                    mskQuantidade.Clear;
                    edtValorUni.Clear;
                    edTotalItem.Clear;
                    EdtTotal.Clear;
                    Memo1.Clear;

                    edtRecebido.Clear;
                    EDT_Cliente.Clear;
                    EDT_CondPagto.Clear;
                    edtTroco.Clear;
                    spCodVenda.Value := 0;
                    label8.Caption := '';

                    cdsitensVendas.Close;

                    if (PNL_Fechamento.Visible = true) then
                    begin
                        PNL_Fechamento.Visible := False;
                    end;
                    VendaAberta := false;
                end;
            end;
        end
        else
        begin
            Application.MessageBox('A venda precisa estar aberta para realizar a operação!', 'Informação', mb_ok + MB_ICONEXCLAMATION);
            Exit;
        end;
end;

procedure TFrmVendas.EDT_CondPagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F8) then
  begin
    if (pnlObs.Visible = false) then
    begin
      pnlObs.Visible := true;
    end
    else
    begin
      pnlObs.Visible := false;
    end;
  end;

end;

procedure TFrmVendas.BitBtn3Click(Sender: TObject);
begin
  pnlObs.Visible := false;
  EdtDesconto.SetFocus;
end;

procedure TFrmVendas.DateRecebimentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 Total_ : String;
 //Saldo_Cupom :
begin
  if (Key = VK_Return) then
  begin
    if (EDT_CondPagto.Text = '4') then
    begin
          if (EdtLimitCli.Value < EdtTotal.Value) then
          begin
              Application.MessageBox('O valor do limte de crédito do cliente é menor que o valor da venda!', 'Atenção', mb_ok + MB_ICONWARNING);
              edtRecebido.SetFocus;
              Exit;
          end;

          if application.MessageBox('Deseja finaliza a venda?', 'Finalização de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
          begin
              Total_ := lbTotal.Caption;
              if (FinnalizaVenda(spCodVenda.Value)) then
              begin

                  with DmDados.Q_executa do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' UPDATE CLIENTE');
                    SQL.Add(' SET LIMITE_CLI = :lmt');
                    SQL.Add(' WHERE CLIENTE.COD_CLI = :cod');
                    ParamByName('lmt').Value := EdtLimitCli.Value - EdtTotal.Value;
                    ParamByName('cod').Value := strToInt(EDT_Cliente.Text);
                    ExecSQL;
                  end;

                  EDT_ClienteChange(Self);

                  grdVendas.Color := clBtnFace;
                  grdVendas.Enabled := False;

                  mskCodigo.Color := clBtnFace;
                  mskCodigo.Enabled := False;

                  mskQuantidade.Color := clBtnFace;
                  mskQuantidade.Enabled := False;

                  LBpRODUTO.Caption := '';
                  mskCodigo.Clear;
                  mskQuantidade.Clear;
                  edtValorUni.Clear;
                  edTotalItem.Clear;
                  //EdtTotal.Clear;


                  edtRecebido.Clear;

                  EDT_Cliente.Clear;

                  edtTroco.Clear;
                  Memo1.Clear;

                  DateRecebimento.Visible := false;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;

                  if application.MessageBox('Deseja finaliza a venda e imprimir o cumpom?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
                  begin
                    if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, Label8.Caption,
                    lbCliente.Caption, Lbfp.Caption, formatfloat('##,###,##0.00', StrToFloat(lbTotalCom.Caption)), formatfloat('##,###,##0.00', EdtDesconto.Value), formatfloat('##,###,##0.00', EdtTotal.Value),
                    formatfloat('##,###,##0.00', edtTroco.Value)) then
                    begin
                      //ShowMessage('O cupom foi impresso com sucesso!');
                    end;
                  end;


                  EDT_CondPagto.Clear;
                  lbCliente.Caption := '';
                  Lbfp.Caption := '';
                  
                  EdtTotal.Clear;

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
          end;

    end;


    // Cartão de Débito
    if (EDT_CondPagto.Text = '2') then
    begin
          if application.MessageBox('Deseja finaliza a venda?', 'Finalização de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
          begin
              Total_ := lbTotal.Caption;
              if (FinnalizaVenda(spCodVenda.Value)) then
              begin
                  grdVendas.Color := clBtnFace;
                  grdVendas.Enabled := False;

                  mskCodigo.Color := clBtnFace;
                  mskCodigo.Enabled := False;

                  mskQuantidade.Color := clBtnFace;
                  mskQuantidade.Enabled := False;

                  LBpRODUTO.Caption := '';
                  mskCodigo.Clear;
                  mskQuantidade.Clear;
                  edtValorUni.Clear;
                  edTotalItem.Clear;
                  //EdtTotal.Clear;

                  edtRecebido.Clear;
                  EDT_Cliente.Clear;
                  EDT_CondPagto.Clear;
                  edtTroco.Clear;
                  Memo1.Clear;

                  DateRecebimento.Visible := False;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;

                  if application.MessageBox('Deseja finaliza a venda e imprimir o cumpom?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
                  begin
                    if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, Label8.Caption,
                    lbCliente.Caption, Lbfp.Caption, formatfloat('##,###,##0.00', StrToFloat(lbTotalCom.Caption)), formatfloat('##,###,##0.00', EdtDesconto.Value), formatfloat('##,###,##0.00', EdtTotal.Value),
                    formatfloat('##,###,##0.00', edtTroco.Value)) then
                    begin
                      //ShowMessage('O cupom foi impresso com sucesso!');
                    end;
                  end;

                  lbCliente.Caption := '';
                  Lbfp.Caption := '';

                  EdtTotal.Clear;

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
          end;

    end;

    // Cartão de Débito
    if (EDT_CondPagto.Text = '3') then
    begin
          if application.MessageBox('Deseja finaliza a venda?', 'Finalização de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
          begin
              Total_ := lbTotal.Caption;
              if (FinnalizaVenda(spCodVenda.Value)) then
              begin
                  grdVendas.Color := clBtnFace;
                  grdVendas.Enabled := False;

                  mskCodigo.Color := clBtnFace;
                  mskCodigo.Enabled := False;

                  mskQuantidade.Color := clBtnFace;
                  mskQuantidade.Enabled := False;

                  LBpRODUTO.Caption := '';
                  mskCodigo.Clear;
                  mskQuantidade.Clear;
                  edtValorUni.Clear;
                  edTotalItem.Clear;
                  //EdtTotal.Clear;

                  edtRecebido.Clear;
                  EDT_Cliente.Clear;
                  EDT_CondPagto.Clear;
                  edtTroco.Clear;
                  Memo1.Clear;

                  DateRecebimento.Visible := False;


                  if (PNL_Fechamento.Visible = true) then
                  begin
                      PNL_Fechamento.Visible := False;
                  end;

                  if application.MessageBox('Deseja finaliza a venda e imprimir o cumpom?', 'Cancelamento de Venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
                  begin
                    // Imprime o cupom
                    if ImprimeCupom(40,DmDados.tb_empresaFANTASIA_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, Label8.Caption,
                    lbCliente.Caption, Lbfp.Caption, formatfloat('##,###,##0.00', StrToFloat(lbTotalCom.Caption)), formatfloat('##,###,##0.00', EdtDesconto.Value), formatfloat('##,###,##0.00', EdtTotal.Value),
                    formatfloat('##,###,##0.00', edtTroco.Value)) then
                    begin
                      //ShowMessage('O cupom foi impresso com sucesso!');
                    end;
                  end;

                  lbCliente.Caption := '';
                  Lbfp.Caption := '';

                  EdtTotal.Clear;

                  // Só depois de perguntar de quer imprimir o cupom que ele fecha os itens da venda
                  cdsitensVendas.Close;

                // Fecha a Venda
                  VendaAberta := false;
              end;
          end;

    end;
  end;
end;

end.

