unit UFrmOutrasSaidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBSQL, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, RxToolEdit,
  RxCurrEdit, Vcl.Mask, Vcl.ExtCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Samples.Spin, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmOutrasSaidas = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsCli: TSpeedButton;
    BtnAddCli: TSpeedButton;
    Label22: TLabel;
    EdtNomecli: TEdit;
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
    Label9: TLabel;
    Label27: TLabel;
    Label41: TLabel;
    Label63: TLabel;
    EdtNomePro: TEdit;
    EdtQuant: TCurrencyEdit;
    EdtValorUnit: TCurrencyEdit;
    EdtTotalProd: TCurrencyEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    DBGrid1: TDBGrid;
    EdtEstoque: TCurrencyEdit;
    EdtAliqICMS: TCurrencyEdit;
    EdtAliqIPI: TCurrencyEdit;
    EdtBCR: TCurrencyEdit;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    ToolButton1: TToolButton;
    BtnFinaliza: TToolButton;
    ImageList: TImageList;
    DSQBuscaItens: TDataSource;
    EdtCodBarraPro: TEdit;
    EdtCodigo: TEdit;
    EdtCodcLI: TEdit;
    edtCod: TEdit;
    btFiltro: TButton;
    tagn: TEdit;
    edtCodGrp: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkPropertyToFieldValue: TLinkPropertyToField;
    EdtCodPro: TSpinEdit;
    QBuscaItens: TFDQuery;
    QBuscaItensCOD_ITENS_OUTRA: TIntegerField;
    QBuscaItensCOD_OUTRA: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TBCDField;
    QBuscaItensVALOR_CUSTO: TBCDField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensVALOR_ITEM: TBCDField;
    QBuscaItensCOD_GRP: TIntegerField;
    QBuscaItensVALOR_TOTAL_ITEM: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    Q_TOTAL: TFDQuery;
    Q_TOTALTOTAL: TBCDField;
    QProd: TFDQuery;
    QProdCOD_PRO: TIntegerField;
    QProdNOME_PRO: TStringField;
    QProdPRECO_VAREJO: TBCDField;
    QProdQUANT_ESTOQ: TBCDField;
    QProdCOD_GRUP: TIntegerField;
    QProdCODIGO_BARRA_PRO: TStringField;
    QCli: TFDQuery;
    QCliCOD_CLI: TIntegerField;
    QCliNOME_CLI: TStringField;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCODIGO: TIntegerField;
    Q_ESTOQUE: TFDQuery;
    QPesqEstoque: TFDQuery;
    QPesqEstoqueCOD_PRO: TIntegerField;
    QPesqEstoqueNOME_PRO: TStringField;
    QPesqEstoqueQUANT_ESTOQ: TBCDField;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtQuantChange(Sender: TObject);
    procedure EdtQuantExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure BtnAddCliClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure EdtCodBarraProChange(Sender: TObject);
    procedure EdtCodcLIChange(Sender: TObject);
    procedure EdtQuantEnter(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure LimpaItens;
    procedure FormShow(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure EdtCodcLIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure atualiza_valor_nota(valor: Double);
  end;

var
  FrmOutrasSaidas: TFrmOutrasSaidas;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UFrmConsProduto, UFrmProdutos, UClientes,
  UFrmConsClientes, UFrmConsOutrasSaidas;

procedure TFrmOutrasSaidas.atualiza_valor_nota(valor: Double);
begin
  with DmDados.Q_executa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE');
    SQL.Add('   OUTRAS_SAIDAS');
    SQL.Add(' SET');
    SQL.Add('   TOTAL_OUTRA  = :vl');
    SQL.Add(' WHERE');
    SQL.Add('   COD_OUTRA = :cod');
    Parambyname('vl').Value     := valor;
    Parambyname('cod').AsInteger     := strtoint(EdtCodigo.Text);
    ExecSQL;

    // DmDados.IBTransaction1.CommitRetaining;
  end;
end;

procedure TFrmOutrasSaidas.Botoes(acao: string);
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
                Limpaedit(FrmOutrasSaidas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmOutrasSaidas);
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

procedure TFrmOutrasSaidas.btFiltroClick(Sender: TObject);
begin
  tagn.Text := '0';
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_Outras_Saidas do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_OUTRA = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;

    //DtVencto.Text := DmDados.tb_entradasDATA_VENCTO.AsString;

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

    EdtTotal.Value := Q_TOTALTOTAL.Value;

    BtnAlterarClick(Self);
  end
  else
  begin
    DmDados.tb_Outras_Saidas.Close;
  end;
end;

procedure TFrmOutrasSaidas.BtnAddCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmClientes,FrmClientes);
  FrmClientes.Tag := 0;
  FrmClientes.Showmodal;
  FrmClientes.Hide;
  FrmClientes.Free;
end;

procedure TFrmOutrasSaidas.BtnAddProClick(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutos,FrmProdutos);
  FrmProdutos.Showmodal;
  FrmProdutos.Hide;
  FrmProdutos.Free;
end;

procedure TFrmOutrasSaidas.BtnAlterarClick(Sender: TObject);
begin
  FrmOutrasSaidas.tag := 1;
  panel3.Enabled     := true;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmOutrasSaidas.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
  panel3.Enabled:= false;
  panel4.Enabled:= false;
  DmDados.tb_Outras_Saidas.Close;
  QBuscaItens.Close;
end;

procedure TFrmOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClientes,FrmConsClientes);
  FrmConsClientes.Tag := 1;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;
