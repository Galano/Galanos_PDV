unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage,  DB, IBCustomDataSet, IBQuery, Udm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ShellAPI;

type
  TFrrmLogin = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Edtusu: TEdit;
    Label2: TLabel;
    Edtsenha: TEdit;
    BtnOK1: TButton;
    BtnCancelar1: TButton;
    Panel3: TPanel;
    lblVersao: TLabel;
    Caixa: TFDQuery;
    CaixaCOD_CAIXA: TIntegerField;
    CaixaCOD_USU: TIntegerField;
    CaixaDATA_ABERTURA: TDateField;
    CaixaHORA_ABERTURA: TTimeField;
    CaixaVL_ABERTURA: TBCDField;
    CaixaVL_FECHAMENTO: TBCDField;
    CaixaVL_VENDAS: TBCDField;
    CaixaRETIRADAS: TBCDField;
    CaixaSALDO: TBCDField;
    CaixaDATA_FECHAMENTO: TDateField;
    CaixaHORA_FECHAMENTO: TTimeField;
    CaixaSTATUS: TStringField;

    procedure BtnOK1Click(Sender: TObject);
    procedure BtnCancelar1Click(Sender: TObject);
    procedure EdtusuKeyPress(Sender: TObject; var Key: Char);
    procedure EdtsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure VerificaCaixa(Cod_usu : Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrrmLogin: TFrrmLogin;

implementation

uses UVendas, UFrmAberturaCaixa;

{$R *.dfm}

procedure TFrrmLogin.BtnOK1Click(Sender: TObject);
begin
  try
     try
       with DmDados.QLogin do
          begin
             close;
             sql.Clear;
             sql.add('SELECT * FROM USUARIO WHERE NOME_USU = :nm AND SENHA_USU = :pass');
             ParamByName('nm').Value := trim(Edtusu.Text);
             ParamByName('pass').Value := trim(Edtsenha.Text);
             Open;
             FetchAll;

             if (DmDados.QLogin.RecordCount > 0) then
             begin
              if (DmDados.QLoginOPERADOR_CAIXA.Value = 'S') then
              begin
                DmDados.Usuario_Empresa := DmDados.QLoginEMPRESA.AsInteger;
                FrrmLogin.Tag := 1;
                FrmVendas.Label5.Caption := DmDados.QLoginNOME_USU.AsString;
                FrmVendas.Caption := 'Estoque Master - Ponto de Vendas - '+DmDados.QLoginNOME_USU.AsString;
                FrmVendas.Caption := FrmVendas.Caption + ' => '+ DmDados.conexao.Params[0];

                FrmVendas.SpCod_Usuario.Value := DmDados.QLoginCOD_USU.Value;
                FrrmLogin.Close;
                VerificaCaixa(FrmVendas.SpCod_Usuario.Value);


                if  Edtusu.Text <> DmDados.Login_Padrao then
                begin
                  DmDados.Login_Padrao := Edtusu.Text;
                  DmDados.SalvarLogin_Padrao;
                end;


              end
              else
              begin
                Application.MessageBox('Você precisa ser um caixa para acessar este ambiente!!','Informação de login', MB_OK+MB_ICONWARNING);
                Edtusu.SetFocus;
              end;
             end
             else
             begin
              Application.MessageBox('Login ou senha inválido, tente nomamente!','Erro de login', MB_OK+MB_ICONERROR);
              Edtusu.SetFocus;
             end;
          end;
     except
       Application.MessageBox('Login ou senha inválido, tente nomamente!','Erro de login', MB_OK+MB_ICONERROR);
       Edtusu.SetFocus;
     end;
   finally
   end;
end;

procedure TFrrmLogin.BtnCancelar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrrmLogin.EdtusuKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrrmLogin.EdtsenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FrrmLogin.Tag = 1) then
  begin
    Close;
  end
  else
  begin
    Abort;
  end;
end;

procedure TFrrmLogin.FormCreate(Sender: TObject);
var
    Executavel_Original,Executavel_Atualizado: String;
begin

Try
  DmDados.qryVerificarVersao.Close;
  DmDados.qryVerificarVersao.Open;
  Executavel_Original   := ExtractFilePath(ParamStr(0))+'PDV.exe';
  Executavel_Atualizado := ExtractFilePath(ParamStr(0))+'PDV2.exe';

  if  (DmDados.qryVerificarVersao.RecordCount >0 ) AND (DmDados.VersaoExe <> DmDados.qryVerificarVersaoVERSAO.AsString) then
  begin
    ShowMessage('Aguarde, sistema será atualizado!');
    DmDados.qryBaixarVersao.Close;
    DmDados.qryBaixarVersao.Params.ParamByName('VERSAO_SISTEMA').AsInteger := DmDados.qryVerificarVersaoVERSAO_SISTEMA.AsInteger;
    DmDados.qryBaixarVersao.Open;
    DmDados.qryBaixarVersaoEXECUTAVEL.SaveToFile( Executavel_Atualizado  );

    ShellExecute(handle,'open',Pchar( Executavel_Atualizado) , '','',SW_SHOWNORMAL);
    Application.Terminate;
  end;
  DmDados.qryVerificarVersao.Close;
except on e:exception do begin
   ShowMessage(e.message);
end;

end;


try
   if ExtractFileName(ParamStr(0))='PDV2.exe' then
   begin
     Sleep(2000);
     ShellExecute(Self.Handle,'open',PChar('cmd.exe taskkill /IM pdv.exe /F /T'),nil,nil,SW_SHOWNORMAL);
     Sleep(2000);

     ShellExecute(Self.Handle,'open',PChar('cmd.exe taskkill /IM pdv.exe /F /T'),nil,nil,SW_SHOWNORMAL);
     CopyFile( PChar( Executavel_Atualizado ) , PChar( Executavel_Original ) , false);
     ShowMessage('Sistema Atualizado!');
     Application.Terminate;
   end;
except on e:exception do
begin
     ShowMessage('Sistema não foi Atualizado!!! Ligue para o Bruno!');
     Application.Terminate;
end;

end;


lblVersao.Caption := DmDados.VersaoExe ;

end;

procedure TFrrmLogin.FormShow(Sender: TObject);
begin
  FrrmLogin.Tag := 0;
  Edtusu.Text := DmDados.Login_Padrao;
end;

procedure TFrrmLogin.VerificaCaixa(Cod_usu: Integer);
begin
 //
  with Caixa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from CAIXA where cod_usu = :cod and data_abertura = :dt and empresa = :empresa ');
    ParamByName('cod').Value := Cod_usu;
    ParamByName('dt').Value := Date;
    ParamByName('empresa').Value :=  DmDados.Usuario_Empresa;
    Open;
    FetchAll;
  end;

   if (Caixa.RecordCount > 0) then
  begin
    Close;
  end
  else
  begin
    if application.MessageBox('Seu caixa aina não foi aberto hoje deseja abrir?', 'Abertura de caixa', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
      begin
        Application.CreateForm(TFrmAbreCaixa,FrmAbreCaixa);
        FrmAbreCaixa.lbnome.Caption := Edtusu.Text;
        FrmAbreCaixa.lbcodigo.Caption := IntToStr(DmDados.QLoginCOD_USU.Value);
        FrmAbreCaixa.lbdata.Caption := DateToStr(Date);
        FrmAbreCaixa.lbhora.Caption := TimeToStr(Time);
        FrmAbreCaixa.Showmodal;
        FrmAbreCaixa.Hide;
        FrmAbreCaixa.free;
      end
      else
      begin
        Application.Terminate;
      end;
  end;

end;

end.
