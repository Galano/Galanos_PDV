unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Ani,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrrmLogin = class(TForm)
    Rectangle1: TRectangle;
    Label7: TLabel;
    ShadowEffect3: TShadowEffect;
    Label3: TLabel;
    rectCodB: TRectangle;
    Edtusu: TEdit;
    Label1: TLabel;
    Rectangle2: TRectangle;
    edtSenha: TEdit;
    imglogoTopo: TImage;
    Label2: TLabel;
    btn_entrar: TRectangle;
    ColorAnimation1: TColorAnimation;
    Label4: TLabel;
    btn_cadastro: TRectangle;
    Label8: TLabel;
    ColorAnimation2: TColorAnimation;
    Caixa: TIBQuery;
    CaixaCOD_CAIXA: TIntegerField;
    CaixaCOD_USU: TIntegerField;
    CaixaDATA_ABERTURA: TDateField;
    CaixaHORA_ABERTURA: TTimeField;
    CaixaVL_ABERTURA: TIBBCDField;
    CaixaVL_FECHAMENTO: TIBBCDField;
    CaixaVL_VENDAS: TIBBCDField;
    CaixaRETIRADAS: TIBBCDField;
    CaixaSALDO: TIBBCDField;
    CaixaDATA_FECHAMENTO: TDateField;
    CaixaHORA_FECHAMENTO: TTimeField;
    CaixaSTATUS: TIBStringField;
    IBQuery1: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    IBBCDField1: TIBBCDField;
    IBBCDField2: TIBBCDField;
    IBBCDField3: TIBBCDField;
    IBBCDField4: TIBBCDField;
    IBBCDField5: TIBBCDField;
    DateField2: TDateField;
    TimeField2: TTimeField;
    IBStringField1: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure EdtusuKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btn_cadastroClick(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
    procedure VerificaCaixa(Cod_usu : Integer);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrrmLogin: TFrrmLogin;

implementation

{$R *.fmx}

Uses Udm, UVendas, UFrmAberturaCaixa;

procedure TFrrmLogin.btn_cadastroClick(Sender: TObject);
begin
  {$IFDEF WIN32}
    Application.Terminate;
  {$ENDIF}
end;

procedure TFrrmLogin.btn_entrarClick(Sender: TObject);
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
                FrrmLogin.Tag := 1;
                FrmVendas.Label1.Text := 'Atendente: '+DmDados.QLoginNOME_USU.AsString;
                FrmVendas.lbTitulo.Text := 'PDV Master - ['+DmDados.tb_empresaFANTASIA_EMP.AsString+'] - Suporte / Vendas  91 98370-1229';
                FrmVendas.SpCod_Usuario.Text := DmDados.QLoginCOD_USU.AsString;
                FrrmLogin.Close;
                VerificaCaixa(FrmVendas.SpCod_Usuario.Text.ToInteger());
              end
              else
              begin
                //Application.MessageBox('Você precisa ser um caixa para acessar este ambiente!!','Informação de login', MB_OK+MB_ICONWARNING);
                Edtusu.SetFocus;
              end;
             end
             else
             begin
              //Application.MessageBox('Login ou senha inválido, tente nomamente!','Erro de login', MB_OK+MB_ICONERROR);
              Edtusu.SetFocus;
             end;
          end;
     except
       //Application.MessageBox('Login ou senha inválido, tente nomamente!','Erro de login', MB_OK+MB_ICONERROR);
       Edtusu.SetFocus;
     end;
   finally
   end;

end;

procedure TFrrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) then
  begin
    btn_entrarClick(Self);
  end;
end;

procedure TFrrmLogin.EdtusuKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) then
  begin
    edtSenha.SetFocus;
  end;
end;

procedure TFrrmLogin.FormCreate(Sender: TObject);
begin
  Edtusu.SetFocus;
end;

procedure TFrrmLogin.VerificaCaixa(Cod_usu: Integer);
begin
 //
  with Caixa do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from CAIXA where cod_usu = :cod and data_abertura = :dt');
    ParamByName('cod').Value := Cod_usu;
    ParamByName('dt').Value := Date;
    Open;
    FetchAll;
  end;

  if (Caixa.RecordCount > 0) then
  begin
    Close;
  end
  else
  begin

    case MessageDlg('Seu caixa aina não foi aberto hoje deseja abrir?',System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel], 0) of
            mrOk:
            begin
              {$IFDEF WIN32}
                Application.CreateForm(TFrmAbreCaixa,FrmAbreCaixa);
                FrmAbreCaixa.lbnome.Text := Edtusu.Text;
                FrmAbreCaixa.lbcodigo.Text := IntToStr(DmDados.QLoginCOD_USU.Value);
                FrmAbreCaixa.lbdata.Text := DateToStr(Date);
                FrmAbreCaixa.lbhora.Text := TimeToStr(Time);
                FrmAbreCaixa.Showmodal;
                FrmAbreCaixa.Hide;
                FrmAbreCaixa.free;
              {$ENDIF}
            end;

            mrCancel:
            begin
              {$IFDEF WIN32}
                Application.Terminate;
            {$ENDIF}
            end;
        end;
  end;
end;

end.
