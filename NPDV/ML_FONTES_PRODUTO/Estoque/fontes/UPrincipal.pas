unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.XPMan, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Buttons, UClientes, Vcl.Samples.Spin;

type
  TFrmPrincipal = class(TForm)
    Pprincipal: TPanel;
    SB: TStatusBar;
    Menu: TMainMenu;
    C00: TMenuItem;
    C1: TMenuItem;
    Produto1: TMenuItem;
    C007: TMenuItem;
    C006: TMenuItem;
    C027: TMenuItem;
    C031: TMenuItem;
    Cliente1: TMenuItem;
    C008: TMenuItem;
    C009: TMenuItem;
    C002: TMenuItem;
    Vendedor1: TMenuItem;
    FormasdePagamentos1: TMenuItem;
    C026: TMenuItem;
    N1: TMenuItem;
    S002: TMenuItem;
    M00: TMenuItem;
    M001: TMenuItem;
    N5: TMenuItem;
    M013: TMenuItem;
    R00: TMenuItem;
    Cadastro3: TMenuItem;
    R002: TMenuItem;
    R004: TMenuItem;
    R019: TMenuItem;
    Cliente4: TMenuItem;
    R008: TMenuItem;
    R011: TMenuItem;
    Movimento3: TMenuItem;
    Entradas3: TMenuItem;
    Vendas3: TMenuItem;
    R119: TMenuItem;
    InventriodeEstoque1: TMenuItem;
    R111: TMenuItem;
    R113: TMenuItem;
    R137: TMenuItem;
    S00: TMenuItem;
    Panel1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Marcas1: TMenuItem;
    N2: TMenuItem;
    Vendedor2: TMenuItem;
    Marcas2: TMenuItem;
    SpeedButton2: TSpeedButton;
    Usurios1: TMenuItem;
    SpCod_Usuario: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image2: TImage;
    ControledeCredirio1: TMenuItem;
    procedure btn5Click(Sender: TObject);
    procedure S002Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure C009Click(Sender: TObject);
    procedure C002Click(Sender: TObject);
    procedure C007Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure C006Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure FormasdePagamentos1Click(Sender: TObject);
    procedure C026Click(Sender: TObject);
    procedure C008Click(Sender: TObject);
    procedure S00Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure C027Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure R002Click(Sender: TObject);
    procedure R019Click(Sender: TObject);
    procedure Cliente4Click(Sender: TObject);
    procedure Vendedor2Click(Sender: TObject);
    procedure R008Click(Sender: TObject);
    procedure R011Click(Sender: TObject);
    procedure Marcas2Click(Sender: TObject);
    procedure M001Click(Sender: TObject);
    procedure R137Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure R111Click(Sender: TObject);
    procedure R113Click(Sender: TObject);
    procedure Vendas3Click(Sender: TObject);
    procedure Entradas3Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure R119Click(Sender: TObject);
    procedure ControledeCredirio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbaixodoEstoque;
    procedure Vencendo;
    procedure Vencidos;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UEmpresa, UFornecedor, UFrmVendedor, UFrmProdutos, UFrmSecaoGrupo,
  UFrmFPagamentos, UFrmAdmCartao, UFrmClassificaCliente, UFrmConsClientes,
  UFrmUnidadesMedidas, UFrmMarcas, UFrmRelForn, UFrmRelProdutos,
  UFrmRelClientes, UFrmRelVendedores, UFrmRelClientesG, UFrmRelSecaoGrupo,
  UFrmRelMarcas, UFrmOutrasEntradas, UFrmOutrasSaidas, UFrmConsultaEstoque,
  UFrmRelVendas, UFrmRelEntradas, UFrmUsuarios, Udm, UFrmLogin,
  UFrmQRelEstoqueMinimo, UFrmRelOutrasSaidas1, UFrmQRelEstoqueMinimo2,
  UFrmControleCredito;

procedure TFrmPrincipal.AbaixodoEstoque;
var sAuxSql : string;
    sAuxEstoque : string;
