unit UFrmAberturaCaixa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit, FMX.Ani;

type
  TFrmAbreCaixa = class(TForm)
    AbreCaixa: TIBQuery;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    lbcodigo: TLabel;
    lbnome: TLabel;
    Rectangle2: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    lbdata: TLabel;
    lbhora: TLabel;
    Label9: TLabel;
    EdtTotal: TEdit;
    btn_entrar: TRectangle;
    ColorAnimation1: TColorAnimation;
    Label10: TLabel;
    procedure EdtTotalEnter(Sender: TObject);
    procedure EdtTotalExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btn_entrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbreCaixa: TFrmAbreCaixa;

implementation

{$R *.fmx}

uses UVendas;

procedure TFrmAbreCaixa.btn_entrarClick(Sender: TObject);
begin
  if (EdtTotal.Text.ToDouble() = 0) then
  begin
    MessageDlg('Você precisa abrir o caixa com algum valor maior que zero!', System.UITypes.TMsgDlgType.mtWarning,
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
    EdtTotal.SetFocus;
    Abort;
  end;

  try
    with AbreCaixa do
    begin
      Close;
      ParamByName('cod').Value := FrmVendas.SpCod_Usuario.Text.ToInteger();
      ParamByName('dt').Value := Date;
      ParamByName('hr').Value := time;
      ParamByName('vl').Value := EdtTotal.Text.ToDouble();
      ParamByName('sd').Value := EdtTotal.Text.ToDouble();
      ParamByName('st').Value := 'A'; // Aberto
      ExecSQL;
    end;

    FrmAbreCaixa.Tag := 1;
    //Showmessage('Seu caixa foi aberto!');
    MessageDlg('Bom trabalho, seu caixa foi aberto!', System.UITypes.TMsgDlgType.mtInformation,
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

    FrmAbreCaixa.Close;

  except
    on e:exception do
    begin
      Showmessage(PChar('Erro ao tentar abrir o caixa!'+#13+#13+e.Message));
    end;
  end;
end;

procedure TFrmAbreCaixa.EdtTotalEnter(Sender: TObject);
begin
  EdtTotal.Text := formatfloat('##,###,##0.00', 0);
  EdtTotal.SelectAll;
end;

procedure TFrmAbreCaixa.EdtTotalExit(Sender: TObject);
begin
  //EdtTotal.Text := formatfloat('##,###,##0.00', 0);
  //EdtTotal.SelectAll;
end;

procedure TFrmAbreCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FrmAbreCaixa.Tag = 1) then
  begin
    Close;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TFrmAbreCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Key = VKReturn) then
  begin
    btn_entrar.SetFocus;
  end;
end;

end.
