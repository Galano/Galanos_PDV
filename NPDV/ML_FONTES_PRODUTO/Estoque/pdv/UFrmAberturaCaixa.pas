unit UFrmAberturaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask,   Buttons, DB,
  IBCustomDataSet, IBQuery, RxToolEdit, RxCurrEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAbreCaixa = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    lbnome: TLabel;
    Label3: TLabel;
    lbcodigo: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    lbdata: TLabel;
    Label7: TLabel;
    lbhora: TLabel;
    EdtTotal: TCurrencyEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    AbreCaixa: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbreCaixa: TFrmAbreCaixa;

implementation

{$R *.dfm}

Uses Udm, UVendas;

procedure TFrmAbreCaixa.BitBtn1Click(Sender: TObject);
begin
  if (EdtTotal.Value = 0) then
  begin
    Application.MessageBox('Você precisa abrir o caixa com algum valor maior que zero!','Atenção', MB_OK+MB_ICONWARNING);
    EdtTotal.SetFocus;
    Abort;
  end;

  try
    with AbreCaixa do
    begin
      Close;
      ParamByName('cod').Value := FrmVendas.SpCod_Usuario.Value;
      ParamByName('dt').Value := Date;
      ParamByName('hr').Value := time;
      ParamByName('vl').Value := EdtTotal.Value;
      ParamByName('sd').Value := EdtTotal.Value;
      ParamByName('st').Value := 'A'; // Aberto
      ParamByName('empresa').Value := DmDados.Usuario_Empresa;
      ExecSQL;
    end;

    FrmAbreCaixa.Tag := 1;
    Application.MessageBox('Seu caixa foi aberto!','Informação', MB_OK+MB_ICONINFORMATION);
    FrmAbreCaixa.Close;

  except
    on e:exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar abrir o caixa!'+#13+#13+e.Message),'Erro de login', MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure TFrmAbreCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
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

procedure TFrmAbreCaixa.EdtTotalKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAbreCaixa.EdtTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_return) then
  begin
    BitBtn1.SetFocus;
  end;
end;

end.