begin
    sAuxSql:= ' WHERE ';

    with DmDados.Q_Produtos do
    begin
       close;
       sql.clear;
       sql.Add('SELECT');
       sql.Add('   PRODUTO.COD_PRO,');
       sql.Add('   PRODUTO.CODIGO_BARRA_PRO,');
       sql.Add('   PRODUTO.ESTOQUE_MINIMO,');
       sql.Add('   PRODUTO.QUANT_ESTOQ,');
       sql.Add('   PRODUTO.NOME_PRO,');
       sql.Add('   PRODUTO.PRECO_VAREJO,');
       sql.Add('   PRODUTO.PRECO_PROMOCAO,');
       sql.Add('   PRODUTO.DATA_VALIDADE,');
       sql.Add('   MARCAS.DESCRICAO,');
       sql.Add('   SECAO.NOME_SEC,');
       sql.Add('   SECAO_GRUPO.DESCRICAO,');
       sql.Add('   SECAO_GRUPO_SUBGRUPO.DESCRICAO,');
       sql.Add('   UNIDADE_MEDIDA.DESCRICAO');
       sql.Add(' FROM');
       sql.Add('   MARCAS');
       sql.Add('   INNER JOIN PRODUTO ON (MARCAS.CODIGO = PRODUTO.COD_MARC)');
       sql.Add('   INNER JOIN SECAO ON (PRODUTO.COD_SEC = SECAO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO ON (SECAO_GRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   AND (SECAO_GRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   INNER JOIN SECAO_GRUPO_SUBGRUPO ON (SECAO_GRUPO_SUBGRUPO.COD_SUBGRUPO = PRODUTO.COD_SGRUP)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_SEC = PRODUTO.COD_SEC)');
       sql.Add('   AND (SECAO_GRUPO_SUBGRUPO.COD_GRUPO = PRODUTO.COD_GRUP)');
       sql.Add('   INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MEDIDA.CODIGO)');
       sql.Add(' AND PRODUTO.QUANT_ESTOQ < PRODUTO.ESTOQUE_MINIMO');
       sql.Add(' ORDER BY PRODUTO.NOME_PRO');
       open;
       FetchAll;
    end;

    if (DmDados.Q_Produtos.RecordCount > 0) then
    begin
      Label2.Caption := IntToStr(DmDados.Q_Produtos.RecordCount)+' Produtos';
    end
    else
    begin
      Label2.Caption := '0 Produtos';
    end;

end;

procedure TFrmPrincipal.btn1Click(Sender: TObject);
begin
  C002Click(Self);
end;

procedure TFrmPrincipal.btn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmOutrasSaidas,FrmOutrasSaidas);
  FrmOutrasSaidas.Tag := 0;
  FrmOutrasSaidas.Showmodal;
  FrmOutrasSaidas.Hide;
  FrmOutrasSaidas.Free;
end;

procedure TFrmPrincipal.btn3Click(Sender: TObject);
begin
  WinExec('PDV.exe', SW_SHOW);
end;

procedure TFrmPrincipal.btn4Click(Sender: TObject);
begin
  C007Click(Self);
end;

procedure TFrmPrincipal.btn5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.C002Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFornecedor,FrmFornecedor);
  FrmFornecedor.Showmodal;
  FrmFornecedor.Hide;
  FrmFornecedor.Free;
end;

procedure TFrmPrincipal.C006Click(Sender: TObject);
begin
  Application.CreateForm(TFrmSecaoGrupo,FrmSecaoGrupo);
  FrmSecaoGrupo.Showmodal;
  FrmSecaoGrupo.Hide;
  FrmSecaoGrupo.Free;
end;

procedure TFrmPrincipal.C007Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutos,FrmProdutos);
  FrmProdutos.Showmodal;
  FrmProdutos.Hide;
  FrmProdutos.Free;
end;

procedure TFrmPrincipal.C008Click(Sender: TObject);
begin
  Application.CreateForm(TFrmClassificaCliente,FrmClassificaCliente);
  FrmClassificaCliente.Tag := 0;
  FrmClassificaCliente.Showmodal;
  FrmClassificaCliente.Hide;
  FrmClassificaCliente.Free;
