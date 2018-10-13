unit UFrmRelOutrasSaidas1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelOutrasSaidas = class(TForm)
    Panel1: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox1: TGroupBox;
    BtnConsCli: TSpeedButton;
    EdtNomeCli: TEdit;
    CheckCliente: TCheckBox;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    EdtCodCli: TEdit;
    procedure BtnVisClick(Sender: TObject);
    procedure CheckClienteClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOutrasSaidas: TFrmRelOutrasSaidas;

implementation

{$R *.dfm}

Uses Udm, UListaOutrasSaidas, UFrmConsClientes01;

procedure TFrmRelOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClientes01,FrmConsClientes01);
  FrmConsClientes01.Tag := 2;
  FrmConsClientes01.Showmodal;
  FrmConsClientes01.Hide;
  FrmConsClientes01.Free;
end;

procedure TFrmRelOutrasSaidas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelOutrasSaidas.BtnVisClick(Sender: TObject);
begin
with DmDados.QRelOS do
      begin
         close;
         sql.Clear;
         sql.Add('select c.cod_cli, c.nome_cli, O.* from OUTRAS_SAIDAS O, cliente c where c.cod_cli = o.cod_cli and o.DATA_OUTRA between :dt1 and :dt2 ');

         if not CheckCliente.Checked then
         begin
            sql.Add(' AND C.COD_CLI = ' + EdtCodCli.Text);
         end;

         sql.Add(' ORDER BY O.COD_OUTRA, O.DATA_OUTRA ');
         ParamByName('dt1').Value := EdtDataIni.DateTime;
         ParamByName('dt2').Value := EdtDataFin.DateTime;
         open;
      end;
   Application.CreateForm(TFrmListaOutrasSaidas, FrmListaOutrasSaidas);
   FrmListaOutrasSaidas.QRVendas.PreviewInitialState:= wsMaximized;
   FrmListaOutrasSaidas.QRVendas.Preview;
end;

procedure TFrmRelOutrasSaidas.CheckClienteClick(Sender: TObject);
begin
   if CheckCliente.Checked then
      begin
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         BtnConsCli.Enabled := false;
         EdtCodCli.Enabled  := false;
         EdtNomeCli.Enabled := false;
      end
   else
      begin
         BtnConsCli.Enabled := true;
         EdtCodCli.Enabled  := true;
         EdtNomeCli.Enabled := true;
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelOutrasSaidas.FormShow(Sender: TObject);
begin
  CheckClienteClick(Self);
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
end;

end.
