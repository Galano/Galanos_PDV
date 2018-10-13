unit UFrmSelecionaItensEtiqueta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxDBCtrl, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient, RxMemDS;

type
  TFrmSelecionaItensEtiqueta = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DsCdsEtiquetas: TDataSource;
    cdsEtiquetas: TRxMemoryData;
    cdsEtiquetascodigo: TIntegerField;
    cdsEtiquetasproduto: TStringField;
    cdsEtiquetascod_barras: TStringField;
    cdsEtiquetasvalor: TCurrencyField;
    cdsEtiquetasvalor_promocao: TCurrencyField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionaItensEtiqueta: TFrmSelecionaItensEtiqueta;

implementation

{$R *.dfm}

Uses Udm, URelEiquetas2;

procedure TFrmSelecionaItensEtiqueta.BitBtn1Click(Sender: TObject);
Var
  Aux : Integer;
  Valor : String;
Begin
   cdsEtiquetas.Close;
   cdsEtiquetas.Open;
   cdsEtiquetas.EmptyTable;
   With RxDBGrid1 do begin
    for Aux:= 0 to SelectedRows.Count-1 do
    begin
        Datasource.Dataset.Bookmark:= SelectedRows[Aux];
        //Showmessage(RxDBGrid1.DataSource.DataSet.FieldByName('NOME_PRO').Value);
        cdsEtiquetas.Insert;
        cdsEtiquetascodigo.AsInteger := RxDBGrid1.DataSource.DataSet.FieldByName('COD_PRO').AsInteger;
        cdsEtiquetasproduto.AsString := RxDBGrid1.DataSource.DataSet.FieldByName('NOME_PRO').AsString;
        cdsEtiquetascod_barras.AsString := RxDBGrid1.DataSource.DataSet.FieldByName('CODIGO_BARRA_PRO').AsString;
        cdsEtiquetasvalor.AsCurrency := RxDBGrid1.DataSource.DataSet.FieldByName('PRECO_VAREJO').AsCurrency;
        cdsEtiquetasvalor_promocao.AsCurrency := RxDBGrid1.DataSource.DataSet.FieldByName('PRECO_PROMOCAO').AsCurrency;
        cdsEtiquetas.Post;
    end;
  end;

    Application.CreateForm(TFrmRelEiquetas2,FrmRelEiquetas2);
    FrmRelEiquetas2.QuickRep1.PreviewInitialState:= wsMaximized;
    FrmRelEiquetas2.QuickRep1.Preview;
end;

procedure TFrmSelecionaItensEtiqueta.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelecionaItensEtiqueta.FormCreate(Sender: TObject);
begin
  //cdsEtiquetas.CreateDataSet;
end;

procedure TFrmSelecionaItensEtiqueta.FormShow(Sender: TObject);
begin
  cdsEtiquetas.Open;
end;

end.
