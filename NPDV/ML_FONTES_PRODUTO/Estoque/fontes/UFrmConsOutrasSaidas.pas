unit UFrmConsOutrasSaidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmConsOutrasSaidas = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB3: TGroupBox;
    BtnConsCli: TSpeedButton;
    EdtNomeCli: TEdit;
    EdtCod: TEdit;
    BtnOk: TButton;
    EdtCodCli: TEdit;
    DBGrid1: TDBGrid;
    QConsOS: TIBQuery;
    DSQConsOS: TDataSource;
    QConsOSCOD_OUTRA: TIntegerField;
    QConsOSDATA_OUTRA: TDateField;
    QConsOSCOD_TIPO: TIntegerField;
    QConsOSCOD_CLI: TIntegerField;
    QConsOSCOD_EMP: TIntegerField;
    QConsOSTOTAL_OUTRA: TIBBCDField;
    QConsOSCANCELADA: TIntegerField;
    QConsOSNOME_CLI: TIBStringField;
    QCli: TIBQuery;
    QCliCOD_CLI: TIntegerField;
    QCliNOME_CLI: TIBStringField;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtCodCliChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOutrasSaidas: TFrmConsOutrasSaidas;
  vl_sql : string;

implementation

{$R *.dfm}

Uses Udm, UFrmConsClientes, UFrmOutrasSaidas;

procedure TFrmConsOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClientes,FrmConsClientes);
  FrmConsClientes.Tag := 2;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;
end;

procedure TFrmConsOutrasSaidas.BtnOkClick(Sender: TObject);
begin
      if edtdatafin.Date < edtdataini.Date then
      begin
         showmessage('A data final não pode ser menor que a data inicial');
         edtdataini.SetFocus;
         exit;
      end;

  with QConsOS do
      begin
         close;
         sql.Clear;
         sql.Text:= vl_sql;
         case ComboCons.ItemIndex of
           -1:begin
                sql.Add(' ORDER BY OS.COD_OUTRA DESC');
                Open;
              end;
           0: begin
                 if EdtCod.Text = '' then
                    begin
                       showmessage('Digite o Código');
                       edtcod.SetFocus;
                       exit;
                    end;
                 sql.Add(' WHERE OS.COD_OUTRA = ' + edtcod.Text);

                 open;
              end;
           1: begin
                 sql.Add(' WHERE OS.COD_CLI = ' + edtcodcli.Text);
                 sql.add(' AND OS.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');

                 sql.Add(' ORDER BY OS.DATA_OUTRA');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
                 open;
              end;
           2: begin
                 sql.add(' WHERE OS.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');
                 
                 sql.Add(' ORDER BY OS.DATA_OUTRA');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
                 open;
              end;
         end;
      end;
end;

procedure TFrmConsOutrasSaidas.ComboConsChange(Sender: TObject);
begin
  case ComboCons.ItemIndex of
     0: begin
           gb3.Enabled        := true;
           gb2.Enabled        := false;
           gb3.Caption        := 'Código';
           edtcod.Visible     := true;
           edtcodcli.Visible  := false;
           edtnomecli.Visible := false;
           btnconscli.Visible := false;
           edtcod.Clear;
           edtcod.SetFocus;
        end;
     1: begin
           gb3.Enabled        := true;
           gb2.Enabled        := true;
           gb3.Caption        := 'Cliente';
           edtcod.Visible     := false;
           edtcodcli.Visible  := true;
           edtnomecli.Visible := true;
           btnconscli.Visible := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           edtcodcli.Clear;
           edtnomecli.Clear;
           edtcodcli.SetFocus;
        end;
     2: begin
           gb3.Enabled        := false;
           gb2.Enabled        := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           gb3.Caption        := 'Cliente';
           edtcod.Visible     := false;
           edtcodcli.Visible  := true;
           edtnomecli.Visible := true;
           btnconscli.Visible := true;
           edtcodcli.Clear;
           edtnomecli.Clear;
           edtdataini.SetFocus;
        end;
   end;
end;

procedure TFrmConsOutrasSaidas.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConsOutrasSaidas.Tag = 0) then
  begin
    FrmOutrasSaidas.edtCod.Text := trim(QConsOSCOD_OUTRA.AsString);
    FrmOutrasSaidas.btFiltroClick(Self);
    FrmOutrasSaidas.BtnAlterarClick(Self);
  end;

  Close;
end;

procedure TFrmConsOutrasSaidas.EdtCodCliChange(Sender: TObject);
begin
  if (EdtCodcLI.Text <> '') then
  begin
    with QCli do
    begin
      Close;
      ParamByName('cod').Value := EdtCodcLI.Text;
      Open;
      FetchAll;
    end;

    if (QCli.RecordCount > 0) then
    begin
      EdtNomecli.Text := QCliNOME_CLI.AsString;
    end
    else
    begin
      EdtNomecli.Text := 'NÃO ENCONTRADO';
    end;
  end;
end;

procedure TFrmConsOutrasSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Escape) then
  begin
    Close;
  end;
end;

procedure TFrmConsOutrasSaidas.FormShow(Sender: TObject);
begin
  vl_sql:= QConsOS.SQL.Text;
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
end;

end.
