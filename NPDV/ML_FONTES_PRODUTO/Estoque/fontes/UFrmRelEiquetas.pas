unit UFrmRelEiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  qrpctrls;

type
  TFrmRelEiquetas = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRPShape1: TQRPShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEiquetas: TFrmRelEiquetas;

implementation

{$R *.dfm}

Uses Udm;

procedure TFrmRelEiquetas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (DmDados.Q_ProdutosPRECO_PROMOCAO.Value <> 0) then
  begin
    QRLabel3.Caption := formatfloat('R$ ###,##0.00',DmDados.Q_ProdutosPRECO_PROMOCAO.Value);
  end
  else
  begin
    QRLabel3.Caption := formatfloat('R$ ###,##0.00',DmDados.Q_ProdutosPRECO_VAREJO.Value);
  end;
end;

end.
