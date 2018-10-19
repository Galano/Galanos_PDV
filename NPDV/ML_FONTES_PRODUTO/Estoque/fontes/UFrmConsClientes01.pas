unit UFrmConsClientes01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsClientes01 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    GBCons: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    BtnCons: TSpeedButton;
    EdtCons: TEdit;
    BtnOk: TButton;
    RdgAtivo: TRadioGroup;
    btnFormataCPF: TButton;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    QConsCliente: TFDQuery;
    QConsClienteCOD_CLI: TIntegerField;
    QConsClienteNOME_CLI: TStringField;
    QConsClienteCOD_CLA: TIntegerField;
    QConsClienteENDRES_CLI: TStringField;
    QConsClienteBAIRES_CLI: TStringField;
    QConsClienteCIDRES_CLI: TStringField;
    QConsClienteESTRES_CLI: TStringField;
    QConsClienteCEPRES_CLI: TStringField;
    QConsClienteTELRES_CLI: TStringField;
    QConsClienteCPF_CLI: TStringField;
    QConsClienteRG_CLI: TStringField;
    QConsClienteAPELIDO_CLI: TStringField;
    QConsClienteLIMITE_CLI: TBCDField;
    QConsClienteATIVO_CLI: TStringField;
    QConsClienteOBS_CLI: TStringField;
    QConsClienteNASCIMENTO_CLI: TDateField;
    QConsClienteDATACADASTRO_CLI: TDateField;
    QConsClienteATRAZO_MAXIMO_CLI: TIntegerField;
    QConsClienteCELULAR_CLI: TStringField;
    QConsClienteIMP_SALDO_PENDENTE_CLI: TStringField;
    QConsClienteLIMITE_CHEQUE: TBCDField;
    QConsClienteCONTATO_CLI: TStringField;
    QConsClienteCONTROLAR_LIMITE: TStringField;
    QConsClienteEMAIL_CLI: TStringField;
    QConsClienteNOME_CLA: TStringField;
    QDias: TFDQuery;
    DConsCliente: TDataSource;
    procedure ComboConsChange(Sender: TObject);
    procedure btnFormataCPFClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsClientes01: TFrmConsClientes01;
  sSql  : string;
  iDias : integer;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UClientes, UFrmConsClientes, UFrmRelOutrasSaidas1;

procedure TFrmConsClientes01.btnFormataCPFClick(Sender: TObject);
begin
  EdtCons.Text := FormataCPF(EdtCons.Text);
end;

procedure TFrmConsClientes01.BtnOkClick(Sender: TObject);
begin
  sSql:= 'SELECT C.*, S.NOME_CLA ' +
         ' FROM CLIENTE C ' +
         ' INNER JOIN CLASSIF_CLIENTE S ' +
         ' ON (C.COD_CLA = S.COD_CLA)';

  with QConsCliente do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;

         case ComboCons.ItemIndex of
            -1: begin
                  if trim(edtcons.Text) = '' then
                     begin
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        {case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;  }
                        sql.Add(' ORDER BY C.NOME_CLI');
                     end
                  else
                     begin
                        sql.Add(' WHERE C.COD_CLI = ' + edtcons.Text);
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        {case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;}
                     end;
               end;

            0: begin
                  if trim(edtcons.Text) = '' then
                     begin
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        {case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;  }
                        sql.Add(' ORDER BY C.COD_CLI');
                     end
                  else
                     begin
                        sql.Add(' WHERE C.COD_CLI = ' + edtcons.Text);
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        {case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;}
                     end;
               end;
            1: begin
                  sql.Add(' WHERE C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  {case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;}
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            2: begin
                  sql.Add(' WHERE C.BLOQUEADO_CLI = ' + #39 + 'S' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  {case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;}
                  sql.Add(' ORDER BY C.NOME_CLI');
               end;
            3: begin
                  sql.Add(' WHERE C.NOME_CLI LIKE ' + #39 + '%' + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  {case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;}
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            4: begin
                  sql.Add(' WHERE C.CIDRES_CLI LIKE ' + #39 + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  {case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;}
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            5: begin
                  btnFormataCPFClick(Self);
                  sql.add(' WHERE C.CPF_CLI = ' + #39 + FormataCPF(trim(EdtCons.Text)) + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  {case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;}
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
         end;
         open;
         dbgrid.SetFocus;
      end;

end;

procedure TFrmConsClientes01.ComboConsChange(Sender: TObject);
begin
   case combocons.ItemIndex of
      0: begin
            gb2.Caption      := 'Código';
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      1: begin
            gb2.Caption      := 'Nome';
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      2: begin
            gb2.Caption      := '';
            btncons.Visible  := false;
            edtcons.Visible  := false;
         end;
      3: begin
            gb2.Caption      := 'Palavra Chave';
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      4: begin
            gb2.Caption      := 'Cidade';
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      5: begin
            gb2.Caption      := 'CNPJ/CPF';
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
   end;
end;

procedure TFrmConsClientes01.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsClientes01.Tag = 0) then
  begin
    FrmClientes.edtCod.text := QConsClienteCOD_CLI.AsString;
    DmDados.tb_clientes.Filtered:= false;
    FrmClientes.BtnAlterarClick(Self);
    FrmClientes.btnFiltroClick(Self);
  end;

  if (FrmConsClientes01.Tag = 2) then
  begin
    FrmRelOutrasSaidas.EdtCodCli.text := QConsClienteCOD_CLI.AsString;
    FrmRelOutrasSaidas.EdtNomeCli.text := QConsClienteNOME_CLI.AsString;
  end;

  Close;
end;

end.
