unit UFrmRelCodBarras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QRCtrls, QuickRpt,
  qrpctrls;

type
  TFrmRelCodBarras = class(TForm)
   
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    procedure GerarCodigo(Codigo: String; Canvas: TCanvas);
  public
    { Public declarations }
  end;

var
  FrmRelCodBarras: TFrmRelCodBarras;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas;

procedure TFrmRelCodBarras.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //GerarCodigo(DmDados.Q_ProdutosCODIGO_BARRA_PRO.AsString, QRImage1.Canvas);

  //GeraBarrasEAN13(DmDados.Q_ProdutosCODIGO_BARRA_PRO.AsString, QRImage1.Canvas);
end;

procedure TFrmRelCodBarras.GerarCodigo(Codigo: String; Canvas: TCanvas);
const
  digitos: array ['0' .. '9'] of string[5] = ('00110', '10001', '01001',
    '11000', '00101', '10100', '01100', '00011', '10010', '01010');
var
  s: string;
  i, j, x, t: Integer;
begin
  // Gerar o valor para desenhar o código de barras
  // Caracter de início
  s := '0000';
  for i := 1 to length(Codigo) div 2 do
    for j := 1 to 5 do
      s := s + Copy(digitos[Codigo[i * 2 - 1]], j, 1) +
        Copy(digitos[Codigo[i * 2]], j, 1);
  // Caracter de fim
  s := s + '100';
  // Desenhar em um objeto canvas
  // Configurar os parâmetros iniciais
  x := 0;
  // Pintar o fundo do código de branco
  Canvas.Brush.Color := clWhite;
  Canvas.Pen.Color := clWhite;
  Canvas.Rectangle(0, 0, 2000, 79);
  // Definir as cores da caneta
  Canvas.Brush.Color := clBlack;
  Canvas.Pen.Color := clBlack;
  // Escrever o código de barras no canvas
  for i := 1 to length(s) do
  begin
    // Definir a espessura da barra
    t := strToInt(s[i]) * 2 + 1;
    // Imprimir apenas barra sim barra não (preto/branco - intercalado);
    if i mod 2 = 1 then
      Canvas.Rectangle(x, 0, x + t, 79);
    // Passar para a próxima barra
    x := x + t;
  end;
end;

procedure TFrmRelCodBarras.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //GeraBarrasEAN13(DmDados.Q_ProdutosCODIGO_BARRA_PRO.AsString, QRImage1.Canvas);

end;

end.
