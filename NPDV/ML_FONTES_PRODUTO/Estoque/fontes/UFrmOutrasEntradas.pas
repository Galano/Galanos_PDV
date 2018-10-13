unit UFrmOutrasEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Buttons, RxToolEdit, RxCurrEdit, Vcl.Mask, Vcl.ExtCtrls,
  IBX.IBCustomDataSet, IBX.IBQuery, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, System.Math;

type
  TFrmOutrasEntradas = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsFor: TSpeedButton;
    BtnAddFor: TSpeedButton;
    Label22: TLabel;
    EdtNomeFor: TEdit;
    EdtData: TMaskEdit;
    GroupBox1: TGroupBox;
    EdtTotal: TCurrencyEdit;
    Panel4: TPanel;
    Label17: TLabel;
    BtnConsPro: TSpeedButton;
    BtnAddPro: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label30: TLabel;
    Label27: TLabel;
    Label63: TLabel;
    Label41: TLabel;
    EdtNomePro: TEdit;
    EdtQuant: TCurrencyEdit;
    EdtValorUnit: TCurrencyEdit;
    EdtTotalProd: TCurrencyEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    EdtCodProBarras: TEdit;
    EdtAliqICMS: TCurrencyEdit;
    EdtBCR: TCurrencyEdit;
    EdtAliqIPI: TCurrencyEdit;
    Panel2: TPanel;
    ImageList: TImageList;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    BtnFinaliza: TToolButton;
    ToolButton1: TToolButton;
    EdtCodFor: TEdit;
    EdtCodigo: TEdit;
    Label3: TLabel;
    EdtNunNota: TEdit;
    edtCod: TEdit;
    btFiltro: TButton;

    Q_Consulta_filtro: TIBQuery;
    Q_Consulta_filtroCOD_OUTRA: TIntegerField;
    Q_Consulta_filtroDATA_OUTRA: TDateField;
    Q_Consulta_filtroCOD_FOR: TIntegerField;
    Q_Consulta_filtroCOD_EMP: TIntegerField;
    Q_Consulta_filtroTOTAL_OUTRA: TIBBCDField;
    Q_Consulta_filtroNUMERO_NOTA_FISCAL: TIntegerField;
    Q_Consulta_filtroSERIE_NOTA_FISCAL: TIBStringField;
    Q_Consulta_filtroCANCELADA: TIntegerField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldValue: TLinkPropertyToField;
    edtCodGrp: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    QBuscaItens: TIBQuery;
    DSQBuscaItens: TDataSource;
    QOrdem: TIBQuery;
    QOrdemORDEM: TIntegerField;
    Q_TOTAL: TIBQuery;
    QBuscaItensCOD_ITEM: TIntegerField;
    QBuscaItensCOD_OUTRA: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TIBBCDField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensVALOR_ITEM: TIBBCDField;
    QBuscaItensVALOR_TOTAL_ITEM: TIBBCDField;
    QBuscaItensCOD_GRP: TIntegerField;
    QBuscaItensALIQ_ICMS: TIBBCDField;
    QBuscaItensREDUCAO_ICMS: TIBBCDField;
    QBuscaItensIPI: TIBBCDField;
    QBuscaItensNOME_PRO: TIBStringField;
    tagn: TEdit;
    Q_TOTALTOTAL: TIBBCDField;
    Q_ESTOQUE: TIBQuery;
    edtQtdEst: TCurrencyEdit;
    QPesqEstoque: TIBQuery;
    QPesqEstoqueCOD_PRO: TIntegerField;
    QPesqEstoqueNOME_PRO: TIBStringField;
    QPesqEstoqueQUANT_ESTOQ: TIBBCDField;
    QFor: TIBQuery;
    QProd: TIBQuery;
    QForCOD_FOR: TIntegerField;
    QForRAZAO_FOR: TIBStringField;
    QProdCOD_PRO: TIntegerField;
    QProdNOME_PRO: TIBStringField;
    QProdQUANT_ESTOQ: TIBBCDField;
    QProdCOD_GRUP: TIntegerField;
    Q_Consulta_cod: TIBQuery;
    Q_Consulta_codCOD_OUTRA: TIntegerField;
    Label4: TLabel;
    DtVencto: TDateEdit;
    Bevel1: TBevel;
    lbStatus: TLabel;
    QBuscaItensDATA_VENCTO: TDateField;
    Label5: TLabel;
    DtVenctoItem: TDateEdit;
    LinkPropertyToFieldDate: TLinkPropertyToField;
    Label6: TLabel;
    CbFPgto: TComboBox;
    EdtCodPro: TEdit;
    Q_Attualiza_Preco: TIBQuery;
    Q_Attualiza_PrecoCOD_PRO: TIntegerField;
    Q_Attualiza_PrecoCODIGO_BARRA_PRO: TIBStringField;
    Q_Attualiza_PrecoTP_PRODUTO: TIBStringField;
    Q_Attualiza_PrecoTP_PRODUCAO: TIBStringField;
    Q_Attualiza_PrecoESTOQUE_MINIMO: TIBBCDField;
    Q_Attualiza_PrecoNOME_PRO: TIBStringField;
    Q_Attualiza_PrecoDESC_CUPOM: TIBStringField;
    Q_Attualiza_PrecoCOD_MARC: TIntegerField;
    Q_Attualiza_PrecoCOD_SEC: TIntegerField;
    Q_Attualiza_PrecoCOD_GRUP: TIntegerField;
    Q_Attualiza_PrecoCOD_SGRUP: TIntegerField;
    Q_Attualiza_PrecoCOD_UNI_ENT: TIntegerField;
    Q_Attualiza_PrecoCOD_UNI_SAI: TIntegerField;
    Q_Attualiza_PrecoPRECO_VAREJO: TIBBCDField;
    Q_Attualiza_PrecoPRECO_PROMOCAO: TIBBCDField;
    Q_Attualiza_PrecoPRECO_PRAZO: TIBBCDField;
    Q_Attualiza_PrecoMARGEM_LUCRO: TIBBCDField;
    Q_Attualiza_PrecoQUANT_ESTOQ: TIBBCDField;
    Q_Attualiza_PrecoDATA_VALIDADE: TDateField;
    Q_Attualiza_PrecoDIAS_VALIDADE_PRO: TIntegerField;
    Q_Attualiza_PrecoCONTROLA_ESTOQUE_PRO: TIBStringField;
    Q_Attualiza_PrecoATIVO_PRO: TIBStringField;
    Q_Attualiza_PrecoCAMINHO_FOTO_PRO: TBlobField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnAddForClick(Sender: TObject);
    procedure BtnFinalizaClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure EdtQuantExit(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure LimpaItens;
    procedure BtnExcluiClick(Sender: TObject);
    procedure EdtCodForChange(Sender: TObject);
    procedure EdtCodProBarrasChange(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtQuantEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure atualiza_valor_nota(valor: Double);
    procedure atulaiza_preco_produto(cod: integer; preco: Extended);
  end;

var
  FrmOutrasEntradas: TFrmOutrasEntradas;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsFornecedor, UFornecedor, UFrmConsProduto,
  UFrmConsOutrasEntradas, UFrmProdutos;

procedure TFrmOutrasEntradas.atualiza_valor_nota(valor: Double);
begin
  with DmDados.Q_executa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE');
    SQL.Add('   ENTRADAS');
    SQL.Add(' SET');
    SQL.Add('   TOTAL_OUTRA  = :vl');
    SQL.Add(' WHERE');
    SQL.Add('   COD_OUTRA = :cod');
    Parambyname('vl').Value     := valor;
    Parambyname('cod').AsInteger     := strtoint(EdtCodigo.Text);
    ExecSQL;

    DmDados.IBTransaction1.CommitRetaining;
  end;
end;

function RoundCurrency(const Value: Currency; const nk: Integer)
  : Currency;

const
  faktors: array [-3 .. 3] of Integer = (10000000, 1000000, 100000, 10000,
    1000, 100, 10);

var
  x: Int64;
  y: Int64;

begin
  { Currency tem somente 4 digitos após a vírgula decimal }
  if (nk >= 4) or (Value = 0) then
  begin
    Result := Value;
    exit;
  end;

  if nk < Low(faktors) then
    raise EInvalidArgument.CreateFmt('RoundCurrency(,%d): invalid arg', [nk]);
  { cast de Currency para Int64 }
  x := PInt64(@Value)^;
  y := faktors[nk];
  { arredondando }
  if x > 0 then
    x := ((x + (y div 2)) div y) * y
  else
    x := ((x - (y div 2)) div y) * y;
  { cast de Int64 para Currency }
  Result := PCurrency(@x)^;
end;

procedure TFrmOutrasEntradas.atulaiza_preco_produto(cod: integer;
  preco: Extended);
var
  valor_ : Extended;
begin
  with Q_Attualiza_Preco do
  begin
    Close;
    Parambyname('cod').Value := cod;
    Open;
  end;

  if (Q_Attualiza_PrecoMARGEM_LUCRO.Value <> 0) then
  begin
    valor_ := (preco + (preco * Q_Attualiza_PrecoMARGEM_LUCRO.Value / 100));

    valor_ := RoundCurrency(valor_,1); //4
  end
  else
  begin
    valor_ := Q_Attualiza_PrecoPRECO_PRAZO.Value;
  end;

  with DmDados.Q_executa do
      begin
        Close;
        sql.Clear;
        sql.Add('UPDATE');
        sql.Add(' PRODUTO');
        sql.Add(' SET');
        sql.Add(' PRECO_PRAZO = :2, MARGEM_LUCRO = :3, PRECO_VAREJO = :4');
        sql.Add(' WHERE');
        sql.Add(' PRODUTO.COD_PRO = :1');
        Parambyname('1').AsInteger := cod;
        Parambyname('2').Value := preco;
        Parambyname('3').Value := Q_Attualiza_PrecoMARGEM_LUCRO.Value;
        Parambyname('4').Value := valor_;
        ExecSQL;
      end;
      DmDados.IBTransaction1.CommitRetaining;

end;

procedure TFrmOutrasEntradas.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmOutrasEntradas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmOutrasEntradas);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            begin
               btnalterar.Enabled:= false;
               BtnConsultar.Enabled := true;
            end
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
      end;
end;

procedure TFrmOutrasEntradas.btFiltroClick(Sender: TObject);
begin
  tagn.Text := '0';
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_entradas do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_OUTRA = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;

    //DtVencto.Text := DmDados.tb_entradasDATA_VENCTO.AsString;

    // Cancelada  0 = EM ABERTO | 1 = NOTA PAGA
    if (DmDados.tb_entradasCANCELADA.Value = 0) then
    begin
      lbStatus.Font.Color := clRed;
      lbStatus.Caption := 'EM ABERTO';
    end
    else
    begin
      lbStatus.Font.Color := clBlue;
      lbStatus.Caption := 'NOTA PAGA';
    end;

    with QBuscaItens do
    begin
       Close;
       ParamByName('COD').Value := StrToInt(EdtCodigo.Text);
       Open;
    end;

    with Q_TOTAL do
    begin
       Close;
       ParamByName('CODIGO').Value := StrToInt(EdtCodigo.Text);
       Open;
    end;

    if (lbStatus.Caption = 'EM ABERTO') then
    begin
      CbFPgto.ItemIndex := 1;
    end
    else
    begin
      CbFPgto.ItemIndex := 0;
    end;


    EdtTotal.Value := Q_TOTALTOTAL.Value;
  end
  else
  begin
    DmDados.tb_entradas.Close;
  end;
end;

procedure TFrmOutrasEntradas.BtnAddForClick(Sender: TObject);
begin
  Application.CreateForm(TFrmFornecedor,FrmFornecedor);
  FrmFornecedor.Showmodal;
  FrmFornecedor.Hide;
  FrmFornecedor.Free;
end;

procedure TFrmOutrasEntradas.BtnAddProClick(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutos,FrmProdutos);
  FrmProdutos.Showmodal;
  FrmProdutos.Hide;
  FrmProdutos.Free;
end;

procedure TFrmOutrasEntradas.BtnAlterarClick(Sender: TObject);
begin
  FrmOutrasEntradas.tag := 1;
  panel3.Enabled     := true;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmOutrasEntradas.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
  lbStatus.Caption := '';
  panel3.Enabled:= false;
  panel4.Enabled:= false;
  DmDados.tb_entradas.Close;
  QBuscaItens.Close;
end;

procedure TFrmOutrasEntradas.BtnConsForClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Tag := 1;
  FrmConsFornecedor.Showmodal;
  FrmConsFornecedor.Hide;
  FrmConsFornecedor.Free;
end;

procedure TFrmOutrasEntradas.BtnConsProClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProduto,FrmConsProduto);
  FrmConsProduto.Tag := 1;
  FrmConsProduto.Showmodal;
  FrmConsProduto.Hide;
  FrmConsProduto.Free;