end;

procedure TFrmOutrasSaidas.BtnConsProClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProduto,FrmConsProduto);
  FrmConsProduto.Tag := 2;
  FrmConsProduto.Showmodal;
  FrmConsProduto.Hide;
  FrmConsProduto.Free;
end;

procedure TFrmOutrasSaidas.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOutrasSaidas,FrmConsOutrasSaidas);
  FrmConsOutrasSaidas.tag := 0;
  FrmConsOutrasSaidas.Showmodal;
  FrmConsOutrasSaidas.Hide;
  FrmConsOutrasSaidas.Free;
end;

procedure TFrmOutrasSaidas.BtnExcluiClick(Sender: TObject);
begin
    if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        try
          try
            with DmDados.Q_executa do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_OUTRAS_SAIDAS ' +
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
                   ParamByName('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value + QBuscaItensQUANT_ITEM.Value;
                   ParamByName('cod').Value := QBuscaItensCOD_PRO.Value;
                   ExecSQL;
                 end;
               end;

            // DmDados.IBTransaction1.CommitRetaining;
          except
            // DmDados.IBTransaction1.RollbackRetaining;
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

procedure TFrmOutrasSaidas.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('OUTRAS_SAIDAS', 'COD_OUTRA', EdtCodigo.Text)) then
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
           ParamByName('qtd').Value := QPesqEstoqueQUANT_ESTOQ.Value + QBuscaItensQUANT_ITEM.Value;
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

       // DmDados.IBTransaction1.CommitRetaining;

     except
       // DmDados.IBTransaction1.RollbackRetaining;
     end;

    panel3.Enabled:= false;
    panel4.Enabled:= false;
    Botoes('E');
   end;
end;

