unit UFrmCupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, pngimage;

type
  TFrmCupom = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLbTotal: TQRLabel;
    QRLbDesc: TQRLabel;
    QRLbSubTotal: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QrlimiteCredito: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCupom: TFrmCupom;

implementation

{$R *.dfm}

Uses Udm, UVendas;

procedure TFrmCupom.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{  if (FrmVendas.EDT_CondPagto.Text = '4') then
  begin
    QrlimiteCredito.Visible := True;
    QrlimiteCredito.Caption := 'Saldo (Credito): R$ ' + formatfloat('##,###,##0.00', FrmVendas.EdtLimitCli.Value);
  end
  else
  begin}
    QrlimiteCredito.Visible := False;
    QrlimiteCredito.Caption := '';
//  end;

  QRLbSubTotal.Caption := 'Sub-Total: R$ ' + FrmVendas.lbTotalCom.Caption;
  QRLbDesc.Caption := 'Desconto: R$ ' + formatfloat('##,###,##0.00', FrmVendas.EdtDesconto.Value);
  QRLbTotal.Caption := 'Total Cupom: ' + FrmVendas.lbTotal.Caption;
end;

procedure TFrmCupom.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel4.Caption := 'CLIENTE: '+FrmVendas.lbCliente.Caption;
end;

end.
