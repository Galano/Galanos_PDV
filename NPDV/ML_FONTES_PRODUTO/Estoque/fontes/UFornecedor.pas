unit UFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmFornecedor = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label53: TLabel;
    Label57: TLabel;
    Image1: TImage;
    EdtNome: TEdit;
    EdtEnd: TEdit;
    EdtBai: TEdit;
    EdtCNPJ: TMaskEdit;
    EdtInsc: TEdit;
    EdtCep: TMaskEdit;
    ComboEst: TComboBox;
    EdtCid: TEdit;
    EdtContato: TEdit;
    ComboFJ: TComboBox;
    EdtTel: TEdit;
    EdtFax: TEdit;
    EdtNum: TEdit;
    EdtEmail: TEdit;
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
    edtCod: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField13: TLinkControlToField;
    btFiltro: TButton;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCOD_FOR: TIntegerField;
    Q_Consulta_codFJ_FOR: TStringField;
    Q_Consulta_codRAZAO_FOR: TStringField;
    Q_Consulta_codEND_FOR: TStringField;
    Q_Consulta_codBAI_FOR: TStringField;
    Q_Consulta_codCID_FOR: TStringField;
    Q_Consulta_codCEP_FOR: TStringField;
    Q_Consulta_codEST_FOR: TStringField;
    Q_Consulta_codCNPJ_FOR: TStringField;
    Q_Consulta_codINSC_FOR: TStringField;
    Q_Consulta_codTEL_FOR: TStringField;
    Q_Consulta_codFAX_FOR: TStringField;
    Q_Consulta_codCONTATO_FOR: TStringField;
    Q_Consulta_codNUM_FOR: TStringField;
    Q_Consulta_codCODIGO_IBGE: TIntegerField;
    Q_Consulta_codEMAIL_FOR: TStringField;
    Q_Consulta_filtro: TFDQuery;
    Q_Consulta_filtroCOD_FOR: TIntegerField;
    Q_Consulta_filtroFJ_FOR: TStringField;
    Q_Consulta_filtroRAZAO_FOR: TStringField;
    Q_Consulta_filtroEND_FOR: TStringField;
    Q_Consulta_filtroBAI_FOR: TStringField;
    Q_Consulta_filtroCID_FOR: TStringField;
    Q_Consulta_filtroCEP_FOR: TStringField;
    Q_Consulta_filtroEST_FOR: TStringField;
    Q_Consulta_filtroCNPJ_FOR: TStringField;
    Q_Consulta_filtroINSC_FOR: TStringField;
    Q_Consulta_filtroTEL_FOR: TStringField;
    Q_Consulta_filtroFAX_FOR: TStringField;
    Q_Consulta_filtroCONTATO_FOR: TStringField;
    Q_Consulta_filtroNUM_FOR: TStringField;
    Q_Consulta_filtroCODIGO_IBGE: TIntegerField;
    Q_Consulta_filtroEMAIL_FOR: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsFornecedor;

procedure TFrmFornecedor.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmFornecedor, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmFornecedor);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmFornecedor);
         EDedit(FrmFornecedor, false);
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

procedure TFrmFornecedor.BtnAlterarClick(Sender: TObject);
begin
  FrmFornecedor.tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmFornecedor.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmFornecedor.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Tag := 0;
  FrmConsFornecedor.Showmodal;
  FrmConsFornecedor.Hide;
  FrmConsFornecedor.Free;
end;

procedure TFrmFornecedor.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('FORNECEDOR', 'COD_FOR', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmFornecedor.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome a Razão Social do Fornecedor!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmFornecedor.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO FORNECEDOR(FJ_FOR,RAZAO_FOR,END_FOR,BAI_FOR,CID_FOR,CEP_FOR,EST_FOR,CNPJ_FOR,INSC_FOR,TEL_FOR,FAX_FOR,CONTATO_FOR,NUM_FOR,CODIGO_IBGE,EMAIL_FOR)' +
                         'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   FORNECEDOR');
                 sql.Add(' SET');
                 sql.Add('   FJ_FOR  = :2,');
                 sql.Add('   RAZAO_FOR  = :3,');
                 sql.Add('   END_FOR  = :4,');
                 sql.Add('   BAI_FOR  = :5,');
                 sql.Add('   CID_FOR  = :6,');
                 sql.Add('   CEP_FOR  = :7,');
                 sql.Add('   EST_FOR  = :8,');
                 sql.Add('   CNPJ_FOR  = :9,');
                 sql.Add('   INSC_FOR  = :10,');
                 sql.Add('   TEL_FOR  = :11,');
                 sql.Add('   FAX_FOR  = :12,');
                 sql.Add('   CONTATO_FOR  = :13,');
                 sql.Add('   NUM_FOR  = :14,');
                 sql.Add('   EMAIL_FOR  = :16');
                 sql.Add(' WHERE');
                 sql.Add('   FORNECEDOR.COD_FOR = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := Copy(ComboFJ.Text,1,1);
           Parambyname('3').AsString   := EdtNome.Text;
           Parambyname('4').Value      := edtend.Text;
           Parambyname('5').Value      := EdtBai.Text;
           Parambyname('6').AsString   := EdtCid.Text;
           Parambyname('7').AsString   := EdtCep.Text;
           Parambyname('8').AsString   := ComboEst.Text;
           Parambyname('9').AsString   := EdtCNPJ.Text;
           Parambyname('10').AsString  := EdtInsc.Text;
           Parambyname('11').AsString  := EdtTel.Text;
           Parambyname('12').AsString  := EdtFax.Text;
           Parambyname('13').AsString  := EdtContato.Text;
           Parambyname('14').AsString  := EdtNum.Text;
           Parambyname('16').AsString  := EdtEmail.Text;

           ExecSQL;
        end;

        //// DmDados.IBTransaction1.CommitRetaining;
        Botoes('G');

        with Q_Consulta_cod do
        begin
          Close;
          ParamByName('nm').Value := EdtNome.Text;
          Open;
        end;

        if (Q_Consulta_cod.RecordCount > 0) then
        begin
          Edit1.Text := Trim(Q_Consulta_codCOD_FOR.AsString);
        end;

      if (FrmFornecedor.tag = 0) then // Grava um novo reristro
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
        //// DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Fornecedor!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmFornecedor.BtnNovoClick(Sender: TObject);
begin
  FrmFornecedor.tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFornecedor.btFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_fornecedor do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_FOR = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_fornecedor.Close;
  end;
end;

procedure TFrmFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmFornecedor.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
