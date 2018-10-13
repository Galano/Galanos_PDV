unit UFrmConsOutrasEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFrmConsOutrasEntradas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB3: TGroupBox;
    BtnConsFor: TSpeedButton;
    EdtNomeFor: TEdit;
    EdtCod: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    StatusBar1: TStatusBar;
    QConsOE: TIBQuery;
    DSQConsOE: TDataSource;
    EdtCodFor: TEdit;
    QConsOECOD_OUTRA: TIntegerField;
    QConsOEDATA_OUTRA: TDateField;
    QConsOECOD_FOR: TIntegerField;
    QConsOECOD_EMP: TIntegerField;
    QConsOETOTAL_OUTRA: TIBBCDField;
    QConsOENUMERO_NOTA_FISCAL: TIntegerField;
    QConsOESERIE_NOTA_FISCAL: TIBStringField;
    QConsOECANCELADA: TIntegerField;
    QConsOERAZAO_FOR: TIBStringField;
    QFor: TIBQuery;
    QForCOD_FOR: TIntegerField;
    QForRAZAO_FOR: TIBStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure EdtCodForChange(Sender: TObject);
    procedure BtnConsForClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOutrasEntradas: TFrmConsOutrasEntradas;
  var  sSql : string;

implementation

{$R *.dfm}

Uses UDm, UFrmConsFornecedor, UFrmOutrasEntradas;

procedure TFrmConsOutrasEntradas.BtnConsForClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Tag := 2;
  FrmConsFornecedor.Showmodal;
  FrmConsFornecedor.Hide;
  FrmConsFornecedor.Free;
end;

procedure TFrmConsOutrasEntradas.BtnOkClick(Sender: TObject);
begin
  if edtdatafin.Date < edtdataini.Date then
  begin
     showmessage('A data final não pode ser menor que a data inicial');
     edtdataini.SetFocus;
     exit;
  end;

  with QConsOE do
  begin
     close;
     sql.Clear;
     sql.Text:= sSql;
     case ComboCons.ItemIndex of
      -1:begin
          sql.Add(' ORDER BY OE.COD_OUTRA DESC');
         end;
       0: begin
             if trim(EdtCod.Text) = '' then
                begin
                   showmessage('Digite o Código');
                   edtcod.SetFocus;
                   exit;
                end;

             sql.Add(' WHERE OE.COD_OUTRA = ' + edtcod.Text);
          end;

       1: begin
             sql.Add(' WHERE OE.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN AND OE.COD_FOR = :CODFOR');

             sql.Add(' ORDER BY OE.DATA_OUTRA, OE.COD_OUTRA');
             Parambyname('codfor').AsInteger := strtoint(EdtCodFor.Text);
             Parambyname('dataini').AsDate   := edtdataini.Date;
             Parambyname('datafin').AsDate   := edtdatafin.Date;
          end;

       2: begin
             sql.add(' WHERE OE.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');

             sql.Add(' ORDER BY OE.DATA_OUTRA, OE.COD_OUTRA');
             Parambyname('dataini').AsDate:= edtdataini.Date;
             Parambyname('datafin').AsDate:= edtdatafin.Date;
          end;
     end;
     open;
  end;
end;

procedure TFrmConsOutrasEntradas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsOutrasEntradas.ComboConsChange(Sender: TObject);
begin
  case ComboCons.ItemIndex of
     0: begin
           gb3.Enabled        := true;
           gb2.Enabled        := false;
           gb3.Caption        := 'Código';
           edtcod.Visible     := true;
           edtcodfor.Visible  := false;
           edtnomefor.Visible := false;
           btnconsfor.Visible := false;
           edtcod.Clear;
           edtcod.SetFocus;
        end;
     1: begin
           gb3.Enabled        := true;
           gb2.Enabled        := true;
           gb3.Caption        := 'Fornecedor';
           edtcod.Visible     := false;
           edtcodfor.Visible  := true;
           edtnomefor.Visible := true;
           btnconsfor.Visible := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           edtcodfor.Clear;
           edtnomefor.Clear;
           edtcodfor.SetFocus;
        end;
     2: begin
           gb3.Enabled        := false;
           gb2.Enabled        := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           gb3.Caption        := 'Fornecedor';
           edtcod.Visible     := false;
           edtcodfor.Visible  := true;
           edtnomefor.Visible := true;
           btnconsfor.Visible := true;
           edtcodfor.Clear;
           edtnomefor.Clear;
           edtdataini.SetFocus;
        end;
   end;
end;

procedure TFrmConsOutrasEntradas.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConsOutrasEntradas.Tag = 0) then
  begin
    FrmOutrasEntradas.edtCod.text := QConsOECOD_OUTRA.AsString;
    FrmOutrasEntradas.btFiltroClick(Self);
    FrmOutrasEntradas.BtnAlterarClick(Self);
  end;

  Close;
end;

procedure TFrmConsOutrasEntradas.EdtCodForChange(Sender: TObject);
begin
  if (EdtCodFor.Text <> '') then
  begin
    with QFor do
    begin
      Close;
      ParamByName('cod').Value := EdtCodFor.Text;
      Open;
      FetchAll;
    end;

    if (QFor.RecordCount > 0) then
    begin
      EdtNomeFor.Text := QForRAZAO_FOR.AsString;
    end
    else
    begin
      EdtNomeFor.Text := 'NÃO ENCONTRADO';
    end;
  end;
end;

procedure TFrmConsOutrasEntradas.FormShow(Sender: TObject);
begin
  sSql := 'SELECT OE.*, F.RAZAO_FOR FROM ENTRADAS OE INNER JOIN FORNECEDOR F ON (OE.COD_FOR = F.COD_FOR)';
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
end;

end.
