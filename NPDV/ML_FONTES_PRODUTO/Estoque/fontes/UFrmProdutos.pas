unit UFrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.StdCtrls, RxToolEdit,
  RxCurrEdit, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, System.Math, IBX.IBDatabase;

type
  TFrmProdutos = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    PC: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    BtnConsSec: TSpeedButton;
    BtnAddSec: TSpeedButton;
    Label7: TLabel;
    Label5: TLabel;
    BtnAddLab: TSpeedButton;
    BtnConsLab: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    LQtdCupom: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label67: TLabel;
    Label73: TLabel;
    BtnConsGrupo: TSpeedButton;
    Label74: TLabel;
    Label75: TLabel;
    BtnConsSubGrupo: TSpeedButton;
    Label76: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label82: TLabel;
    LQtdNome: TLabel;
    Label14: TLabel;
    BtnConsUndEntrada: TSpeedButton;
    Label15: TLabel;
    Label72: TLabel;
    BtnConsUndSaida: TSpeedButton;
    Label89: TLabel;
    Label50: TLabel;
    Image1: TImage;
    EdtNome: TEdit;
    EdtDescCupom: TEdit;
    EdtNomeSec: TEdit;
    EdtNomeMarca: TEdit;
    EdtValor: TCurrencyEdit;
    EdtPromocao: TCurrencyEdit;
    EdtEstMin: TCurrencyEdit;
    EdtMargem: TCurrencyEdit;
    ComboTipo: TComboBox;
    EdtNomeGrupo: TEdit;
    EdtNomeSubGrupo: TEdit;
    EdtPrecoPrazo: TCurrencyEdit;
    ComboTipoProducao: TComboBox;
    EdtCodBarra: TEdit;
    GroupBox1: TGroupBox;
    CheckAtivo: TCheckBox;
    CheckComplemento: TCheckBox;
    CheckControlaEstoque: TCheckBox;
    EdtNomeUndEntrada: TEdit;
    EdtNomeUndSaida: TEdit;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    ImageList: TImageList;
    OpenPicture: TOpenPictureDialog;
    EdtCodMarca: TEdit;
    edtCodGrupo: TEdit;
    edtCodUniEnt: TEdit;
    QtdEstoque: TCurrencyEdit;
    Edit1: TEdit;
    edtCodSec: TEdit;
    edtSubCodGrupo: TEdit;
    edtCodUniSai: TEdit;
    edtCod: TEdit;
    btFiltro: TButton;
    Q_Consulta_filtro: TIBQuery;
    Q_Consulta_filtroCOD_PRO: TIntegerField;
    Q_Consulta_filtroCODIGO_BARRA_PRO: TIBStringField;
    Q_Consulta_filtroTP_PRODUTO: TIBStringField;
    Q_Consulta_filtroTP_PRODUCAO: TIBStringField;
    Q_Consulta_filtroESTOQUE_MINIMO: TIBBCDField;
    Q_Consulta_filtroNOME_PRO: TIBStringField;
    Q_Consulta_filtroDESC_CUPOM: TIBStringField;
    Q_Consulta_filtroCOD_MARC: TIntegerField;
    Q_Consulta_filtroCOD_SEC: TIntegerField;
    Q_Consulta_filtroCOD_GRUP: TIntegerField;
    Q_Consulta_filtroCOD_SGRUP: TIntegerField;
    Q_Consulta_filtroCOD_UNI_ENT: TIntegerField;
    Q_Consulta_filtroCOD_UNI_SAI: TIntegerField;
    Q_Consulta_filtroPRECO_VAREJO: TIBBCDField;
    Q_Consulta_filtroPRECO_PROMOCAO: TIBBCDField;
    Q_Consulta_filtroPRECO_PRAZO: TIBBCDField;
    Q_Consulta_filtroMARGEM_LUCRO: TIBBCDField;
    Q_Consulta_filtroQUANT_ESTOQ: TIBBCDField;
    Q_Consulta_filtroDATA_VALIDADE: TDateField;
    Q_Consulta_filtroDIAS_VALIDADE_PRO: TIntegerField;
    Q_Consulta_filtroCONTROLA_ESTOQUE_PRO: TIBStringField;
    Q_Consulta_filtroATIVO_PRO: TIBStringField;
    Q_Consulta_filtroCAMINHO_FOTO_PRO: TBlobField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkPropertyToFieldValue: TLinkPropertyToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkPropertyToFieldValue2: TLinkPropertyToField;
    LinkPropertyToFieldValue3: TLinkPropertyToField;
    LinkPropertyToFieldValue4: TLinkPropertyToField;
    LinkPropertyToFieldValue5: TLinkPropertyToField;
    LinkPropertyToFieldValue6: TLinkPropertyToField;
    Q_Marcas: TIBQuery;
    Q_MarcasCODIGO: TIntegerField;
    Q_MarcasDESCRICAO: TIBStringField;
    Q_Grupos: TIBQuery;
    Q_secao: TIBQuery;
    Q_SubGrupos: TIBQuery;
    Q_UnidEnt: TIBQuery;
    Q_UnidSai: TIBQuery;
    Q_secaoCOD_SEC: TIntegerField;
    Q_secaoNOME_SEC: TIBStringField;
    Q_GruposCOD_SEC: TIntegerField;
    Q_GruposCOD_GRUPO: TIntegerField;
    Q_GruposDESCRICAO: TIBStringField;
    Q_SubGruposCOD_SEC: TIntegerField;
    Q_SubGruposCOD_GRUPO: TIntegerField;
    Q_SubGruposCOD_SUBGRUPO: TIntegerField;
    Q_SubGruposDESCRICAO: TIBStringField;
    Q_UnidEntCODIGO: TIntegerField;
    Q_UnidEntDESCRICAO: TIBStringField;
    Q_UnidSaiCODIGO: TIntegerField;
    Q_UnidSaiDESCRICAO: TIBStringField;
    QConsultaCod: TIBQuery;
    QConsultaCodCOD_PRO: TIntegerField;
    QConsultaCodCODIGO_BARRA_PRO: TIBStringField;
    QConsultaCodTP_PRODUTO: TIBStringField;
    QConsultaCodTP_PRODUCAO: TIBStringField;
    QConsultaCodESTOQUE_MINIMO: TIBBCDField;
    QConsultaCodNOME_PRO: TIBStringField;
    QConsultaCodDESC_CUPOM: TIBStringField;
    QConsultaCodCOD_MARC: TIntegerField;
    QConsultaCodCOD_SEC: TIntegerField;
    QConsultaCodCOD_GRUP: TIntegerField;
    QConsultaCodCOD_SGRUP: TIntegerField;
    QConsultaCodCOD_UNI_ENT: TIntegerField;
    QConsultaCodCOD_UNI_SAI: TIntegerField;
    QConsultaCodPRECO_VAREJO: TIBBCDField;
    QConsultaCodPRECO_PROMOCAO: TIBBCDField;
    QConsultaCodPRECO_PRAZO: TIBBCDField;
    QConsultaCodMARGEM_LUCRO: TIBBCDField;
    QConsultaCodQUANT_ESTOQ: TIBBCDField;
    QConsultaCodDATA_VALIDADE: TDateField;
    QConsultaCodDIAS_VALIDADE_PRO: TIntegerField;
    QConsultaCodCONTROLA_ESTOQUE_PRO: TIBStringField;
    QConsultaCodATIVO_PRO: TIBStringField;
    QConsultaCodCAMINHO_FOTO_PRO: TBlobField;
    Image2: TImage;
    QCodBarras: TIBQuery;
    edtCodrecuperado: TEdit;
    EdtDataValidade: TDateEdit;
    LinkPropertyToFieldDate: TLinkPropertyToField;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    QPrecoCusto: TIBQuery;
    QPrecoCustoPRECO_CUSTO: TIBBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao: string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsLabClick(Sender: TObject);
    procedure BtnAddLabClick(Sender: TObject);
    procedure EdtCodMarcaChange(Sender: TObject);
    procedure edtCodSecChange(Sender: TObject);
    procedure edtCodGrupoChange(Sender: TObject);
    procedure edtSubCodGrupoChange(Sender: TObject);
    procedure edtCodUniEntChange(Sender: TObject);
    procedure edtCodUniSaiChange(Sender: TObject);
    procedure BtnConsSecClick(Sender: TObject);
    procedure BtnAddSecClick(Sender: TObject);
    procedure BtnConsUndEntradaClick(Sender: TObject);
    procedure BtnConsUndSaidaClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure BtnConsSubGrupoClick(Sender: TObject);
    procedure EdtNomeChange(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure EdtMargemChange(Sender: TObject);
    procedure EdtMargemExit(Sender: TObject);
    procedure EdtCodBarraChange(Sender: TObject);
    procedure EdtCodBarraExit(Sender: TObject);
    procedure EdtCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataValidade1Exit(Sender: TObject);
    procedure EdtPrecoPrazoChange(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure EdtPromocaoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure GerarCodigo(Codigo: string; Canvas: TCanvas);
  public
    { Public declarations }
    function RoundCurrency(const Value: Currency; const nk: Integer): Currency;
    function ValidaGTIN(AGTIN: string): boolean;
    function GeneratorID(aName: string; Connection: TIBDatabase; Incrementa: Boolean): integer;


  end;

var
  FrmProdutos: TFrmProdutos;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsProduto, UConsFrmMarcas, UFrmMarcas,
  UFrmConsSecao, UFrmSecaoGrupo, UFrmConsUnidMedidas, UFrmConsGrupo,
  UFrmConsSubGrupo, UProdutoComposicao;

function ZeroaEsquerda(vZero: string; vQtd: integer): string;
var
  i, vTam: integer;
  vAux: string;
begin
  vAux := vZero;
  vTam := length( vZero );
  vZero := '';
  for i := 1 to vQtd - vTam do
    vZero := '0' + vZero;
    vAux := vZero + vAux;
    result := vAux;

end;

procedure TFrmProdutos.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutosComposicao,FrmProdutosComposicao);
  FrmProdutosComposicao.pnlProduto.Caption := EdtNome.Text;
  FrmProdutosComposicao.spCodProdComp.Value := StrToInt(Edit1.Text);
  FrmProdutosComposicao.ShowModal;
  FrmProdutosComposicao.Hide;
  FrmProdutosComposicao.Free;
end;

procedure TFrmProdutos.Botoes(acao: string);
begin
  { (N)OVO
    (G)RAVAR
    (C)ANCELAR
    (A)LTERAR
    (E)EXCLUIR
    (P)ESQUISAR/CONSULTAR }

  if (acao = 'N') or (acao = 'A') then
  begin
    EDedit(FrmProdutos, true);
    BtnNovo.Enabled := false;
    BtnGravar.Enabled := true;
    BtnCancelar.Enabled := true;
    BtnAlterar.Enabled := false;
    if acao = 'N' then
    begin
      Limpaedit(FrmProdutos);
      BtnExcluir.Enabled := false
    end
    else
      BtnExcluir.Enabled := true;
    BtnConsultar.Enabled := false;
  end
  else
  begin
    if not(acao = 'G') then
      Limpaedit(FrmProdutos);
    EDedit(FrmProdutos, false);
    BtnNovo.Enabled := true;
    BtnGravar.Enabled := false;
    BtnCancelar.Enabled := false;
    if (acao = 'C') or (acao = 'E') then
      BtnAlterar.Enabled := false
    else
      BtnAlterar.Enabled := true;
    if acao = 'G' then
      BtnExcluir.Enabled := true
    else
      BtnExcluir.Enabled := false;
    BtnConsultar.Enabled := true;
  end;
end;

procedure TFrmProdutos.btFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    if not(DmDados.tb_produtos.Active) then
    begin
      DmDados.tb_produtos.Open;
    end;

    with DmDados.tb_produtos do
    begin
      DmDados.tb_produtos.Close;
      DmDados.tb_produtos.Open;
      Filtered := false;
      Filter := 'COD_PRO = ' + QuotedStr(trim(edtCod.Text));
      Filtered := true;
    end;

    if (DmDados.tb_produtosATIVO_PRO.Value = 'S') then
    begin
      CheckAtivo.Checked := true;
    end
    else
    begin
      CheckAtivo.Checked := false;
    end;

    if (DmDados.tb_produtosCONTROLA_ESTOQUE_PRO.Value = 'S') then
    begin
      CheckControlaEstoque.Checked := true;
    end
    else
    begin
      CheckControlaEstoque.Checked := false;
    end;

    ComboTipo.ItemIndex := 0;

    ComboTipoProducao.ItemIndex := 1;

  end
  else
  begin
    DmDados.tb_produtos.Close;
  end;
end;

procedure TFrmProdutos.BtnAddLabClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMarcas, frmMarcas);
  frmMarcas.Tag := 0;
  frmMarcas.Showmodal;
  frmMarcas.Hide;
  frmMarcas.Free;
