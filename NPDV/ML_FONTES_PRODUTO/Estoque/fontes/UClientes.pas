unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, RxToolEdit, RxCurrEdit,
  Vcl.Mask, Vcl.Buttons, Vcl.Imaging.pngimage, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Data.Bind.Controls, Vcl.Bind.Navigator, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMeuComponente = class(TControl)
  public
    property Color;
  end;

type
  TFrmClientes = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnConsCla: TSpeedButton;
    Label5: TLabel;
    Label33: TLabel;
    BtnAddCla: TSpeedButton;
    Label43: TLabel;
    Label45: TLabel;
    EdtNome: TEdit;
    ComboFJ: TComboBox;
    EdtNomeCla: TEdit;
    PG: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label32: TLabel;
    EdtCNPJ: TMaskEdit;
    EdtDoc: TEdit;
    CheckImpSaldo: TCheckBox;
    CheckControlarLimite: TCheckBox;
    TabSheet5: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label35: TLabel;
    Label44: TLabel;
    Label57: TLabel;
    EdtEndRes: TEdit;
    EdtBaiRes: TEdit;
    EdtCidRes: TEdit;
    ComboEstRes: TComboBox;
    EdtCepRes: TMaskEdit;
    EdtPR: TEdit;
    EdtTelRes: TEdit;
    EdtCel: TEdit;
    EdtEmail: TEdit;
    TabSheet4: TTabSheet;
    Label30: TLabel;
    MemoObsCliente: TMemo;
    RDGAtivo: TRadioGroup;
    EdtDataCadastro: TDateTimePicker;
    EdtApelido: TEdit;
    EdtContato: TEdit;
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
    ImageList: TImageList;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label27: TLabel;
    Label28: TLabel;
    Label37: TLabel;
    Label34: TLabel;
    EdtRenda: TCurrencyEdit;
    EdtLimiteCredito: TCurrencyEdit;
    EdtLimiteDisponivel: TCurrencyEdit;
    EdtAtrazoMaximo: TEdit;
    BindingsList1: TBindingsList;
    edtCod: TEdit;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkPropertyToFieldValue: TLinkPropertyToField;
    LinkPropertyToFieldValue2: TLinkPropertyToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField13: TLinkControlToField;
    LinkControlToField14: TLinkControlToField;
    LinkControlToField15: TLinkControlToField;
    LinkControlToField16: TLinkControlToField;
    LinkControlToField17: TLinkControlToField;
    btnFiltro: TButton;
    EdtNasc: TDateEdit;
    LinkPropertyToFieldDate: TLinkPropertyToField;
    Q_Consulta_classif: TFDQuery;
    Q_Consulta_classifNOME_CLA: TStringField;
    Q_Consulta_classifCOD_CLA: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FocoAlterado(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAddClaClick(Sender: TObject);
    procedure BtnConsClaClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Componente: TWinControl;
    CorAnterior: TColor;
  end;

  const
  CorSemFoco = clWindow;
  CorComFoco = clYellow;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFuncoes, UFrmClassificaCliente, UFrmConsClassifica,
  UFrmConsClientes, UFrmConsClientes01;

procedure TFrmClientes.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmClientes, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmClientes);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmClientes);
         EDedit(FrmClientes, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmClientes.BtnAddClaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmClassificaCliente,FrmClassificaCliente);
  FrmClassificaCliente.Tag := 0;
  FrmClassificaCliente.Showmodal;
  FrmClassificaCliente.Hide;
  FrmClassificaCliente.Free;
end;

procedure TFrmClientes.BtnAlterarClick(Sender: TObject);
begin
  FrmClientes.tag := 1;
  Botoes('A');
  EdtNasc.Enabled := True;
  edtnome.SetFocus;
end;

procedure TFrmClientes.BtnCancelarClick(Sender: TObject);
begin
  DmDados.tb_clientes.Open;
  Botoes('C');
  EdtNasc.Enabled := false;
end;

procedure TFrmClientes.BtnConsClaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClassifica,FrmConsClassifica);
  FrmConsClassifica.Tag := 1;
  DmDados.tb_classifica_cliente.Open;
  FrmConsClassifica.Showmodal;
  FrmConsClassifica.Hide;
  FrmConsClassifica.Free;
end;

procedure TFrmClientes.BtnConsultarClick(Sender: TObject);
var
  nome : String;
