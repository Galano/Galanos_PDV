unit UEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFrmEmpresa = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    PC: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Image1: TImage;
    EdtNome: TEdit;
    EdtEnd: TEdit;
    EdtBai: TEdit;
    EdtCNPJ: TMaskEdit;
    EdtInsc: TEdit;
    EdtCid: TEdit;
    ComboEst: TComboBox;
    EdtCep: TMaskEdit;
    EdtResp: TEdit;
    EdtNumero: TEdit;
    EdtFant: TEdit;
    EdtTel: TEdit;
    EdtFax: TEdit;
    EdtInscMunicipal: TEdit;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    BtnLimpa: TBitBtn;
    BtnFoto: TBitBtn;
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
    OpenPicture: TOpenPictureDialog;
    OpenDialog: TOpenDialog;
    Edit1: TEdit;
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
    LinkControlToField14: TLinkControlToField;
    Bevel1: TBevel;
    ImgLogo: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFotoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaLogo;
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;
  CaminhoLogo : String;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm;

procedure TFrmEmpresa.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmEmpresa, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmEmpresa);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmEmpresa);
         EDedit(FrmEmpresa, false);
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

procedure TFrmEmpresa.BtnAlterarClick(Sender: TObject);
begin
  FrmEmpresa.tag := 1;
  Botoes('A');
  ImgLogo.Enabled := True;
  pc.ActivePageIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmEmpresa.BtnCancelarClick(Sender: TObject);
begin
  //ImgLogo.Visible       := false;
  OpenPicture.FileName:= '';
  Botoes('C');
end;

procedure TFrmEmpresa.BtnConsultarClick(Sender: TObject);
begin
  FrmEmpresa.Tag := 1;
  DmDados.tb_empresa.Open;
  CaminhoLogo := DmDados.tb_empresaCAMINHO_FOTO_EMP.Value;
  Edit1.Text := '1';
  BtnAlterarClick(Self);
  CarregaLogo;
end;

procedure TFrmEmpresa.BtnExcluirClick(Sender: TObject);
begin
  //excluir(FrmEmpresa, 'empresa', cod_emp, IBSQLEmp, IBTREmp);
  //ImgLogo.Visible        := false;
  OpenPicture.FileName := '';
  Botoes('E');
end;

procedure TFrmEmpresa.BtnFotoClick(Sender: TObject);
begin
  if (OpenPicture.Execute) then
  begin
    CaminhoLogo := OpenPicture.FileName;
    ImgLogo.Picture := nil;
    ImgLogo.Picture.LoadFromFile(OpenPicture.FileName);
  end;
end;

