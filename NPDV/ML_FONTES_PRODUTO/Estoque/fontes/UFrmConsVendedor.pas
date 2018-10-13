unit UFrmConsVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmConsVendedor = class(TForm)
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
    DSConsulta: TDataSource;
    Q_ConsultaCOD_VEND: TIntegerField;
    Q_ConsultaNOME_VEND: TIBStringField;
    Q_ConsultaATIVO_VEND: TIBStringField;
    Q_ConsultaCOMISSAO_VEND: TIBBCDField;
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendedor: TFrmConsVendedor;

implementation

{$R *.dfm}

Uses Udm, UFrmVendedor;

procedure TFrmConsVendedor.BtnOKClick(Sender: TObject);
begin
     with Q_Consulta do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * ' +
                'FROM VENDEDOR');
        case ComboCons.ItemIndex of
         -1: sql.add(' WHERE NOME_VEND LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_VEND');
         0: sql.add(' WHERE NOME_VEND LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_VEND');
         1: sql.add(' WHERE NOME_VEND LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_VEND');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_VEND')
               else
                  sql.add(' WHERE COD_VEND = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsVendedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsVendedor.DBGridDblClick(Sender: TObject);
begin
  //Form de Cadastro
  if (FrmConsVendedor.Tag = 0) then
  begin
    FrmVendedor.edtCod.text := Q_ConsultaCOD_VEND.AsString;
    FrmVendedor.btnFiltroClick(Self);
    FrmVendedor.BtnAlterarClick(Self);
  end;

  Close;
end;

end.