procedure TFrmOutrasSaidas.BtnGravaClick(Sender: TObject);
begin
  if trim(EdtCodPro.Text) = '' then
     begin
        EdtCodBarraPro.SetFocus;
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

  {if trim(EdtCodGRP.Text) = '' then
     begin
        EdtCodGRP.SetFocus;
        showmessage('Grupo de ICMS Inválido');
        exit;
     end;}

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (tagn.Text = '0') then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO ITENS_OUTRAS_SAIDAS(COD_OUTRA,COD_PRO,COD_EMP,QUANT_ITEM,ORDEM,CANCELADO,VALOR_ITEM,VALOR_TOTAL_ITEM,COD_GRP) ' +
                         'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   ITENS_OUTRAS_SAIDAS');
                 sql.Add(' SET');
                 sql.Add('   COD_OUTRA  = :2,');
                 sql.Add('   COD_PRO  = :3,');
                 sql.Add('   COD_EMP   = :4,');
                 sql.Add('   QUANT_ITEM   = :5,');
                 sql.Add('   ORDEM  = :6,');
                 sql.Add('   CANCELADO   = :7,');
                 sql.Add('   VALOR_ITEM  = :8,');
                 sql.Add('   VALOR_TOTAL_ITEM  = :9,');
                 sql.Add('   COD_GRP   = :10');
                 sql.Add(' WHERE');
                 sql.Add('   COD_ITENS_OUTRA = :1');
                         Parambyname('1').AsInteger     := QBuscaItensCOD_ITENS_OUTRA.Value;

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

           if (tagn.Text = '0') then // Grava um novo reristro
           begin
              Parambyname('6').value   := QOrdemORDEM.Value + 1;
           end
           else
           begin
              Parambyname('6').value   := QBuscaItensORDEM.Value;
           end;

           Parambyname('7').Value   := 0;
           Parambyname('8').value   := EdtValorUnit.Value;
           Parambyname('9').Value   := EdtTotalProd.Value;
           Parambyname('10').Value  := StrToInt(trim(edtCodGrp.Text));
           ExecSQL;
        end;

        with Q_ESTOQUE do
        begin
           Close;
           ParamByName('qtd').Value := EdtEstoque.Value - EdtQuant.Value;
           ParamByName('cod').Value := StrToInt(trim(EdtCodPro.Text));
           ExecSQL;
        end;

        // DmDados.IBTransaction1.CommitRetaining;
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
        // DmDados.IBTransaction1.RollbackRetaining;

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
    EdtCodBarraPro.SetFocus;
  end;

end;

