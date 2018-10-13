unit UFrmConsClassifica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmConsClassifica = class(TForm)
    Panel1: TPanel;
    LTipo: TLabel;
    EdtCons: TEdit;
    BtnOK: TBitBtn;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    Q_Consulta: TIBQuery;
    procedure EdtConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsClassifica: TFrmConsClassifica;

implementation

{$R *.dfm}

Uses Udm, UFrmClassificaCliente, UClientes;

procedure TFrmConsClassifica.BtnOKClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsClassifica.Tag = 0) then
  begin
    FrmClassificaCliente.edit1.text := DmDados.tb_classifica_clienteCOD_CLA.AsString;
    DmDados.tb_classifica_cliente.Filtered:= false;
    FrmClassificaCliente.BtnAlterarClick(Self);
  end;

  if (FrmConsClassifica.Tag = 1) then
  begin
    FrmClientes.edit2.text := DmDados.tb_classifica_clienteCOD_CLA.AsString;
    FrmClientes.EdtNomeCla.text := DmDados.tb_classifica_clienteNOME_CLA.AsString;
    DmDados.tb_classifica_cliente.Filtered:= false;
  end;

  Close;
end;

procedure TFrmConsClassifica.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsClassifica.ComboConsChange(Sender: TObject);
begin
  case ComboCons.ItemIndex of
  0:begin
    LTipo.Caption := 'Consulta por ' + ComboCons.Text;
  end;

  1:begin
    LTipo.Caption := 'Consulta por ' + ComboCons.Text;
  end;
  end;

end;

procedure TFrmConsClassifica.DBGridDblClick(Sender: TObject);
begin
  FrmConsClassifica.BtnOKClick(Self);
end;

procedure TFrmConsClassifica.EdtConsChange(Sender: TObject);
begin
  DmDados.tb_classifica_cliente.Filtered := true;
  case ComboCons.ItemIndex of
  0:begin
    with DmDados.tb_classifica_cliente do
    begin
       //NOME_CLA LIKE ' + #39 + '%' + edtcons.Text + '%' + #39 + ' ORDER BY NOME_CLA'
       Filter := 'NOME_CLA LIKE '+QuotedStr(EdtCons.Text + '%');
    end;
    LTipo.Caption := 'Consulta por ' + ComboCons.Text;
  end;

  1:begin
    with DmDados.tb_classifica_cliente do
    begin
      Filter := 'COD_CLA = '+QuotedStr(EdtCons.Text);
    end;
    LTipo.Caption := 'Consulta por ' + ComboCons.Text;
  end;
  end;

  if (EdtCons.Text = '') then
  begin
    DmDados.tb_classifica_cliente.Filtered := false;
  end;
end;

procedure TFrmConsClassifica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (key = vk_Escape) then Close;
end;

end.