begin
  Application.CreateForm(TFrmConsClientes,FrmConsClientes);
  FrmConsClientes.Tag := 0;
  //FrmConsClientes.ComboCons.SetFocus;
  nome:= Screen.ActiveControl.Name;
  //ShowMessage(nome);
  FrmConsClientes.Visible := false;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;
end;

procedure TFrmClientes.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('CLIENTE', 'COD_CLI', Edit1.Text)) then
  begin
    Botoes('E');
    EdtNasc.Enabled := false;
  end;
end;

procedure TFrmClientes.BtnGravarClick(Sender: TObject);
var
  update_data : String;
begin
    if trim(edtnome.Text) = '' then
     begin
        showmessage('Digite o Nome do cliente');
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmClientes.tag = 0) then // Grava um novo reristro
              begin

                 sql.Add('INSERT INTO CLIENTE(NOME_CLI,COD_CLA,ENDRES_CLI,BAIRES_CLI,CIDRES_CLI,ESTRES_CLI,CEPRES_CLI,TELRES_CLI,CPF_CLI,RG_CLI,APELIDO_CLI,LIMITE_CLI,' +
                         'ATIVO_CLI,OBS_CLI,NASCIMENTO_CLI,DATACADASTRO_CLI,ATRAZO_MAXIMO_CLI,CELULAR_CLI,IMP_SALDO_PENDENTE_CLI,LIMITE_CHEQUE,CONTATO_CLI,CONTROLAR_LIMITE,EMAIL_CLI)' +
                         'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17,:18,:19,:20,:21,:22,:23,:24)');
              end
           else
              begin
                if (EdtNasc.Text = '  /  /    ') then
                 begin
                  update_data := 'NASCIMENTO_CLI = null';
                 end
                 else
                 begin
                  update_data  := 'NASCIMENTO_CLI = '+EdtNasc.Text;
                 end;

                 sql.Add('UPDATE');
                 sql.Add('   CLIENTE');
                 sql.Add(' SET');
                 sql.Add('   NOME_CLI = :2,');
                 sql.Add('   COD_CLA = :3,');
                 sql.Add('   ENDRES_CLI = :4,');
                 sql.Add('   BAIRES_CLI = :5,');
                 sql.Add('   CIDRES_CLI = :6,');
                 sql.Add('   ESTRES_CLI = :7,');
                 sql.Add('   CEPRES_CLI = :8,');
                 sql.Add('   TELRES_CLI = :9,');
                 sql.Add('   CPF_CLI = :10,');
                 sql.Add('   RG_CLI = :11,');
                 sql.Add('   APELIDO_CLI = :12,');
                 sql.Add('   LIMITE_CLI = :13,');
                 sql.Add('   ATIVO_CLI = :14,');
                 sql.Add('   OBS_CLI = :15,');
                 sql.Add('   NASCIMENTO_CLI = :16,');
                 sql.Add('   DATACADASTRO_CLI = :17,');
                 sql.Add('   ATRAZO_MAXIMO_CLI = :18,');
                 sql.Add('   CELULAR_CLI = :19,');
                 sql.Add('   IMP_SALDO_PENDENTE_CLI = :20,');
                 sql.Add('   LIMITE_CHEQUE = :21,');
                 sql.Add('   CONTATO_CLI = :22,');
                 sql.Add('   CONTROLAR_LIMITE = :23,');
                 sql.Add('   EMAIL_CLI = :24');
                 sql.Add(' WHERE');
                 sql.Add('   CLIENTE.COD_CLI = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;
           Parambyname('3').Value      := Edit2.Text;
           Parambyname('4').Value      := EdtEndRes.Text;
           Parambyname('5').Value      := EdtBaiRes.Text;
           Parambyname('6').AsString   := EdtCidRes.Text;
           Parambyname('7').AsString   := ComboEstRes.Text;
           Parambyname('8').AsString   := EdtCepRes.Text;
           Parambyname('9').AsString   := EdtTelRes.Text;
           Parambyname('10').AsString  := EdtCNPJ.Text;
           Parambyname('11').AsString  := EdtDoc.Text;
           Parambyname('12').AsString  := EdtApelido.Text;
           Parambyname('13').Value  := EdtLimiteCredito.Value;

           if (RDGAtivo.ItemIndex = 0) then
           begin
            Parambyname('14').AsString  := 'S';
           end
           else
           begin
            Parambyname('14').AsString  := 'N';
           end;

           Parambyname('15').AsString  := MemoObsCliente.Text;


           //Parambyname('16').AsString  := EdtNasc.Text;

           if (EdtNasc.Text = '  /  /    ') then
           begin
            Parambyname('16').AsString := '';
           end
           else
           begin
            Parambyname('16').AsDate  := EdtNasc.Date;
           end;

           Parambyname('17').AsString  := DateToStr(EdtDataCadastro.Date);
           Parambyname('18').AsString  := EdtAtrazoMaximo.Text;
           Parambyname('19').AsString  := EdtCel.Text;
           if (CheckImpSaldo.Checked) then
           begin
            Parambyname('20').AsString  := 'S';
           end
           else
           begin
            Parambyname('20').AsString  := 'N';
           end;
           Parambyname('21').Value  := EdtLimiteDisponivel.Value;
           Parambyname('22').AsString  := EdtContato.Text;

           if (CheckControlarLimite.Checked) then
           begin
            Parambyname('23').AsString  := 'S';
           end
           else
           begin
            Parambyname('23').AsString  := 'N';
           end;

           Parambyname('24').AsString  := EdtEmail.Text;

           ExecSQL;
        end;
      //DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');
      EdtNasc.Enabled := false;

      if (FrmClientes.tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;
    except
      on e: exception do
      begin
        //DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Cliente!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmClientes.BtnNovoClick(Sender: TObject);
begin
  FrmClientes.tag := 0;
  Botoes('N');
  EdtNasc.Enabled := True;
  DmDados.tb_clientes.Close;
  edtnome.SetFocus;
end;

procedure TFrmClientes.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmClientes.btnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_clientes do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_CLI = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
      ComboFJ.ItemIndex := 0;
      if (DmDados.tb_clientesATIVO_CLI.Value  = 'S') then
      begin
        RDGAtivo.ItemIndex := 0;
      end
      else
      begin
        RDGAtivo.ItemIndex := 1;
      end;

      if (DmDados.tb_clientesIMP_SALDO_PENDENTE_CLI.Value  = 'S') then
      begin
        CheckImpSaldo.Checked := true;
      end
      else
      begin
        CheckImpSaldo.Checked := false;
      end;

      if (DmDados.tb_clientesCONTROLAR_LIMITE.Value  = 'S') then
      begin
        CheckControlarLimite.Checked := true;
      end
      else
      begin
        CheckControlarLimite.Checked := false;
      end;

      ComboEstRes.Text := DmDados.tb_clientesESTRES_CLI.Value;
    end;
  end
  else
  begin
    DmDados.tb_clientes.Close;
  end;
end;

procedure TFrmClientes.Edit1Change(Sender: TObject);
begin
  {if (Edit1.Text <> '') then
  begin
    with DmDados.tb_clientes do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_CLI = ' + QuotedStr(trim(Edit1.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_clientes.Close;
  end;}
end;

procedure TFrmClientes.Edit2Change(Sender: TObject);
begin
  if (Edit2.Text <> '') then
  begin
    with Q_Consulta_classif do
    begin
      Close;
      ParamByName('cod').Value := trim(Edit2.Text);
      Open;
      FetchAll;
    end;

    if (Q_Consulta_classif.RecordCount > 0) then
    begin
      EdtNomeCla.Text := Q_Consulta_classifNOME_CLA.AsString;
    end;

  end;
end;

procedure TFrmClientes.FocoAlterado(Sender: TObject);
begin
  if Componente <> nil then
    try
      // TMeuComponente(Componente).Color := CorSemFoco;
      TMeuComponente(Componente).Color := CorAnterior;
    except
    end;

  if Screen.ActiveForm.ActiveControl is TWinControl then
    try
        CorAnterior := TMeuComponente(Screen.ActiveForm.ActiveControl).Color;
        TMeuComponente(Screen.ActiveForm.ActiveControl).Color := CorComFoco;
        Componente := Screen.ActiveForm.ActiveControl;
    except
    end;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  //Screen.OnActiveControlChange := FocoAlterado;
end;

procedure TFrmClientes.FormDestroy(Sender: TObject);
begin
  //Screen.OnActiveControlChange := nil;
end;

procedure TFrmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
  ComboFJ.ItemIndex := 0;
  if (EdtDataCadastro.Date <> null) then
  begin
    EdtDataCadastro.Date := Date;
  end;
end;

end.