procedure TFrmOutrasSaidas.BtnGravarClick(Sender: TObject);
begin
    if EdtCodcLI.Text = '' then
     begin
        ShowMessage('Digite o Código do Cliente');
        EdtCodcLI.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmOutrasSaidas.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO OUTRAS_SAIDAS(DATA_OUTRA, COD_TIPO, COD_CLI, COD_EMP, TOTAL_OUTRA, CANCELADA) ' +
                         'VALUES(:2, :3, :4, :5, :6, :7)');
                 //Parambyname('1').Value     := null;

              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   OUTRAS_SAIDAS');
                 sql.Add(' SET');
                 sql.Add('   DATA_OUTRA  = :2,');
                 sql.Add('   COD_TIPO  = :3,');
                 sql.Add('   COD_CLI  = :4,');
                 sql.Add('   COD_EMP  = :5,');
                 sql.Add('   TOTAL_OUTRA  = :6,');
                 sql.Add('   CANCELADA  = :7');
                 sql.Add(' WHERE');
                 sql.Add('   COD_OUTRA = :1');

                   Parambyname('1').AsInteger     := strtoint(EdtCodigo.Text);

              end;

           Parambyname('2').Value   := StrToDate(EdtData.Text);
           Parambyname('3').value   := 0;
           Parambyname('4').Value   := EdtCodcLI.Text;
           Parambyname('5').Value   := 1;
           Parambyname('6').value   := EdtTotal.Value;
           Parambyname('7').value   := 0;
           ExecSQL;
        end;

        // DmDados.IBTransaction1.CommitRetaining;
        Botoes('G');

        with Q_Consulta_cod do
        begin
          Close;
          //ParamByName('num').Value := EdtNunNota.Text;
          //ParamByName('cod').Value := EdtCodFor.Text;
          Open;
          FetchAll;
        end;

        if (Q_Consulta_cod.RecordCount > 0) then
        begin
          EdtCodigo.Text := Trim(Q_Consulta_codCODIGO.AsString);
        end;

        panel3.Enabled:= false;
        panel4.Enabled:= true;
        EdtCodBarraPro.SetFocus;

        if (panel4.Enabled = true) then
        begin
          EdtCodBarraPro.SetFocus;
        end;

      if (FrmOutrasSaidas.tag = 0) then // Grava um novo reristro
      begin
        //Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        //Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;

      BtnCancelar.Enabled := true;

    except
      on e: exception do
      begin
        // DmDados.IBTransaction1.RollbackRetaining;

        panel3.Enabled:= true;
        panel4.Enabled:= false;

        Application.MessageBox(Pchar('Erro ao dar saída no estoque!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmOutrasSaidas.BtnNovoClick(Sender: TObject);
begin
  tagn.Text := '0';
  FrmOutrasSaidas.tag := 0;
  DmDados.tb_Outras_Saidas.Close;
  QBuscaItens.Close;
  Botoes('N');
  panel3.Enabled     := true;
  panel4.Enabled     := false;
  EdtData.Text       := datetostr(date);
  EdtNomePro.Text := '';
  Edtdata.SetFocus;
end;

procedure TFrmOutrasSaidas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOutrasSaidas.DBGrid1DblClick(Sender: TObject);
begin
  tagn.Text := '1';

  EdtCodPro.Value := QBuscaItensCOD_PRO.Value;
  //EdtCodBarraPro.Text := QBuscaItensCOD_PRO.AsString;
  EdtNomePro.Text := QBuscaItensNOME_PRO.AsString;
  EdtCodBarraProChange(Self);
  EdtQuant.Value := QBuscaItensQUANT_ITEM.Value;
  EdtValorUnit.Value := QBuscaItensVALOR_ITEM.Value;

  EdtTotalProd.Value := QBuscaItensVALOR_TOTAL_ITEM.Value;
  EdtCodPro.SetFocus;
end;

procedure TFrmOutrasSaidas.EdtCodcLIChange(Sender: TObject);
begin
  if (EdtCodcLI.Text <> '') then
  begin
    with QCli do
    begin
      Close;
      ParamByName('cod').Value := EdtCodcLI.Text;
      Open;
      FetchAll;
    end;

    if (QCli.RecordCount > 0) then
    begin
      EdtNomecli.Text := QCliNOME_CLI.AsString;
    end
    else
    begin
      EdtNomecli.Text := 'NÃO ENCONTRADO';
    end;
  end;
end;

procedure TFrmOutrasSaidas.EdtCodcLIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if Application.MessageBox('Deseja confirmar a saída?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
      BtnGravarClick(Self);
     end;
  end;
end;

procedure TFrmOutrasSaidas.EdtCodBarraProChange(Sender: TObject);
begin
  if (EdtCodBarraPro.Text <> '') then
  begin
    with QProd do
    begin
      Close;
      ParamByName('cod').Value := EdtCodBarraPro.Text;
      Open;
      FetchAll;
    end;

    if (QProd.RecordCount > 0) then
    begin
      EdtNomePro.Text := QProdNOME_PRO.AsString;
      EdtEstoque.Value := QProdQUANT_ESTOQ.Value;
      EdtValorUnit.Value := QProdPRECO_VAREJO.Value;
      edtCodGrp.Text := QProdCOD_GRUP.AsString;
      EdtCodPro.text := QProdCOD_PRO.AsString;
    end
    else
    begin
      EdtNomePro.Text := 'NÃO ENCONTRADO';
      EdtEstoque.Value := 0;
      edtCodGrp.Text := '0';
      EdtValorUnit.Value := 0;
      EdtCodPro.Value := 0;
    end;
  end
  else
  begin
    EdtNomePro.Text := '';
    EdtEstoque.Value := 0;
    edtCodGrp.Text := '0';
    EdtValorUnit.Value := 0;
  end;
end;

procedure TFrmOutrasSaidas.EdtQuantChange(Sender: TObject);
begin
  if (EdtValorUnit.Value <> 0) then
  begin
    EdtTotalProd.Value := (EdtQuant.Value * EdtValorUnit.Value);
  end;
end;

procedure TFrmOutrasSaidas.EdtQuantEnter(Sender: TObject);
begin
  if (EdtQuant.Value <= 0) then
  begin
    EdtQuant.Value := 1;
  end;
end;

procedure TFrmOutrasSaidas.EdtQuantExit(Sender: TObject);
begin
  if (EdtValorUnit.Value <> 0) then
  begin
    EdtTotalProd.Value := (EdtQuant.Value * EdtValorUnit.Value);
  end;
end;

procedure TFrmOutrasSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmOutrasSaidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFrmOutrasSaidas.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
  tagn.Text := '0';
  //EdtData.Text := '';
  //EdtData.Text := DateToStr(Date);
  EdtData.SetFocus;
end;

procedure TFrmOutrasSaidas.LimpaItens;
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
