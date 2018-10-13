unit URelEiquetas2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, qrpctrls,
  Vcl.ExtCtrls, UFrmSelecionaItensEtiqueta;

type
  TFrmRelEiquetas2 = class(TForm)
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
  FrmRelEiquetas2: TFrmRelEiquetas2;

implementation

{$R *.dfm}

uses Udm;

procedure TFrmRelEiquetas2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (FrmSelecionaItensEtiqueta.cdsEtiquetasvalor_promocao.Value <> 0) then
  begin
    QRLabel3.Caption := formatfloat('R$ ###,##0.00',FrmSelecionaItensEtiqueta.cdsEtiquetasvalor_promocao.Value);
  end
  else
  begin
    QRLabel3.Caption := formatfloat('R$ ###,##0.00',FrmSelecionaItensEtiqueta.cdsEtiquetasvalor.Value);
  end;
end;

end.