end;

procedure TFrmPrincipal.C009Click(Sender: TObject);
begin
  Application.CreateForm(TFrmClientes,FrmClientes);
  FrmClientes.Tag := 0;
  FrmClientes.Showmodal;
  FrmClientes.Hide;
  FrmClientes.Free;
end;

procedure TFrmPrincipal.C026Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAdmCartao,FrmAdmCartao);
  FrmAdmCartao.Showmodal;
  FrmAdmCartao.Hide;
  FrmAdmCartao.Free;
end;

procedure TFrmPrincipal.C027Click(Sender: TObject);
begin
  Application.CreateForm(TFrmUnidadesMedidas,FrmUnidadesMedidas);
  FrmUnidadesMedidas.Tag := 0;
  FrmUnidadesMedidas.Showmodal;
  FrmUnidadesMedidas.Hide;
  FrmUnidadesMedidas.Free;
end;

procedure TFrmPrincipal.C1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEmpresa,FrmEmpresa);
  FrmEmpresa.Tag := 0;
  FrmEmpresa.Showmodal;
  FrmEmpresa.Hide;
  FrmEmpresa.Free;
end;

procedure TFrmPrincipal.Cliente4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelClientes,FrmRelClientes);
  FrmRelClientes.Showmodal;
  FrmRelClientes.Hide;
  FrmRelClientes.Free;
end;

procedure TFrmPrincipal.ControledeCredirio1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmControleCredito,FrmControleCredito);
  FrmControleCredito.Showmodal;
  FrmControleCredito.Hide;
  FrmControleCredito.Free;
end;

procedure TFrmPrincipal.Entradas3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEntradas,FrmRelEntradas);
  FrmRelEntradas.Showmodal;
  FrmRelEntradas.Hide;
  FrmRelEntradas.Free;
end;

procedure TFrmPrincipal.FormasdePagamentos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFPagamentos,FrmFPagamentos);
  FrmFPagamentos.Showmodal;
  FrmFPagamentos.Hide;
  FrmFPagamentos.Free;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  AbaixodoEstoque;
  Vencendo;
  Vencidos;

  {Centraliza a imagem da LOGO}
  Image2.Left := (Pprincipal.Width - Image2.Width) div 2;
  Image2.Top := (Pprincipal.Height - Image2.Height) div 2;


  Application.CreateForm(TFrrmLogin,FrrmLogin);
  FrrmLogin.ShowModal;
  FrrmLogin.Hide;
  FrrmLogin.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  //FrmConsClientes.close;
end;

procedure TFrmPrincipal.Label2Click(Sender: TObject);
begin
  AbaixodoEstoque;
  if (DmDados.Q_Produtos.RecordCount > 0) then
  begin
    FrmQRelEstoqueMinimo.QREstoque.PreviewInitialState:= wsMaximized;
    FrmQRelEstoqueMinimo.QREstoque.Preview;
  end
  else
  begin
    Application.MessageBox('Não existem produtos abaixo do mínimo!','Informação', MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFrmPrincipal.Label4Click(Sender: TObject);
begin
  Vencendo;
  if (DmDados.Q_RelVencidos.RecordCount > 0) then
  begin
    FrmQRelEstoqueMinimo2.QRLLocalEstoque.Caption := 'Relatório de Produtos Próxinos do Vencimento';
    FrmQRelEstoqueMinimo2.QREstoque.PreviewInitialState:= wsMaximized;
    FrmQRelEstoqueMinimo2.QREstoque.Preview;
  end
  else
  begin
    Application.MessageBox('Não existem produtos vencendo ainda!','Informação', MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFrmPrincipal.Label6Click(Sender: TObject);
begin
  Vencidos;
  if (DmDados.Q_RelVencidos.RecordCount > 0) then
  begin
    FrmQRelEstoqueMinimo2.QRLLocalEstoque.Caption := 'Relatório de Produtos Vencidos';
    FrmQRelEstoqueMinimo2.QREstoque.PreviewInitialState:= wsMaximized;
    FrmQRelEstoqueMinimo2.QREstoque.Preview;
  end
  else
  begin
    Application.MessageBox('Não existem produtos vencendo ainda!','Informação', MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFrmPrincipal.M001Click(Sender: TObject);
begin
  Application.CreateForm(TFrmOutrasEntradas,FrmOutrasEntradas);
  FrmOutrasEntradas.Tag := 0;
  FrmOutrasEntradas.Showmodal;
  FrmOutrasEntradas.Hide;
  FrmOutrasEntradas.Free;
end;

procedure TFrmPrincipal.Marcas1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMarcas,FrmMarcas);
  FrmMarcas.Tag := 0;
  FrmMarcas.Showmodal;
  FrmMarcas.Hide;
  FrmMarcas.Free;
end;

procedure TFrmPrincipal.Marcas2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelMarcas,FrmRelMarcas);
  FrmRelMarcas.Showmodal;
  FrmRelMarcas.Hide;
  FrmRelMarcas.Free;
end;

procedure TFrmPrincipal.R002Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelForn,FrmRelForn);
  FrmRelForn.Showmodal;
  FrmRelForn.Hide;
  FrmRelForn.Free;