procedure TFrmEmpresa.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        showmessage('Digite o Nome a Razão Social da Empresa');
        edtnome.SetFocus;
        exit;
     end;

  {if DmDados.IBTransaction1.Active then
     DmDados.IBTransaction1.CommitRetaining;
  DmDados.IBTransaction1.StartTransaction;}
  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmEmpresa.tag = 0) then // Grava um novo reristro
              begin
                 //cod_emp.Text:= inttostr(prxcod('empresa', 'cod_emp', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO EMPRESA(RAZAO_EMP,END_EMP,BAI_EMP,CID_EMP,CEP_EMP,EST_EMP,INSC_EMP,TEL_EMP,FAX_EMP,NUMERO_EMP,RESP_EMP,CAMINHO_FOTO_EMP,' +
                         'FANTASIA_EMP,CNPJ_EMP,CAMINHO_VALIDADOR_SINTEGRA,INSCRICAO_MUNICIPAL) ' +
                         'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17) ');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   EMPRESA');
                 sql.Add(' SET');
                 sql.Add('   RAZAO_EMP = :2,');
                 sql.Add('   END_EMP = :3,');
                 sql.Add('   BAI_EMP = :4,');
                 sql.Add('   CID_EMP = :5,');
                 sql.Add('   CEP_EMP = :6,');
                 sql.Add('   EST_EMP = :7,');
                 sql.Add('   INSC_EMP = :8,');
                 sql.Add('   TEL_EMP = :9,');
                 sql.Add('   FAX_EMP = :10,');
                 sql.Add('   NUMERO_EMP = :11,');
                 sql.Add('   RESP_EMP = :12,');
                 sql.Add('   CAMINHO_FOTO_EMP = :13,');
                 sql.Add('   FANTASIA_EMP = :14,');
                 sql.Add('   CNPJ_EMP = :15,');
                 //sql.Add('   CAMINHO_VALIDADOR_SINTEGRA = :16,');
                 sql.Add('   INSCRICAO_MUNICIPAL = :17');
                 sql.Add(' WHERE');
                 sql.Add('   EMPRESA.COD_EMP = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString      := edtnome.Text;
           if edtend.Text = '' then
              Parambyname('3').Value      := null
           else
              Parambyname('3').AsString   := edtend.Text;
           if EdtNumero.Text = '' then
              Parambyname('11').Value     := null
           else
              Parambyname('11').AsString  := EdtNumero.Text;
           if edtbai.Text = '' then
              Parambyname('4').Value      := null
           else
              Parambyname('4').AsString   := edtbai.Text;
           if edtcid.Text = '' then
              Parambyname('5').Value      := null
           else
              Parambyname('5').AsString   := edtcid.Text;
           Parambyname('6').AsString      := edtcep.Text;
           Parambyname('7').AsString      := comboest.Text;
           Parambyname('8').AsString      := edtinsc.Text;
           Parambyname('9').AsString      := edttel.Text;
           Parambyname('10').AsString     := edtfax.Text;
           Parambyname('15').AsString     := edtcnpj.Text;

           if EdtResp.Text = '' then
              Parambyname('12').Value     := null
           else
              Parambyname('12').AsString  := EdtResp.Text;

           Parambyname('13').Value     := CaminhoLogo;

           {if Image.Visible then
              Parambyname('17').AsString  := OpenPicture.FileName
           else
              Parambyname('17').Value     := null;}

           if EdtFant.Text = '' then
              Parambyname('14').Value     := null
           else
              Parambyname('14').AsString  := EdtFant.Text;

           //Parambyname('16').AsString     := CaminhoLogo;
           Parambyname('17').AsString     := EdtInscMunicipal.Text;

           ExecSQL;
        end;
      DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');

      if (FrmEmpresa.tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;
    except
      DmDados.IBTransaction1.RollbackRetaining;
      showmessage('Erro ao Gravar a Empresa');
    end;
  finally
    DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;
  end;

end;

procedure TFrmEmpresa.BtnNovoClick(Sender: TObject);
begin
  FrmEmpresa.tag := 0;
  Botoes('N');
  comboest.ItemIndex:= 13;
  //ImgLogo.Visible          := false;
  OpenPicture.FileName   := '';
  edtnome.SetFocus;
end;

procedure TFrmEmpresa.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpresa.CarregaLogo;
begin
  if (DmDados.tb_empresaCAMINHO_FOTO_EMP.Value <> '') then
  begin
    ImgLogo.Visible := True;
    ImgLogo.Picture := nil;
    ImgLogo.Picture.LoadFromFile(DmDados.tb_empresaCAMINHO_FOTO_EMP.Value);
  end
  else
  begin
    ImgLogo.Picture := nil;
  end;
end;

procedure TFrmEmpresa.Edit1Change(Sender: TObject);
begin
  if (Tag = 1) then
  begin
    with DmDados.tb_empresa do
    begin
      Filtered := false;
      Filter   := 'COD_EMP = '+QuotedStr(Edit1.Text);
      Filtered := true;
    end;
    ComboEst.Text := DmDados.tb_empresaEST_EMP.Value;
  end;
end;

procedure TFrmEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmEmpresa.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