end;

procedure TFrmOutrasEntradas.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOutrasEntradas,FrmConsOutrasEntradas);
  FrmConsOutrasEntradas.tag := 0;
  FrmConsOutrasEntradas.Showmodal;
  FrmConsOutrasEntradas.Hide;
  FrmConsOutrasEntradas.Free;
end;

procedure TFrmOutrasEntradas.BtnExcluiClick(Sender: TObject);
begin
    if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        try
          try
            with DmDados.Q_executa do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_ENTRADAS ' +
                          'WHERE COD_OUTRA = :CODOUTRA AND ORDEM = :ORDEM');
                  Parambyname('codoutra').AsInteger := strtoint(EdtCodigo.text);
                  Parambyname('ordem').AsInteger    := QBuscaItensORDEM.Value;
                  ExecSQL;
               end;

               with QPesqEstoque do
               begin
                 Close;
                 ParamByName('cod').Value := QBuscaItensCOD_PRO.Value;
                 Open;
                 FetchAll;
               end;

               if (QPesqEstoque.RecordCount > 0) then
               begin
                 with Q_ESTOQUE do
                 begin
                   Close;
                   ParamByName('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value - QBuscaItensQUANT_ITEM.Value;
                   ParamByName('cod').Value := QBuscaItensCOD_PRO.Value;
                   ExecSQL;
                 end;
               end;

            DmDados.IBTransaction1.CommitRetaining;
          except
            DmDados.IBTransaction1.RollbackRetaining;
            showmessage('Erro ao Excluir o Item');
          end;
        finally
          LimpaItens;

          with QBuscaItens do
          begin
             Close;
             ParamByName('COD').Value := StrToInt(EdtCodigo.Text);
             Open;
          end;

        end;
     end;
end;

procedure TFrmOutrasEntradas.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('ENTRADAS', 'COD_OUTRA', EdtCodigo.Text)) then
  begin
    // Realiza a Atualização do Estoque Deveolve
    QBuscaItens.First;
    while not QBuscaItens.Eof do
    begin
      //pesquisa a Qtd. no estoque
      with QPesqEstoque do
       begin
         Close;
         ParamByName('cod').Value := QBuscaItensCOD_PRO.Value;
         Open;
         FetchAll;
       end;

       if (QPesqEstoque.RecordCount > 0) then
       begin
        with Q_ESTOQUE do
        begin
           Close;
           ParamByName('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value - QBuscaItensQUANT_ITEM.Value;
           ParamByName('cod').Value := QBuscaItensCOD_PRO.Value;
           ExecSQL;
        end;
       end;
      QBuscaItens.Next;
    end;

      try
       with DmDados.Q_executa do
          begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM ITENS_OUTRAS_SAIDAS WHERE ITENS_OUTRAS_SAIDAS.COD_OUTRA = :cod');
             ParamByName('cod').Value := EdtCodigo.Text;
             ExecSQL;
          end;

       DmDados.IBTransaction1.CommitRetaining;

     except
       DmDados.IBTransaction1.RollbackRetaining;
     end;

    QBuscaItens.Close;
    panel3.Enabled:= false;
    panel4.Enabled:= false;
    Botoes('E');
  end;
end;

procedure TFrmOutrasEntradas.BtnFinalizaClick(Sender: TObject);
begin
  if application.MessageBox('Confirma a o pagamento da nota?', 'confirmação', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
  begin
    try
      with DmDados.Q_executa do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE ENTRADAS SET CANCELADA = :baixa WHERE ENTRADAS.COD_OUTRA = :COD');
        ParamByName('baixa').Value := 1;
        ParamByName('cod').Value := StrToInt(EdtCodigo.Text);
        ExecSQL;
      end;
      DmDados.IBTransaction1.CommitRetaining;
      btFiltroClick(Self);
      Botoes('G');
      BtnCancelar.Enabled := true;
    except
    on e:exception do
      begin
        ShowMessage('Erro ao tentar dar baixa na nota: '+e.message);
        DmDados.IBTransaction1.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TFrmOutrasEntradas.BtnGravaClick(Sender: TObject);
var
  codigo : integer;
begin
   if (trim(EdtCodigo.Text) <> '') then
   begin
      if trim(EdtCodProBarras.Text) = '' then
         begin
            EdtCodProBarras.SetFocus;
            exit;
         end;

      if trim(EdtCodPro.Text) = '' then
         begin
            EdtCodPro.SetFocus;
            exit;
         end;

      if strtocurr(edtquant.Text) = 0 then
         begin
            showmessage('Digite a quantidade');
            edtquant.SetFocus;
            exit;
         end;

      if strtocurr(EdtValorUnit.Text) = 0 then
         begin
            showmessage('Digite o valor');
            EdtValorUnit.SetFocus;
            exit;
         end;

      if trim(EdtCodGRP.Text) = '' then
         begin
            EdtCodGRP.SetFocus;
            showmessage('Grupo de ICMS Inválido');
            exit;
         end;

      try
        try
          with DmDados.Q_executa do
            begin
               close;
               sql.Clear;
               if (tagn.Text = '0') then // Grava um novo reristro
                  begin
                     sql.Add('INSERT INTO ITENS_ENTRADAS(COD_OUTRA,COD_PRO,COD_EMP,QUANT_ITEM,ORDEM,VALOR_ITEM,VALOR_TOTAL_ITEM,COD_GRP,ALIQ_ICMS,REDUCAO_ICMS,IPI,DATA_VENCTO) ' +
                             'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13)');
                  end
               else
                  begin
                     sql.Add('UPDATE');
                     sql.Add('   ITENS_ENTRADAS');
                     sql.Add(' SET');
                     sql.Add('   COD_OUTRA  = :2,');
                     sql.Add('   COD_PRO  = :3,');
                     sql.Add('   COD_EMP   = :4,');
                     sql.Add('   QUANT_ITEM   = :5,');
                     sql.Add('   ORDEM  = :6,');
                     sql.Add('   VALOR_ITEM  = :7,');
                     sql.Add('   VALOR_TOTAL_ITEM  = :8,');
                     sql.Add('   COD_GRP  = :9,');
                     sql.Add('   ALIQ_ICMS  = :10,');
                     sql.Add('   REDUCAO_ICMS  = :11,');
                     sql.Add('   IPI  = :12,');
                     sql.Add('   DATA_VENCTO  = :13');
                     sql.Add(' WHERE');
                     sql.Add('   COD_ITEM = :1');
                             Parambyname('1').AsInteger     := QBuscaItensCOD_ITEM.Value;

                  end;

                with QOrdem do
                begin
                   Close;
                   ParamByName('CODIGO').Value := StrToInt(trim(EdtCodigo.Text));
                   Open;
                end;

               Parambyname('2').Value   := StrToInt(trim(EdtCodigo.Text));
               Parambyname('3').value   := StrToInt(trim(EdtCodPro.Text));
               Parambyname('4').Value   := 1;
               Parambyname('5').Value   := EdtQuant.Value;
               Parambyname('6').value   := QOrdemORDEM.Value + 1;
               Parambyname('7').Value   := EdtValorUnit.Value;
               Parambyname('8').value   := EdtTotalProd.Value;
               Parambyname('9').Value   := StrToInt(trim(edtCodGrp.Text));
               Parambyname('10').Value  := EdtAliqICMS.Value;
               Parambyname('11').value  := EdtBCR.Value;
               Parambyname('12').value  := EdtAliqIPI.Value;

               if (DtVenctoItem.Text = '  /  /    ') then
               begin
                 Parambyname('13').AsString  := '';
               end
               else
               begin
                 Parambyname('13').AsString := DtVenctoItem.Text;
               end;

               ExecSQL;
            end;


            {Atualiza a data de Vencimento}
             with DmDados.Q_executa do
             begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PRODUTO SET');
                SQL.Add('  DATA_VALIDADE = :validade');
                SQL.Add(' WHERE');
                SQL.Add('  PRODUTO.COD_PRO = :cod');
                if (DtVenctoItem.Text = '  /  /    ') then
                 begin
                   Parambyname('validade').AsString  := '';
                 end
                 else
                 begin
                   Parambyname('validade').AsString := DtVenctoItem.Text;
                 end;
                Parambyname('cod').value  := StrToInt(trim(EdtCodPro.Text));
                ExecSQL;
             end;

            with Q_ESTOQUE do
            begin
               Close;
               ParamByName('qtd').Value := edtQtdEst.Value + EdtQuant.Value;
               ParamByName('cod').Value := StrToInt(trim(EdtCodPro.Text));
               ExecSQL;
            end;

            DmDados.IBTransaction1.CommitRetaining;

            codigo := StrToInt(trim(EdtCodPro.Text));
            //Atualizo o valor do produto com base no cálculo aplicado
            atulaiza_preco_produto(codigo, EdtValorUnit.Value);

            Botoes('G');
            tagn.Text := '0';
            LimpaItens;

            with Q_TOTAL do
            begin
               Close;
               ParamByName('CODIGO').Value := StrToInt(trim(EdtCodigo.Text));
               Open;
            end;

            EdtTotal.Value := Q_TOTALTOTAL.Value;

            atualiza_valor_nota(EdtTotal.Value);



          if (tagn.Text = '0') then // Grava um novo reristro
          begin
            //Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
          end
          else
          begin
            //Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
            tagn.Text := '0';
          end;

        except
          on e: exception do
          begin
            DmDados.IBTransaction1.RollbackRetaining;

            //panel3.Enabled:= true;
            //panel4.Enabled:= false;

            Application.MessageBox(Pchar('Erro ao dar entrada no estoque!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
          end;
        end;
      finally
        with QBuscaItens do
        begin
           Close;
           ParamByName('COD').Value := StrToInt(EdtCodigo.Text);
           Open;
        end;

        EdtCodProBarras.Text := '';
        EdtNomePro.Text := '';

        EdtCodProBarras.SetFocus;
      end;
   end;
end;

procedure TFrmOutrasEntradas.BtnGravarClick(Sender: TObject);
begin
    if EdtNunNota.Text = '' then
     begin
        ShowMessage('Digite o Nª da Nota!');
        EdtNunNota.SetFocus;
        exit;
     end;

    if EdtCodFor.Text = '' then
     begin
        ShowMessage('Digite o Código do Fornecedor');
        EdtCodFor.SetFocus;
        exit;
     end;

    if (CbFPgto.Text = '') then
    begin
        ShowMessage('informe a forma de pagamento');
        CbFPgto.SetFocus;
        exit;
    end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmOutrasEntradas.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO ENTRADAS (DATA_OUTRA, COD_FOR, COD_EMP, NUMERO_NOTA_FISCAL, CANCELADA, DATA_VENCTO) ' +
                         'VALUES(:2, :3, :4, :5, :6, :7)');

                          Parambyname('6').value   := 0;
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   ENTRADAS');
                 sql.Add(' SET');
                 sql.Add('   DATA_OUTRA  = :2,');
                 sql.Add('   COD_FOR  = :3,');
                 sql.Add('   COD_EMP  = :4,');
                 sql.Add('   NUMERO_NOTA_FISCAL  = :5,');
                 sql.Add('   CANCELADA  = :6,');
                 sql.Add('   DATA_VENCTO  = :7,');
                 sql.Add('   TOTAL_OUTRA  = :8');
                 sql.Add(' WHERE');
                 sql.Add('   COD_OUTRA = :1');
                         Parambyname('1').AsInteger     := strtoint(EdtCodigo.Text);
                         if (DmDados.tb_entradasCANCELADA.Value = 1) then
                         begin
                           Parambyname('6').value   := 1;
                         end
                         else
                         begin
                           Parambyname('6').value   := 0;
                         end;

                         Parambyname('8').Value     := EdtTotal.Value;
              end;

           Parambyname('2').Value   := StrToDate(EdtData.Text);
           Parambyname('3').value   := EdtCodFor.Text;
           Parambyname('4').Value   := 1;
           Parambyname('5').Value   := EdtNunNota.Text;
           Parambyname('7').value   := DtVencto.Date;
           ExecSQL;
        end;

        DmDados.IBTransaction1.CommitRetaining;
        Botoes('G');

        with Q_Consulta_cod do
        begin
          Close;
          {ParamByName('num').Value := EdtNunNota.Text;
          ParamByName('cod').Value := EdtCodFor.Text;}
          Open;
          FetchAll;
        end;

        if (Q_Consulta_cod.RecordCount > 0) then
        begin
          EdtCodigo.Text := Trim(Q_Consulta_codCOD_OUTRA.AsString);
        end;

        panel3.Enabled:= false;
        panel4.Enabled:= true;
        EdtCodProBarras.SetFocus;

        if (panel4.Enabled = true) then
        begin
          EdtCodProBarras.SetFocus;
        end;

      // SE FOR AVISTA PAGA LOGO A NOTA
      if (CbFPgto.ItemIndex = 0) then
      begin
        try
          with DmDados.Q_executa do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE ENTRADAS SET CANCELADA = :baixa WHERE ENTRADAS.COD_OUTRA = :COD');
            ParamByName('baixa').Value := 1;
            ParamByName('cod').Value := StrToInt(EdtCodigo.Text);
            ExecSQL;
          end;
          DmDados.IBTransaction1.CommitRetaining;
          btFiltroClick(Self);
          Botoes('G');
          BtnCancelar.Enabled := true;
        except
        on e:exception do
          begin
            ShowMessage('Erro ao tentar dar baixa na nota: '+e.message);
            DmDados.IBTransaction1.RollbackRetaining;
          end;
        end;
      end;


      if (FrmOutrasEntradas.tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;

      BtnCancelar.Enabled := true;

    except
      on e: exception do
      begin
        DmDados.IBTransaction1.RollbackRetaining;

        panel3.Enabled:= true;
        panel4.Enabled:= false;

        Application.MessageBox(Pchar('Erro ao dar entrada no estoque!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;

end;

procedure TFrmOutrasEntradas.BtnNovoClick(Sender: TObject);
begin
  tagn.Text := '0';
  FrmOutrasEntradas.tag := 0;
  DmDados.tb_entradas.Close;
  QBuscaItens.Close;
  DtVenctoItem.Clear;
  Botoes('N');
  lbStatus.Caption := '';
  panel3.Enabled     := true;
  panel4.Enabled     := false;
  EdtData.Text       := datetostr(date);
  DtVencto.Clear;
  Edtdata.SetFocus;
end;

procedure TFrmOutrasEntradas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOutrasEntradas.DBGrid1DblClick(Sender: TObject);
begin
  tagn.Text := '1';

  EdtCodPro.Text := QBuscaItensCOD_PRO.AsString;
  EdtNomePro.Text := QBuscaItensNOME_PRO.AsString;
  EdtCodProBarrasChange(Self);
  EdtQuant.Value := QBuscaItensQUANT_ITEM.Value;
  EdtValorUnit.Value := QBuscaItensVALOR_ITEM.Value;
  {if (QBuscaItensDATA_VENCTO.Value <> null) then
  begin
    DtVenctoItem.Date := QBuscaItensDATA_VENCTO.Value;
  end;}

  try
   DtVenctoItem.Date := QBuscaItensDATA_VENCTO.Value;
  except
   DtVenctoItem.Clear;  //Aparece um Valor Doido  30/12/1899
  end;

  EdtAliqICMS.Value := QBuscaItensALIQ_ICMS.Value;
  EdtAliqIPI.Value  := QBuscaItensIPI.Value;
  EdtBCR.Value := QBuscaItensREDUCAO_ICMS.Value;
  EdtTotalProd.Value := QBuscaItensVALOR_TOTAL_ITEM.Value;
  EdtCodPro.SetFocus;

end;

procedure TFrmOutrasEntradas.EdtCodForChange(Sender: TObject);
begin
  if (EdtCodFor.Text <> '') then
  begin
    with QFor do
    begin
      Close;
      ParamByName('cod').Value := EdtCodFor.Text;
      Open;
      FetchAll;
    end;

    if (QFor.RecordCount > 0) then
    begin
      EdtNomeFor.Text := QForRAZAO_FOR.AsString;
    end
    else
    begin
      EdtNomeFor.Text := 'NÃO ENCONTRADO';
    end;
  end;

end;

procedure TFrmOutrasEntradas.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if Application.MessageBox('Confirma a inclusão da nota de entrada', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
      BtnGravarClick(Self);
     end;
  end;
end;

procedure TFrmOutrasEntradas.EdtCodProBarrasChange(Sender: TObject);
begin
  if (EdtCodProBarras.Text <> '') then
  begin
    with QProd do
    begin
      Close;
      ParamByName('cod').Value := EdtCodProBarras.Text;
      Open;
      FetchAll;
    end;

    if (QProd.RecordCount > 0) then
    begin
      EdtCodPro.Text := QProdCOD_PRO.AsString;
      EdtNomePro.Text := QProdNOME_PRO.AsString;
      edtQtdEst.Value := QProdQUANT_ESTOQ.Value;
      edtCodGrp.Text := QProdCOD_GRUP.AsString;
    end
    else
    begin
      EdtNomePro.Text := 'NÃO ENCONTRADO';
      edtQtdEst.Value := 0;
      edtCodGrp.Text := '0';
      EdtCodPro.Text := '0';
    end;
  end;
end;

procedure TFrmOutrasEntradas.EdtQuantEnter(Sender: TObject);
begin
  EdtQuant.Value := 1;
  EdtQuant.SelectAll;
end;

procedure TFrmOutrasEntradas.EdtQuantExit(Sender: TObject);
begin
  if (EdtValorUnit.Value <> 0) then
  begin
    EdtTotalProd.Value := (EdtQuant.Value * EdtValorUnit.Value);
  end;
end;

procedure TFrmOutrasEntradas.EdtValorUnitExit(Sender: TObject);
begin
  EdtTotalProd.Value := (EdtQuant.Value * EdtValorUnit.Value);
end;

procedure TFrmOutrasEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmOutrasEntradas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFrmOutrasEntradas.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
  tagn.Text := '0';
  EdtData.Text := '';
  EdtData.SetFocus;
end;

procedure TFrmOutrasEntradas.LimpaItens;
begin
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   EdtValorUnit.Clear;
   EdtTotalProd.Clear;
   EdtCodGRP.clear;
   EdtAliqICMS.Clear;
   EdtBCR.Clear;
   EdtAliqIPI.Clear;
end;

end.