end;

procedure TFrmPrincipal.R008Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelClassifica,FrmRelClassifica);
  FrmRelClassifica.Showmodal;
  FrmRelClassifica.Hide;
  FrmRelClassifica.Free;
end;

procedure TFrmPrincipal.R011Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelSecaoGrupo,FrmRelSecaoGrupo);
  FrmRelSecaoGrupo.Showmodal;
  FrmRelSecaoGrupo.Hide;
  FrmRelSecaoGrupo.Free;
end;

procedure TFrmPrincipal.R019Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProdutos,FrmRelProdutos);
  FrmRelProdutos.Caption := 'Estoque Master - Relatório de Produtos';
  FrmRelProdutos.BtnImp.Enabled := false;
  FrmRelProdutos.Showmodal;
  FrmRelProdutos.Hide;
  FrmRelProdutos.Free;
end;

procedure TFrmPrincipal.R111Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaEstoque,FrmConsultaEstoque);
  FrmConsultaEstoque.Caption := 'Estoque Master - Inventario de Estoque';
  FrmConsultaEstoque.BtnImp.Visible := false;
  FrmConsultaEstoque.BtnVis.Visible := true;
  FrmConsultaEstoque.Showmodal;
  FrmConsultaEstoque.Hide;
  FrmConsultaEstoque.Free;
end;

procedure TFrmPrincipal.R113Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaEstoque,FrmConsultaEstoque);
  FrmConsultaEstoque.Caption := 'Estoque Master - Produtos Abaixo do Mínimo';
  FrmConsultaEstoque.BtnImp.Visible := true;
  FrmConsultaEstoque.BtnVis.Visible := false;
  FrmConsultaEstoque.Showmodal;
  FrmConsultaEstoque.Hide;
  FrmConsultaEstoque.Free;
end;

procedure TFrmPrincipal.R119Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelOutrasSaidas,FrmRelOutrasSaidas);
  FrmRelOutrasSaidas.Showmodal;
  FrmRelOutrasSaidas.Hide;
  FrmRelOutrasSaidas.Free;
end;

procedure TFrmPrincipal.R137Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProdutos,FrmRelProdutos);
  FrmRelProdutos.Caption := 'Estoque Master - Impressão de Etiquetas';
  FrmRelProdutos.BtnVis.Enabled := false;
  FrmRelProdutos.Showmodal;
  FrmRelProdutos.Hide;
  FrmRelProdutos.Free;
end;

procedure TFrmPrincipal.S002Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.S00Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  C009Click(Self);
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmOutrasEntradas,FrmOutrasEntradas);
  FrmOutrasEntradas.Tag := 0;
  FrmOutrasEntradas.Showmodal;
  FrmOutrasEntradas.Hide;
  FrmOutrasEntradas.Free;
end;

procedure TFrmPrincipal.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuarios,FrmUsuarios);
  DmDados.tb_usuarios.Open;
  FrmUsuarios.Showmodal;
  FrmUsuarios.Hide;
  FrmUsuarios.Free;
