unit UProdutoComposicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Samples.Spin, IBX.IBCustomDataSet, IBX.IBQuery, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmProdutosComposicao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtnConsProd: TSpeedButton;
    Label2: TLabel;
    Label12: TLabel;
    BtnAddPro: TSpeedButton;
    LabelUnd: TLabel;
    EdtNomePro: TEdit;
    EdtQuant: TCurrencyEdit;
    DBGrid1: TDBGrid;
    BtnGrava: TButton;
    BtnExclui: TButton;
    Button1: TButton;
    Edit1: TEdit;
    spCodProdComp: TSpinEdit;
    DSProd: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    Bevel1: TBevel;
    pnlProduto: TPanel;
    QProd: TFDQuery;
    Q_Consulta_filtro: TFDQuery;
    QPrecoCusto: TFDQuery;
    QProdCOD_PRO_COMPOSICAO: TIntegerField;
    QProdCOD_PRO: TIntegerField;
    QProdNOME_PRO: TStringField;
    QProdQUANT: TBCDField;
    QProdDESCRICAO: TStringField;
    QProdPRECO_PRAZO: TBCDField;
    Q_Consulta_filtroCOD_PRO: TIntegerField;
    Q_Consulta_filtroCODIGO_BARRA_PRO: TStringField;
    Q_Consulta_filtroTP_PRODUTO: TStringField;
    Q_Consulta_filtroTP_PRODUCAO: TStringField;
    Q_Consulta_filtroESTOQUE_MINIMO: TBCDField;
    Q_Consulta_filtroNOME_PRO: TStringField;
    Q_Consulta_filtroDESC_CUPOM: TStringField;
    Q_Consulta_filtroCOD_MARC: TIntegerField;
    Q_Consulta_filtroCOD_SEC: TIntegerField;
    Q_Consulta_filtroCOD_GRUP: TIntegerField;
    Q_Consulta_filtroCOD_SGRUP: TIntegerField;
    Q_Consulta_filtroCOD_UNI_ENT: TIntegerField;
    Q_Consulta_filtroCOD_UNI_SAI: TIntegerField;
    Q_Consulta_filtroPRECO_VAREJO: TBCDField;
    Q_Consulta_filtroPRECO_PROMOCAO: TBCDField;
    Q_Consulta_filtroPRECO_PRAZO: TBCDField;
    Q_Consulta_filtroMARGEM_LUCRO: TBCDField;
    Q_Consulta_filtroQUANT_ESTOQ: TBCDField;
    Q_Consulta_filtroDATA_VALIDADE: TDateField;
    Q_Consulta_filtroDIAS_VALIDADE_PRO: TIntegerField;
    Q_Consulta_filtroCONTROLA_ESTOQUE_PRO: TStringField;
    Q_Consulta_filtroATIVO_PRO: TStringField;
    Q_Consulta_filtroCAMINHO_FOTO_PRO: TBlobField;
    QPrecoCustoPRECO_CUSTO: TBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsProdClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BuscaProduto;
    procedure BtnExcluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutosComposicao: TFrmProdutosComposicao;

implementation

{$R *.dfm}

uses UFrmConsProduto, Udm, UFrmProdutos;

procedure TFrmProdutosComposicao.BtnConsProdClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProduto, FrmConsProduto);
  FrmConsProduto.Tag := 3;
  DmDados.tb_produtos.Open;
  FrmConsProduto.Showmodal;
  FrmConsProduto.Hide;
  FrmConsProduto.Free;
end;