end;

procedure TFrmProdutos.BtnAddSecClick(Sender: TObject);
begin
  Application.CreateForm(TFrmSecaoGrupo, FrmSecaoGrupo);
  FrmSecaoGrupo.Showmodal;
  FrmSecaoGrupo.Hide;
  FrmSecaoGrupo.Free;
end;

procedure TFrmProdutos.BtnAlterarClick(Sender: TObject);
begin
  FrmProdutos.Tag := 1;
  DmDados.tb_produtos.Open;
  Botoes('A');
  EdtDataValidade.Enabled := True;
  EdtNome.SetFocus;
end;

procedure TFrmProdutos.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
  EdtDataValidade.Enabled := false;
  DmDados.tb_produtos.Close;
end;

procedure TFrmProdutos.BtnConsGrupoClick(Sender: TObject);
begin
  if trim(edtCodSec.Text) = '' then
    exit;
  Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
  FrmConsGrupo.Tag := 1;
  FrmConsGrupo.Showmodal;
end;

procedure TFrmProdutos.BtnConsLabClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsMarcas, FrmConsMarcas);
  FrmConsMarcas.Tag := 1;
  DmDados.tb_classifica_cliente.Open;
  FrmConsMarcas.Showmodal;
  FrmConsMarcas.Hide;
  FrmConsMarcas.Free;