end;

procedure TFrmPrincipal.Vencendo;
var sAuxSql : string;
    sAuxEstoque : string;
begin
    sAuxSql:= ' WHERE ';

    with DmDados.Q_RelVencidos do
    begin
       close;
       sql.Clear;
       sql.Add('SELECT');
       sql.Add('   ITENS_ENTRADAS.COD_OUTRA,');
       sql.Add('   ITENS_ENTRADAS.COD_PRO,');
       sql.Add('   PRODUTO.NOME_PRO,');
       sql.Add('   ITENS_ENTRADAS.DATA_VENCTO,');
       sql.Add('   UNIDADE_MEDIDA.DESCRICAO');
       sql.Add(' FROM');
       sql.Add('   PRODUTO');
       sql.Add('   INNER JOIN ITENS_ENTRADAS ON (PRODUTO.COD_PRO = ITENS_ENTRADAS.COD_PRO)');
       sql.Add('   INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MEDIDA.CODIGO)');
       sql.Add(' WHERE');
       sql.Add('   ITENS_ENTRADAS.DATA_VENCTO between :hj and :hj + 10');
       sql.Add(' ORDER BY PRODUTO.NOME_PRO,ITENS_ENTRADAS.DATA_VENCTO');
       ParamByName('hj').AsDate := Date;
       //ParamByName('hj2').AsDate := Date;
       open;
       FetchAll;
    end;

    if (DmDados.Q_RelVencidos.RecordCount > 0) then
    begin
      Label4.Caption := IntToStr(DmDados.Q_RelVencidos.RecordCount)+' Produtos';
    end
    else
    begin
      Label4.Caption := '0 Produtos';
    end;
end;

procedure TFrmPrincipal.Vencidos;
var sAuxSql : string;
    sAuxEstoque : string;
begin
    sAuxSql:= ' WHERE ';

    with DmDados.Q_RelVencidos do
    begin
       close;
       sql.Clear;
       sql.Add('SELECT');
       sql.Add('   ITENS_ENTRADAS.COD_OUTRA,');
       sql.Add('   ITENS_ENTRADAS.COD_PRO,');
       sql.Add('   PRODUTO.NOME_PRO,');
       sql.Add('   ITENS_ENTRADAS.DATA_VENCTO,');
       sql.Add('   UNIDADE_MEDIDA.DESCRICAO');
       sql.Add(' FROM');
       sql.Add('   PRODUTO');
       sql.Add('   INNER JOIN ITENS_ENTRADAS ON (PRODUTO.COD_PRO = ITENS_ENTRADAS.COD_PRO)');
       sql.Add('   INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MEDIDA.CODIGO)');
       sql.Add(' WHERE');
       sql.Add('   ITENS_ENTRADAS.DATA_VENCTO between :hj - 5 and :hj');
       sql.Add(' ORDER BY PRODUTO.NOME_PRO,ITENS_ENTRADAS.DATA_VENCTO');
       ParamByName('hj').AsDate := Date;
       open;
       FetchAll;
    end;

    if (DmDados.Q_RelVencidos.RecordCount > 0) then
    begin
      Label6.Caption := IntToStr(DmDados.Q_RelVencidos.RecordCount)+' Produtos';
    end
    else
    begin
      Label6.Caption := '0 Produtos';
    end;
end;

procedure TFrmPrincipal.Vendas3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendas,FrmRelVendas);
  FrmRelVendas.Showmodal;
  FrmRelVendas.Hide;
  FrmRelVendas.Free;
end;

procedure TFrmPrincipal.Vendedor1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmVendedor,FrmVendedor);
  FrmVendedor.Tag := 0;
  FrmVendedor.Showmodal;
  FrmVendedor.Hide;
  FrmVendedor.Free;
end;

procedure TFrmPrincipal.Vendedor2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendedores,FrmRelVendedores);
  FrmRelVendedores.Showmodal;
  FrmRelVendedores.Hide;
  FrmRelVendedores.Free;
end;

end.
