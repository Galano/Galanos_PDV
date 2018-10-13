unit UFrmRelEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmRelEntradas = class(TForm)
    Panel1: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox1: TGroupBox;
    BtnConsFor: TSpeedButton;
    EdtNomeFor: TEdit;
    CheckFor: TCheckBox;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnSair: TBitBtn;
    EdtCodFor: TEdit;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsForClick(Sender: TObject);
    procedure CheckForClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEntradas: TFrmRelEntradas;

implementation

{$R *.dfm}

Uses Udm, UFrmConsFornecedor, UFrmQRelEntradas;

procedure TFrmRelEntradas.BtnConsForClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Tag := 3;
  FrmConsFornecedor.Showmodal;
  FrmConsFornecedor.Hide;
  FrmConsFornecedor.Free;
end;

procedure TFrmRelEntradas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelEntradas.BtnVisClick(Sender: TObject);
begin
   with DmDados.Q_RelEntradas do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT');
         sql.Add(' ENTRADAS.COD_OUTRA,');
         sql.Add(' ENTRADAS.DATA_OUTRA,');
         sql.Add(' ENTRADAS.COD_FOR,');
         sql.Add(' ENTRADAS.COD_EMP,');
         sql.Add(' ENTRADAS.TOTAL_OUTRA,');
         sql.Add(' ENTRADAS.NUMERO_NOTA_FISCAL,');
         sql.Add(' ENTRADAS.SERIE_NOTA_FISCAL,');
         sql.Add(' ENTRADAS.CANCELADA,');
         sql.Add(' ENTRADAS.DATA_VENCTO,');
         sql.Add(' FORNECEDOR.RAZAO_FOR');
         sql.Add(' FROM');
         sql.Add(' FORNECEDOR');
         sql.Add(' INNER JOIN ENTRADAS ON (FORNECEDOR.COD_FOR = ENTRADAS.COD_FOR)');

         sql.Add(' WHERE ENTRADAS.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');

         if not CheckFor.Checked then
            sql.Add(' AND ENTRADAS.COD_FOR = ' + EdtCodFor.Text);

         case ComboBox1.ItemIndex of
         0:begin
            //sql.Add(' AND ENTRADAS.CANCELADA = ' + EdtCodFor.Text);
         end;
         1:begin
            sql.Add(' AND ENTRADAS.CANCELADA = 0 ');
         end;
         2:begin
            sql.Add(' AND ENTRADAS.CANCELADA = 1 ');
         end;
         end;

         sql.Add(' ORDER BY ENTRADAS.COD_OUTRA, ENTRADAS.DATA_OUTRA, FORNECEDOR.RAZAO_FOR');
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         open;
      end;
   Application.CreateForm(TFrmQRelEntradas, FrmQRelEntradas);
   FrmQRelEntradas.QRVendas.PreviewInitialState:= wsMaximized;
   FrmQRelEntradas.QRVendas.Preview;
end;

procedure TFrmRelEntradas.CheckForClick(Sender: TObject);
begin
   if CheckFor.Checked then
      begin
         EdtCodFor.Clear;
         EdtNomeFor.Clear;
         BtnConsFor.Enabled := false;
         EdtCodFor.Enabled  := false;
         EdtNomeFor.Enabled := false;
      end
   else
      begin
         BtnConsFor.Enabled := true;
         EdtCodFor.Enabled  := true;
         EdtNomeFor.Enabled := true;
         EdtCodFor.Clear;
         EdtNomeFor.Clear;
         EdtCodFor.SetFocus;
      end;
end;

procedure TFrmRelEntradas.FormShow(Sender: TObject);
begin
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   CheckFor.Checked      := true;
   edtdataini.SetFocus;
end;

end.
