unit UFrmRelCodBarrasFR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLBarcode, RLReport;

type
  TFrmRelCodBarrasFR = class(TForm)
    RLReport1: TRLReport;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
    RLDBBarcode1: TRLDBBarcode;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCodBarrasFR: TFrmRelCodBarrasFR;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas;

end.