end;

procedure TFrmProdutos.BtnConsSecClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSecao, FrmConsSecao);
  FrmConsSecao.Tag := 1;
  FrmConsSecao.Showmodal;
  FrmConsSecao.Hide;
  FrmConsSecao.Free;
end;

procedure TFrmProdutos.BtnConsSubGrupoClick(Sender: TObject);
begin
  { if (trim(edtSubCodGrupo.Text) = '') or (trim(EdtCodGrupo.Text) = '') then
    exit; }
  Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
  FrmConsSubGrupo.Tag := 1;
  FrmConsSubGrupo.Showmodal;
end;

procedure TFrmProdutos.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProduto, FrmConsProduto);
  FrmConsProduto.Tag := 0;
  DmDados.tb_produtos.Open;
  FrmConsProduto.Showmodal;
  FrmConsProduto.Hide;
  FrmConsProduto.Free;
end;

procedure TFrmProdutos.BtnConsUndEntradaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsUnidMedidas, FrmConsUnidMedidas);
  FrmConsUnidMedidas.Tag := 1;
  FrmConsUnidMedidas.Showmodal;
  FrmConsUnidMedidas.Hide;
  FrmConsUnidMedidas.Free;
end;

procedure TFrmProdutos.BtnConsUndSaidaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsUnidMedidas, FrmConsUnidMedidas);
  FrmConsUnidMedidas.Tag := 2;
  FrmConsUnidMedidas.Showmodal;
  FrmConsUnidMedidas.Hide;
  FrmConsUnidMedidas.Free;
