unit UFrmConsCliente;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB,
    IBCustomDataSet, IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
    TFrmConsCliente = class(TForm)
        Panel1: TPanel;
        GBCons: TGroupBox;
        ComboCons: TComboBox;
        GB2: TGroupBox;
        EdtCons: TEdit;
        BtnOk: TButton;
        RdgAtivo: TRadioGroup;
        btnFormataCPF: TButton;
        DBGrid: TDBGrid;
       
        DSQConsCliente: TDataSource;
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
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ComboConsChange(Sender: TObject);
        procedure DBGridDblClick(Sender: TObject);
        procedure BtnOkClick(Sender: TObject);
        procedure btnFormataCPFClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure EdtConsChange(Sender: TObject);
    procedure EdtConsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmConsCliente: TFrmConsCliente;
    sSql: string;

implementation

{$R *.dfm}

uses Udm, UVendas;

function EliminaCaracter(stext: string): string;
var npos: integer;
begin
    result := '';
    npos := 1;
    while npos <= Length(sText) do
    begin
        if (stext[npos] = '.') or (stext[npos] = '-') or (stext[npos] = '/') or
            (stext[npos] = ')') or (stext[npos] = '(') or (stext[npos] = ',') then
        begin
            inc(npos);
        end
        else
        begin
            result := result + stext[npos];
            inc(npos);
        end;
    end;
end;

//Esta funcao informa Cpf neste formato: 999.999.999-99

function FormataCPF(CPF: string): string;
var sAux, sCPF: string;
begin
    sAux := EliminaCaracter(CPF);
    case Length(sAux) of
        11: begin
                sCPF := copy(sAux, 1, 3) + '.' +
                    copy(sAux, 4, 3) + '.' +
                    copy(sAux, 7, 3) + '-' +
                    copy(sAux, 10, 2);
                Result := sCPF;
            end;
    else
        result := '';
    end;
end;

procedure TFrmConsCliente.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_Escape) then
    begin
        Close;
    end;
end;

procedure TFrmConsCliente.ComboConsChange(Sender: TObject);
begin
    case combocons.ItemIndex of
        0: begin
                gb2.Caption := 'Código';
                edtcons.Visible := true;
                edtcons.Clear;
            end;
        1: begin
                gb2.Caption := 'Nome';
                edtcons.Visible := true;
                edtcons.Clear;
            end;
        2: begin
                gb2.Caption := '';
                edtcons.Visible := false;
            end;
        3: begin
                gb2.Caption := 'Palavra Chave';
                edtcons.Visible := true;
                edtcons.Clear;
            end;
        4: begin
                gb2.Caption := 'Cidade';
                edtcons.Visible := true;
                edtcons.Clear;
            end;
        5: begin
                gb2.Caption := 'CNPJ/CPF';
                edtcons.Visible := true;
                edtcons.Clear;
            end;
    end;

end;

procedure TFrmConsCliente.DBGridDblClick(Sender: TObject);
begin
  //Form de Vendas
    if (FrmConsCliente.Tag = 0) then
    begin
        FrmVendas.EDT_Cliente.text := QConsClienteCOD_CLI.AsString;
        FrmVendas.EDT_ClienteChange(Self);
    end;

    Close;
end;

procedure TFrmConsCliente.BtnOkClick(Sender: TObject);
begin
    with QConsCliente do
    begin
        close;
        sql.Clear;
        sql.Text := sSql;

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

procedure TFrmConsCliente.btnFormataCPFClick(Sender: TObject);
begin
    EdtCons.Text := FormataCPF(EdtCons.Text);
end;

procedure TFrmConsCliente.FormShow(Sender: TObject);
begin
    EdtCons.SetFocus;
    sSql := QConsCliente.SQL.Text;
end;

procedure TFrmConsCliente.EdtConsChange(Sender: TObject);
begin
    if (EdtCons.Text <> '') then
    begin
        with QConsCliente do
        begin
            close;
            sql.Clear;
            sql.Text := sSql;

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
            //dbgrid.SetFocus;
        end;

    end;
end;

procedure TFrmConsCliente.EdtConsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Return) then
  begin
    DBGridDblClick(Self);
  end;
end;

end.