procedure TFrmProdutosComposicao.BtnExcluiClick(Sender: TObject);
begin
   if not QProdCOD_PRO_COMPOSICAO.IsNull then
      begin
         if Application.MessageBox('Confirma a Exclusão do Produto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
           begin
              try
                try
                  with DmDados.Q_executa do
                      begin
                         close;
                         sql.Clear;
                         sql.add('DELETE FROM PRODUTO_COMPOSICAO ' +
                                 'WHERE COD_PRO = :1 AND COD_PRO_COMPOSICAO = :2');
                         Parambyname('1').AsInteger := QProdCOD_PRO.AsInteger;
                         Parambyname('2').AsInteger := StrToInt(Edit1.Text);
                         ExecSQL;
                      end;
                  DmDados.IBTransaction1.CommitRetaining;
                except
                  DmDados.IBTransaction1.RollbackRetaining;
                  showmessage('Erro ao excluir o Produto');
                end;
              finally
                DmDados.Q_executa.close;
                BuscaProduto;
                Edit1.Clear;
                EdtNomePro.clear;
                Edit1.SetFocus;
              end;
           end;
      end;
end;

procedure TFrmProdutosComposicao.BtnGravaClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    showmessage('Digite o código do Produto');
    Edit1.SetFocus;
    exit;
  end;

  if not(strtocurr(EdtQuant.Text) > 0) then
  begin
    showmessage('Verifique a quantidade');
    EdtQuant.SetFocus;
    exit;
  end;

  try
    try
      with DmDados.Q_executa do
      begin
        close;
        sql.Clear;
        sql.add('INSERT INTO PRODUTO_COMPOSICAO (COD_PRO, COD_PRO_COMPOSICAO, QUANT) '
          + 'VALUES (:1, :2, :3)');
        Parambyname('1').AsInteger := StrToInt(Edit1.Text);
        Parambyname('2').AsInteger := spCodProdComp.Value;
        Parambyname('3').AsCurrency := strtocurr(EdtQuant.Text);
        ExecSQL;
      end;
      DmDados.IBTransaction1.CommitRetaining;
    except
      DmDados.IBTransaction1.RollbackRetaining;
      showmessage('Erro ao gravar o Produto ' + #13 +
        'Verifique se está gravado');
      Edit1.Clear;
      EdtNomePro.Clear;
      EdtQuant.Clear;
      LabelUnd.Caption := '';
      Edit1.SetFocus;
    end;
  finally
    DmDados.Q_executa.close;
    BuscaProduto;
    Edit1.Clear;
    EdtNomePro.Clear;
    EdtQuant.Clear;
    LabelUnd.Caption := '';
    Edit1.SetFocus;
  end;

end;

procedure TFrmProdutosComposicao.BuscaProduto;
begin
  with QProd do
  begin
    close;
    Parambyname('codpro').Value := spCodProdComp.Value;
    Open;
    FetchAll;
  end;

  if (QProd.RecordCount > 0 ) then
  begin
    //ShowMessage('Tem registros');
  end
  else
  begin
    //ShowMessage('Não tem registros');
  end;


  with QPrecoCusto do
  begin
    close;
    Parambyname('codpro').Value := spCodProdComp.Value;
    Open;
  end;
end;

procedure TFrmProdutosComposicao.Button1Click(Sender: TObject);
begin
  //BuscaProduto;
end;

procedure TFrmProdutosComposicao.Button1Exit(Sender: TObject);
begin
  FrmProdutos.Edit1Change(Self);
end;

procedure TFrmProdutosComposicao.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') then
  begin
    with Q_Consulta_filtro do
    begin
      Close;
      Parambyname('cod').Value := Edit1.Text;
      Open;
      FetchAll;
    end;

    if (Q_Consulta_filtro.RecordCount > 0) then
    begin
      EdtNomePro.Text := Q_Consulta_filtroNOME_PRO.AsString;
    end
    else
    begin
      EdtNomePro.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutosComposicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmProdutos.EdtPrecoPrazo.Value := QPrecoCustoPRECO_CUSTO.Value;
end;

procedure TFrmProdutosComposicao.FormCreate(Sender: TObject);
begin
  LabelUnd.Caption := '';
end;

procedure TFrmProdutosComposicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFrmProdutosComposicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmProdutosComposicao.FormShow(Sender: TObject);
begin
  BuscaProduto;
end;

end.
