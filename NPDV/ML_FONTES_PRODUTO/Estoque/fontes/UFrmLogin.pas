unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrrmLogin = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edtusu: TEdit;
    Edtsenha: TEdit;
    BtnCancelar1: TButton;
    BtnOK1: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    procedure BtnOK1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtusuKeyPress(Sender: TObject; var Key: Char);
    procedure EdtsenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrrmLogin: TFrrmLogin;

implementation

{$R *.dfm}

Uses Udm, UPrincipal;

procedure TFrrmLogin.BtnCancelar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

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
              if (DmDados.QLoginOPERADOR_CAIXA.Value = 'N') then
              begin
                FrrmLogin.Tag := 1;
                FrmPrincipal.Caption := 'Estoque Master v1.0 - (Sistema de Gerenciamento de Estoque) - '+DmDados.QLoginNOME_USU.AsString;
                FrmPrincipal.SpCod_Usuario.Value := DmDados.QLoginCOD_USU.Value;
                FrrmLogin.Close;
              end
              else
              begin
                Application.MessageBox('Você precisa ser uma administrador para acessar este ambiente!!','Informação de login', MB_OK+MB_ICONWARNING);
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

procedure TFrrmLogin.EdtsenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrrmLogin.EdtusuKeyPress(Sender: TObject; var Key: Char);
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
begin
  FrrmLogin.Tag := 0;
end;

end.