end;

procedure TFrmProdutos.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('PRODUTO', 'COD_PRO', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmProdutos.BtnGravarClick(Sender: TObject);
begin
  if trim(EdtNome.Text) = '' then
  begin
    showmessage('Digite o Nome do cliente');
    EdtNome.SetFocus;
    exit;
  end;

  try
    try
      with DmDados.Q_executa do
      begin
        Close;
        sql.Clear;
        if (FrmProdutos.Tag = 0) then // Grava um novo reristro
        begin
          sql.Add('INSERT INTO PRODUTO(CODIGO_BARRA_PRO,TP_PRODUTO,TP_PRODUCAO,ESTOQUE_MINIMO,NOME_PRO,DESC_CUPOM,COD_MARC,COD_SEC,COD_GRUP,COD_SGRUP,COD_UNI_ENT,'
            + '  COD_UNI_SAI,PRECO_VAREJO,PRECO_PROMOCAO,PRECO_PRAZO,MARGEM_LUCRO,QUANT_ESTOQ,DATA_VALIDADE,DIAS_VALIDADE_PRO,CONTROLA_ESTOQUE_PRO,ATIVO_PRO,CAMINHO_FOTO_PRO)'
            + 'VALUES(:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,:17,:18,:19,:20,:21,:22,:23)');
        end
        else
        begin
          sql.Add('UPDATE');
          sql.Add(' PRODUTO');
          sql.Add(' SET');
          sql.Add(' CODIGO_BARRA_PRO = :2,');
          sql.Add(' TP_PRODUTO = :3,');
          sql.Add(' TP_PRODUCAO = :4,');
          sql.Add(' ESTOQUE_MINIMO = :5,');
          sql.Add(' NOME_PRO = :6,');
          sql.Add(' DESC_CUPOM = :7,');
          sql.Add(' COD_MARC = :8,');
          sql.Add(' COD_SEC = :9,');
          sql.Add(' COD_GRUP = :10,');
          sql.Add(' COD_SGRUP = :11,');
          sql.Add(' COD_UNI_ENT = :12,');
          sql.Add(' COD_UNI_SAI = :13,');
          sql.Add(' PRECO_VAREJO = :14,');
          sql.Add(' PRECO_PROMOCAO = :15,');
          sql.Add(' PRECO_PRAZO = :16,');
          sql.Add(' MARGEM_LUCRO = :17,');
          sql.Add(' QUANT_ESTOQ = :18,');
          sql.Add(' DATA_VALIDADE = :19,');
          sql.Add(' DIAS_VALIDADE_PRO = :20,');
          sql.Add(' CONTROLA_ESTOQUE_PRO = :21,');
          sql.Add(' ATIVO_PRO = :22,');
          sql.Add(' CAMINHO_FOTO_PRO = :23');
          sql.Add(' WHERE');
          sql.Add(' PRODUTO.COD_PRO = :1');
          Parambyname('1').AsInteger := strtoint(Edit1.Text);
        end;

        Parambyname('2').AsString := EdtCodBarra.Text;
        Parambyname('3').Value := ComboTipo.Text;
        Parambyname('4').Value := ComboTipoProducao.Text;
        Parambyname('5').Value := EdtEstMin.Text;
        Parambyname('6').AsString := EdtNome.Text;
        Parambyname('7').AsString := EdtDescCupom.Text;
        Parambyname('8').AsString := EdtCodMarca.Text;
        Parambyname('9').AsString := edtCodSec.Text;
        Parambyname('10').AsString := edtCodGrupo.Text;
        Parambyname('11').AsString := edtSubCodGrupo.Text;
        Parambyname('12').AsString := edtCodUniEnt.Text;
        Parambyname('13').AsString := edtCodUniSai.Text;
        Parambyname('14').Value := EdtValor.Value;

        Parambyname('15').Value := EdtPromocao.Value;
        Parambyname('16').Value := EdtPrecoPrazo.Value;
        Parambyname('17').Value := EdtMargem.Value;
        Parambyname('18').Value := QtdEstoque.Value;

        { try
          Parambyname('19').Value     := EdtDataValidade.Text;
          except
          Parambyname('19').Value     := null;
          end; }

        if (EdtDataValidade.Text = '  /  /    ') then
        begin
          Parambyname('19').AsString  := '';
        end
        else
        begin
          Parambyname('19').AsString := EdtDataValidade.Text;
        end;

        Parambyname('20').Value := 0;

        if (CheckControlaEstoque.Checked) then
        begin
          Parambyname('21').AsString := 'S';
        end
        else
        begin
          Parambyname('21').AsString := 'N';
        end;

        if (CheckAtivo.Checked) then
        begin
          Parambyname('22').AsString := 'S';
        end
        else
        begin
          Parambyname('22').AsString := 'N';
        end;

        Parambyname('23').Value := '';

        ExecSQL;
      end;
      DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');
      EdtDataValidade.Enabled := false;

      with QConsultaCod do
      begin
        Close;
        Parambyname('nm').Value := EdtNome.Text;
        Open;
      end;

      if (QConsultaCod.RecordCount > 0) then
      begin
        Edit1.Text := trim(QConsultaCodCOD_PRO.AsString);
      end;

      if (FrmProdutos.Tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!', 'Informação',
          mb_OK + MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!',
          'Informação', mb_OK + MB_ICONINFORMATION);
      end;
    except
      on e: exception do
      begin
        DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Cliente!' + #13 + #13 +
          e.Message), 'Informação', mb_OK + MB_ICONERROR);
      end;
    end;
  finally
    { DmDados.tb_empresa.Close;
      DmDados.tb_empresa.Open; }
  end;
