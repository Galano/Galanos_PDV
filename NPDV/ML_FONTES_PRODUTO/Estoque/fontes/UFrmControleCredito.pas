unit UFrmControleCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  IBX.IBCustomDataSet, IBX.IBQuery, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.WinXCtrls;

type
  TFrmControleCredito = class(TForm)
    Panel3: TPanel;
    Label21: TLabel;
    BtnConsCli: TSpeedButton;
    Label22: TLabel;
    EdtNomecli: TEdit;
    EdtCodcLI: TEdit;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    ds_crediario: TDataSource;
    Q_crediario: TIBQuery;
    Q_crediarioTOTAL: TIBBCDField;
    QCli: TIBQuery;
    QCliCOD_CLI: TIntegerField;
    QCliNOME_CLI: TIBStringField;
    GroupBox1: TGroupBox;
    EdtTotal: TCurrencyEdit;
    Q_Total: TIBQuery;
    Q_TotalTOTAL: TIBBCDField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldValue: TLinkPropertyToField;
    Q_crediarioCOD_VENDAS: TIntegerField;
    Q_crediarioCOD_VENDEDOR: TIntegerField;
    Q_crediarioCOD_FPGTO: TIntegerField;
    Q_crediarioDATA: TDateField;
    Q_crediarioHORA: TTimeField;
    Q_crediarioOBS: TWideMemoField;
    Q_crediarioDIAS_RECEBER: TIntegerField;
    Q_crediarioESTADO: TIBStringField;
    Q_crediarioDT_PAGTO: TDateField;
    Q_crediarioCOD_CLIENTE: TIntegerField;
    Q_crediarioDESCRICAO: TIBStringField;
    BitBtn1: TBitBtn;
    Q_Baixa: TIBQuery;
    Q_Limite: TIBQuery;
    Q_LimiteCOD_CLI: TIntegerField;
    Q_LimiteNOME_CLI: TIBStringField;
    Q_LimiteLIMITE_CLI: TIBBCDField;
    ToggleSwitch1: TToggleSwitch;
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodcLIChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControleCredito: TFrmControleCredito;

implementation

{$R *.dfm}

Uses UFrmConsClientes, Udm;

procedure TFrmControleCredito.BitBtn1Click(Sender: TObject);
Var
  Aux, Cod_Vendas : Integer;
  Valor : String;
Begin
  if application.MessageBox('Deseja realmente realizar a baixa da venda?', 'Baixa de venda', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
  begin
    try
     Screen.Cursor := crSQLWait;
     With DBGrid1 do begin
      for Aux:= 0 to SelectedRows.Count-1 do
      begin
          Datasource.Dataset.Bookmark:= SelectedRows[Aux];
          //Showmessage(IntToStr(DBGrid1.DataSource.DataSet.FieldByName('COD_VENDAS').AsInteger));

          with Q_Limite do
          begin
            Close;
            ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
            Open;
          end;

          with DmDados.Q_executa do
          begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CLIENTE');
            SQL.Add(' SET LIMITE_CLI = :lmt');
            SQL.Add(' WHERE CLIENTE.COD_CLI = :cod');
            ParamByName('lmt').Value := Q_LimiteLIMITE_CLI.Value + DBGrid1.DataSource.DataSet.FieldByName('TOTAL').Value;
            ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
            ExecSQL;
          end;

          with Q_Baixa do
          begin
            Close;
            ParamByName('cod').Value := DBGrid1.DataSource.DataSet.FieldByName('COD_VENDAS').AsInteger;
            ParamByName('hj').Value := Date;
            ExecSQL;
          end;
      end;
    end;

    with Q_crediario do
    begin
      Close;
      ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
      Open;
    end;

    with Q_Total do
    begin
      Close;
      ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
      Open;
    end;

    Screen.Cursor := crDefault;
    except
      on e:exception do
      begin

      end;
    end;
  end;
end;

procedure TFrmControleCredito.BtnConsCliClick(Sender: TObject);
begin
  {Application.CreateForm(TFrmConsClientes,FrmConsClientes);
  FrmConsClientes.Tag := 4;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;}

  Application.CreateForm(TFrmConsClientes,FrmConsClientes);
  FrmConsClientes.Tag := 4;
  //FrmConsClientes.ComboCons.SetFocus;
  //nome:= Screen.ActiveControl.Name;
  //ShowMessage(nome);
  FrmConsClientes.Visible := false;
  FrmConsClientes.Showmodal;
  FrmConsClientes.Hide;
  FrmConsClientes.Free;
end;

procedure TFrmControleCredito.EdtCodcLIChange(Sender: TObject);
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

      with Q_crediario do
      begin
        Close;
        ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
        Open;
      end;

      with Q_Total do
      begin
        Close;
        ParamByName('cod').Value := StrToInt(EdtCodcLI.Text);
        Open;
      end;

    end
    else
    begin
      EdtNomecli.Text := 'NÃO ENCONTRADO';
      Q_crediario.Close;
      Q_Total.Close;
    end;
  end;
end;

procedure TFrmControleCredito.ToggleSwitch1Click(Sender: TObject);
begin
  case ToggleSwitch1.State of
  tssOff: begin
            Q_crediario.First;
            while not Q_crediario.Eof do
            begin
               DBGrid1.SelectedRows.CurrentRowSelected := False;
               Q_crediario.Next;
            end;
          end;

  tssOn:  begin
            Q_crediario.First;
            while not Q_crediario.Eof do
            begin
               DBGrid1.SelectedRows.CurrentRowSelected := True;
               Q_crediario.Next;
            end;
          end;
  end;
end;

end.