end;

procedure TFrmProdutos.BtnNovoClick(Sender: TObject);
var
  IDProd: Integer;
begin
  FrmProdutos.Tag := 0;
  DmDados.tb_produtos.Close;
  Botoes('N');
  EdtDataValidade.Enabled := True;
  IDProd := GeneratorID('GEN_PRODUTO_ID', DmDados.Conexao, False)+1;
  edtCodrecuperado.Text := IntToStr(IDProd);
  EdtCodBarra.SetFocus;
end;

procedure TFrmProdutos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdutos.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') then
  begin
    with QPrecoCusto do
    begin
      close;
      Parambyname('codpro').Value := StrToInt(Edit1.Text);
      Open;
      FetchAll;
    end;

    if (QPrecoCusto.RecordCount > 0 ) then
    begin
      //ShowMessage('Tem registros');
      EdtPrecoPrazo.Value := QPrecoCustoPRECO_CUSTO.Value;
    end;
  end;
end;

procedure TFrmProdutos.EdtCodBarraChange(Sender: TObject);
begin
  //GerarCodigo(EdtCodBarra.Text, Image2.Canvas);
end;

procedure TFrmProdutos.EdtCodBarraExit(Sender: TObject);
begin
  {if (EdtCodBarra.Text = '') then
  begin
    if application.MessageBox('O produto não possui cópdigo de barras deseja gerar?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin
        EdtCodBarra.Text := '789'+ZeroaEsquerda(edtCodrecuperado.Text,10);
        if (EdtCodBarra.Text <> '') then
        begin
          GeraBarrasEAN13(EdtCodBarra.Text, Image2.Canvas);
        end;
      end;
  end
  else
  begin
    GeraBarrasEAN13(EdtCodBarra.Text, Image2.Canvas);
  end;}
end;

procedure TFrmProdutos.EdtCodBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
      if (EdtCodBarra.Text = '') then
      begin
        if application.MessageBox('O produto não possui cópdigo de barras deseja gerar?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
          begin
            EdtCodBarra.Text := '789'+ZeroaEsquerda(Edit1.Text,5);
            if (EdtCodBarra.Text <> '') then
            begin
              //GeraBarrasEAN13(EdtCodBarra.Text, Image2.Canvas);
            end;
          end;
      end
      else
      begin
        //GeraBarrasEAN13(EdtCodBarra.Text, Image2.Canvas);
      end;
  end;
end;

procedure TFrmProdutos.edtCodGrupoChange(Sender: TObject);
begin
  if (edtCodGrupo.Text <> '') then
  begin
    with Q_Grupos do
    begin
      Close;
      Parambyname('cod').Value := edtCodGrupo.Text;
      Parambyname('cod_sec').Value := edtCodSec.Text;
      Open;
      FetchAll;
    end;

    if (Q_Grupos.RecordCount > 0) then
    begin
      EdtNomeGrupo.Text := Q_GruposDESCRICAO.AsString;
    end
    else
    begin
      EdtNomeGrupo.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.EdtCodMarcaChange(Sender: TObject);
begin
  if (EdtCodMarca.Text <> '') then
  begin
    with Q_Marcas do
    begin
      Close;
      Parambyname('cod').Value := trim(EdtCodMarca.Text);
      Open;
      FetchAll;
    end;

    if (Q_Marcas.RecordCount > 0) then
    begin
      EdtNomeMarca.Text := Q_MarcasDESCRICAO.AsString;
    end
    else
    begin
      EdtNomeMarca.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.edtCodSecChange(Sender: TObject);
begin
  if (edtCodSec.Text <> '') then
  begin
    with Q_secao do
    begin
      Close;
      Parambyname('cod').Value := edtCodSec.Text;
      Open;
      FetchAll;
    end;

    if (Q_secao.RecordCount > 0) then
    begin
      EdtNomeSec.Text := Q_secaoNOME_SEC.AsString;
    end
    else
    begin
      EdtNomeSec.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.edtCodUniEntChange(Sender: TObject);
begin
  if (edtCodUniEnt.Text <> '') then
  begin
    with Q_UnidEnt do
    begin
      Close;
      Parambyname('cod').Value := edtCodUniEnt.Text;
      Open;
    end;

    if (Q_UnidEnt.RecordCount > 0) then
    begin
      EdtNomeUndEntrada.Text := Q_UnidEntDESCRICAO.AsString;
    end
    else
    begin
      EdtNomeUndEntrada.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.edtCodUniSaiChange(Sender: TObject);
begin
  if (edtCodUniSai.Text <> '') then
  begin
    with Q_UnidSai do
    begin
      Close;
      Parambyname('cod').Value := edtCodUniSai.Text;
      Open;
    end;

    if (Q_UnidSai.RecordCount > 0) then
    begin
      EdtNomeUndSaida.Text := Q_UnidSaiDESCRICAO.AsString;
    end
    else
    begin
      EdtNomeUndSaida.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.EdtDataValidade1Exit(Sender: TObject);
{var
  Data : TDate;
  DataPrenchidaErrada : boolean;}
begin
   {try
      Data := StrToDate( EdtDataValidade.Text );
      DataPrenchidaErrada:=False;
   Except // <-- Aqui vai tratar se existir erro na data
      EdtDataValidade.EditMask := '99/99/9999;1; ';
      ShowMessage('Data Inválida');
      EdtDataValidade.SetFocus;
      DataPrenchidaErrada:=True;
   end;   }
end;

procedure TFrmProdutos.EdtMargemChange(Sender: TObject);
begin
  if (EdtMargem.Value <> 0) then
  begin
    EdtValor.Value := (EdtPrecoPrazo.Value +
      (EdtPrecoPrazo.Value * EdtMargem.Value / 100));

    EdtValor.Value := RoundCurrency(EdtValor.Value,4);
  end
  else
  begin
    EdtValor.Value := EdtPrecoPrazo.Value;
  end;
end;

procedure TFrmProdutos.EdtMargemExit(Sender: TObject);
begin
{  if (EdtMargem.Value <> 0) then
  begin
    EdtValor.Value := (EdtPrecoPrazo.Value +
      (EdtPrecoPrazo.Value * EdtMargem.Value / 100));

    EdtValor.Value := RoundCurrency(EdtValor.Value,4);
  end
  else
  begin
    EdtValor.Value := EdtPrecoPrazo.Value;
  end;}
end;

procedure TFrmProdutos.EdtNomeChange(Sender: TObject);
begin
  EdtDescCupom.Text := EdtNome.Text;
end;

procedure TFrmProdutos.EdtNomeExit(Sender: TObject);
begin
  EdtDescCupom.Text := EdtNome.Text;
end;

procedure TFrmProdutos.EdtPrecoPrazoChange(Sender: TObject);
{var
  custo, lucro : Currency;
  Margem_de_lucro : Double; }
begin
{    custo := EdtPrecoPrazo.Value;

    if (EdtValor.Value <> 0) then
    begin
      lucro:= EdtValor.Value;
    end
    else
    begin
      lucro:= EdtPromocao.Value;
    end;

    lucro := lucro - custo;

    Margem_de_lucro := ((lucro / custo) * 100);

    EdtMargem.Value := Margem_de_lucro;}

end;

procedure TFrmProdutos.EdtPromocaoChange(Sender: TObject);
begin
  EdtPrecoPrazoChange(Self);
end;

procedure TFrmProdutos.edtSubCodGrupoChange(Sender: TObject);
begin
  if (edtSubCodGrupo.Text <> '') then
  begin
    with Q_SubGrupos do
    begin
      Close;
      Parambyname('cod_sub').Value := edtSubCodGrupo.Text;
      Parambyname('cod_sec').Value := edtCodSec.Text;
      Parambyname('cod_grup').Value := edtCodGrupo.Text;
      Open;
      FetchAll;
    end;

    if (Q_SubGrupos.RecordCount > 0) then
    begin
      EdtNomeSubGrupo.Text := Q_SubGruposDESCRICAO.AsString;
    end
    else
    begin
      EdtNomeSubGrupo.Text := 'Nada foi encontrado...'
    end;
  end;
end;

procedure TFrmProdutos.EdtValorChange(Sender: TObject);
begin
  EdtPrecoPrazoChange(Self);
end;

procedure TFrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Escape) then
    Close;

  if (Key = vk_F6) then
    BtnGravarClick(Self);

end;

procedure TFrmProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
  if (EdtPrecoPrazo.Value <> 0) then
  begin
    BtnNovoClick(Self);
  end;

  EdtPrecoPrazoChange(Self);
end;

function TFrmProdutos.GeneratorID(aName: string; Connection: TIBDatabase;
  Incrementa: Boolean): integer;
var
    Qry: TIBQuery;
begin
    Qry := TIBQuery.Create(nil);
    try
        Qry.Database := Connection;
        if Incrementa then
            Qry.SQL.Add(
                'SELECT GEN_ID(' + aName + ', 1) FROM RDB$DATABASE')
        else
            Qry.SQL.Add(
                'SELECT GEN_ID(' + aName + ', 0) FROM RDB$DATABASE');
        Qry.Open;
        Result := Qry.Fields[0].AsInteger;
    finally
        FreeAndNil(Qry);
    end;
end;


procedure TFrmProdutos.GerarCodigo(Codigo: string; Canvas: TCanvas);
const
  digitos: array['0'..'9'] of string[5] = ('00110', '10001', '01001', '11000', '00101', '10100', '01100', '00011', '10010', '01010'); var s: string; i, j, x, t: Integer;
begin
    // Gerar o valor para desenhar o código de barras
    // Caracter de início
    s := '0000';
    for i := 1 to length(codigo) div 2 do
        for j := 1 to 5 do
            s := s + Copy(Digitos[codigo[i * 2 - 1]], j, 1) + Copy(Digitos[codigo[i * 2]], j, 1);
    // Caracter de fim
    s := s + '100';
    // Desenhar em um objeto canvas
    // Configurar os parâmetros iniciais
    x := 0;
    // Pintar o fundo do código de branco
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color := clWhite;
    Canvas.Rectangle(0, 0, 2000, 79);
    // Definir as cores da caneta
    Canvas.Brush.Color := clBlack;
    Canvas.Pen.Color := clBlack;
    // Escrever o código de barras no canvas
    for i := 1 to length(s) do begin
        // Definir a espessura da barra
        t := strToInt(s[i]) * 2 + 1;
        // Imprimir apenas barra sim barra não (preto / branco - intercalado);
        if i mod 2 = 1 then Canvas.Rectangle(x, 0, x + t, 79);
        // Passar para a próxima barra
        x := x + t; end;
end;

function TFrmProdutos.RoundCurrency(const Value: Currency; const nk: Integer)
  : Currency;

const
  faktors: array [-3 .. 3] of Integer = (10000000, 1000000, 100000, 10000,
    1000, 100, 10);

var
  x: Int64;
  y: Int64;

begin
  { Currency tem somente 4 digitos após a vírgula decimal }
  if (nk >= 4) or (Value = 0) then
  begin
    Result := Value;
    exit;
  end;

  if nk < Low(faktors) then
    raise EInvalidArgument.CreateFmt('RoundCurrency(,%d): invalid arg', [nk]);
  { cast de Currency para Int64 }
  x := PInt64(@Value)^;
  y := faktors[nk];
  { arredondando }
  if x > 0 then
    x := ((x + (y div 2)) div y) * y
  else
    x := ((x - (y div 2)) div y) * y;
  { cast de Int64 para Currency }
  Result := PCurrency(@x)^;
end;

function TFrmProdutos.ValidaGTIN(AGTIN: string): boolean;
var
    i, soma, resultado, base10: integer;
begin
  //Verifica se todos os caracteres de AGTIN são números
    for i := 1 to Length(AGTIN) do
        if not (AGTIN[i] in ['0'..'9']) then
        begin
            Result := False;
            Exit;
        end;
  //Verifica se AGTIN tem o tamanho necessário
    if Length(AGTIN) in [8, 12, 13, 14] then
    begin
        soma := 0;
        for i := 1 to (Length(AGTIN) - 1) do
        begin
            if Length(AGTIN) = 13 then
            begin
                if Odd(i) then
                    soma := soma + (strtoint(AGTIN[i]) * 1)
                else
                    soma := soma + (strtoint(AGTIN[i]) * 3);
            end
            else
            begin
                if Odd(i) then
                    soma := soma + (strtoint(AGTIN[i]) * 3)
                else
                    soma := soma + (strtoint(AGTIN[i]) * 1);
            end;
        end;
        base10 := soma;
    //Verifica se base10 é múltiplo de 10
        if not (base10 mod 10 = 0) then
        begin
            while not (base10 mod 10 = 0) do
            begin
                base10 := base10 + 1;
            end;
        end;
        resultado := base10 - soma;
    //Verifica se o resultado encontrado é igual ao caractere de controle
        if resultado = strtoint(AGTIN[Length(AGTIN)]) then
            Result := True
        else
            Result := False;
    end
    else
        Result := False;
end;

end.
