unit Udm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable, IniFiles;

type
  TDmDados = class(TDataModule)
    IBTransaction1: TIBTransaction;
    tb_empresa: TIBTable;
    tb_empresaCOD_EMP: TIntegerField;
    tb_empresaRAZAO_EMP: TIBStringField;
    tb_empresaEND_EMP: TIBStringField;
    tb_empresaBAI_EMP: TIBStringField;
    tb_empresaCID_EMP: TIBStringField;
    tb_empresaCEP_EMP: TIBStringField;
    tb_empresaEST_EMP: TIBStringField;
    tb_empresaINSC_EMP: TIBStringField;
    tb_empresaTEL_EMP: TIBStringField;
    tb_empresaFAX_EMP: TIBStringField;
    tb_empresaNUMERO_EMP: TIBStringField;
    tb_empresaRESP_EMP: TIBStringField;
    tb_empresaCAMINHO_FOTO_EMP: TIBStringField;
    tb_empresaFANTASIA_EMP: TIBStringField;
    tb_empresaCNPJ_EMP: TIBStringField;
    tb_empresaCAMINHO_VALIDADOR_SINTEGRA: TIBStringField;
    tb_empresaINSCRICAO_MUNICIPAL: TIBStringField;
    tb_vendedor: TIBTable;
    tb_vendedorCOD_VEND: TIntegerField;
    tb_vendedorNOME_VEND: TIBStringField;
    tb_vendedorATIVO_VEND: TIBStringField;
    tb_vendedorCOMISSAO_VEND: TIBBCDField;
    Conexao: TIBDatabase;
    tb_classifica_cliente: TIBTable;
    tb_fornecedor: TIBTable;
    tb_fpagamentos: TIBTable;
    tb_clientes: TIBTable;
    tb_secao: TIBTable;
    tb_UnidadesMedidas: TIBTable;
    tb_classifica_clienteCOD_CLA: TIntegerField;
    tb_classifica_clienteNOME_CLA: TIBStringField;
    Q_Consulta: TIBQuery;
    Dts_empresa: TDataSource;
    Dts_vendedor: TDataSource;
    Dts_classifica_cliente: TDataSource;
    tb_clientesCOD_CLI: TIntegerField;
    tb_clientesNOME_CLI: TIBStringField;
    tb_clientesCOD_CLA: TIntegerField;
    tb_clientesENDRES_CLI: TIBStringField;
    tb_clientesBAIRES_CLI: TIBStringField;
    tb_clientesCIDRES_CLI: TIBStringField;
    tb_clientesESTRES_CLI: TIBStringField;
    tb_clientesCEPRES_CLI: TIBStringField;
    tb_clientesTELRES_CLI: TIBStringField;
    tb_clientesCPF_CLI: TIBStringField;
    tb_clientesRG_CLI: TIBStringField;
    tb_clientesAPELIDO_CLI: TIBStringField;
    tb_clientesLIMITE_CLI: TIBBCDField;
    tb_clientesATIVO_CLI: TIBStringField;
    tb_clientesOBS_CLI: TIBStringField;
    tb_clientesNASCIMENTO_CLI: TDateField;
    tb_clientesDATACADASTRO_CLI: TDateField;
    tb_clientesATRAZO_MAXIMO_CLI: TIntegerField;
    tb_clientesCELULAR_CLI: TIBStringField;
    tb_clientesIMP_SALDO_PENDENTE_CLI: TIBStringField;
    tb_clientesLIMITE_CHEQUE: TIBBCDField;
    tb_clientesCONTATO_CLI: TIBStringField;
    tb_clientesCONTROLAR_LIMITE: TIBStringField;
    tb_clientesEMAIL_CLI: TIBStringField;
    Dts_clientes: TDataSource;
    tb_secaoCOD_SEC: TIntegerField;
    tb_secaoNOME_SEC: TIBStringField;
    Dts_secao: TDataSource;
    tb_fpagamentosCODIGO: TIntegerField;
    tb_fpagamentosDESCRICAO: TIBStringField;
    Dts_fPagamentos: TDataSource;
    tb_UnidadesMedidasCODIGO: TIntegerField;
    tb_UnidadesMedidasDESCRICAO: TIBStringField;
    Dts_UnidadesMedidades: TDataSource;
    Dts_fornecedor: TDataSource;
    tb_fornecedorCOD_FOR: TIntegerField;
    tb_fornecedorFJ_FOR: TIBStringField;
    tb_fornecedorRAZAO_FOR: TIBStringField;
    tb_fornecedorEND_FOR: TIBStringField;
    tb_fornecedorBAI_FOR: TIBStringField;
    tb_fornecedorCID_FOR: TIBStringField;
    tb_fornecedorCEP_FOR: TIBStringField;
    tb_fornecedorEST_FOR: TIBStringField;
    tb_fornecedorCNPJ_FOR: TIBStringField;
    tb_fornecedorINSC_FOR: TIBStringField;
    tb_fornecedorTEL_FOR: TIBStringField;
    tb_fornecedorFAX_FOR: TIBStringField;
    tb_fornecedorCONTATO_FOR: TIBStringField;
    tb_fornecedorNUM_FOR: TIBStringField;
    tb_fornecedorCODIGO_IBGE: TIntegerField;
    tb_fornecedorEMAIL_FOR: TIBStringField;
    Dts_Marcas: TDataSource;
    tb_marcas: TIBTable;
    tb_produtos: TIBTable;
    Dts_produtos: TDataSource;
    tb_marcasCODIGO: TIntegerField;
    tb_marcasDESCRICAO: TIBStringField;
    tb_produtosCOD_PRO: TIntegerField;
    tb_produtosCODIGO_BARRA_PRO: TIBStringField;
    tb_produtosTP_PRODUTO: TIBStringField;
    tb_produtosTP_PRODUCAO: TIBStringField;
    tb_produtosESTOQUE_MINIMO: TIBBCDField;
    tb_produtosNOME_PRO: TIBStringField;
    tb_produtosDESC_CUPOM: TIBStringField;
    tb_produtosCOD_MARC: TIntegerField;
    tb_produtosCOD_SEC: TIntegerField;
    tb_produtosCOD_GRUP: TIntegerField;
    tb_produtosCOD_SGRUP: TIntegerField;
    tb_produtosCOD_UNI_ENT: TIntegerField;
    tb_produtosCOD_UNI_SAI: TIntegerField;
    tb_produtosPRECO_VAREJO: TIBBCDField;
    tb_produtosPRECO_PROMOCAO: TIBBCDField;
    tb_produtosPRECO_PRAZO: TIBBCDField;
    tb_produtosMARGEM_LUCRO: TIBBCDField;
    tb_produtosQUANT_ESTOQ: TIBBCDField;
    tb_produtosDATA_VALIDADE: TDateField;
    tb_produtosDIAS_VALIDADE_PRO: TIntegerField;
    tb_produtosCONTROLA_ESTOQUE_PRO: TIBStringField;
    tb_produtosATIVO_PRO: TIBStringField;
    tb_produtosCAMINHO_FOTO_PRO: TBlobField;
    Q_Fornecedor: TIBQuery;
    Q_FornecedorCOD_FOR: TIntegerField;
    Q_FornecedorRAZAO_FOR: TIBStringField;
    Q_FornecedorTEL_FOR: TIBStringField;
    Q_FornecedorFAX_FOR: TIBStringField;
    Q_FornecedorCONTATO_FOR: TIBStringField;
    Dts_Q_Fornecedor: TDataSource;
    Q_Produtos: TIBQuery;
    DS_Q_Produtos: TDataSource;
    Q_ProdutosCOD_PRO: TIntegerField;
    Q_ProdutosCODIGO_BARRA_PRO: TIBStringField;
    Q_ProdutosESTOQUE_MINIMO: TIBBCDField;
    Q_ProdutosNOME_PRO: TIBStringField;
    Q_ProdutosPRECO_VAREJO: TIBBCDField;
    Q_ProdutosPRECO_PROMOCAO: TIBBCDField;
    Q_ProdutosDATA_VALIDADE: TDateField;
    Q_ProdutosDESCRICAO: TIBStringField;
    Q_ProdutosNOME_SEC: TIBStringField;
    Q_ProdutosDESCRICAO1: TIBStringField;
    Q_ProdutosDESCRICAO2: TIBStringField;
    Q_ProdutosDESCRICAO3: TIBStringField;
    Q_executa: TIBQuery;
    Q_Clientes: TIBQuery;
    DS_Q_clientes: TDataSource;
    Q_ClientesCOD_CLI: TIntegerField;
    Q_ClientesNOME_CLI: TIBStringField;
    Q_ClientesNASCIMENTO_CLI: TDateField;
    Q_ClientesTELRES_CLI: TIBStringField;
    Q_Vendedores: TIBQuery;
    DS_Q_Vendedores: TDataSource;
    Q_VendedoresCOD_VEND: TIntegerField;
    Q_VendedoresNOME_VEND: TIBStringField;
    Q_VendedoresATIVO_VEND: TIBStringField;
    Q_VendedoresCOMISSAO_VEND: TIBBCDField;
    Q_Classifica: TIBQuery;
    Q_ClassificaCOD_CLA: TIntegerField;
    Q_ClassificaNOME_CLA: TIBStringField;
    DS_Q_Classifica: TDataSource;
    Q_Secao_Grupo: TIBQuery;
    DS_Q_Secao_Grupo: TDataSource;
    DS_Q_Marcas: TDataSource;
    Q_Marcas: TIBQuery;
    Q_MarcasCODIGO: TIntegerField;
    Q_MarcasDESCRICAO: TIBStringField;
    tb_entradas: TIBTable;
    Dts_entradas: TDataSource;
    tb_entradasCOD_OUTRA: TIntegerField;
    tb_entradasDATA_OUTRA: TDateField;
    tb_entradasCOD_FOR: TIntegerField;
    tb_entradasCOD_EMP: TIntegerField;
    tb_entradasTOTAL_OUTRA: TIBBCDField;
    tb_entradasNUMERO_NOTA_FISCAL: TIntegerField;
    tb_entradasSERIE_NOTA_FISCAL: TIBStringField;
    tb_entradasCANCELADA: TIntegerField;
    Q_ProdutosQUANT_ESTOQ: TIBBCDField;
    tb_entradasDATA_VENCTO: TDateField;
    Dts_Outras_Saidas: TDataSource;
    tb_Outras_Saidas: TIBTable;
    tb_Outras_SaidasCOD_OUTRA: TIntegerField;
    tb_Outras_SaidasDATA_OUTRA: TDateField;
    tb_Outras_SaidasCOD_TIPO: TIntegerField;
    tb_Outras_SaidasCOD_CLI: TIntegerField;
    tb_Outras_SaidasCOD_EMP: TIntegerField;
    tb_Outras_SaidasTOTAL_OUTRA: TIBBCDField;
    tb_Outras_SaidasCANCELADA: TIntegerField;
    Q_Produtos_inventario: TIBQuery;
    Q_Produtos_inventarioCOD_PRO: TIntegerField;
    Q_Produtos_inventarioCODIGO_BARRA_PRO: TIBStringField;
    Q_Produtos_inventarioESTOQUE_MINIMO: TIBBCDField;
    Q_Produtos_inventarioNOME_PRO: TIBStringField;
    Q_Produtos_inventarioPRECO_VAREJO: TIBBCDField;
    Q_Produtos_inventarioPRECO_PROMOCAO: TIBBCDField;
    Q_Produtos_inventarioDATA_VALIDADE: TDateField;
    Q_Produtos_inventarioDESCRICAO: TIBStringField;
    Q_Produtos_inventarioNOME_SEC: TIBStringField;
    Q_Produtos_inventarioDESCRICAO1: TIBStringField;
    Q_Produtos_inventarioDESCRICAO2: TIBStringField;
    Q_Produtos_inventarioDESCRICAO3: TIBStringField;
    Q_Produtos_inventarioQUANT_ESTOQ: TIBBCDField;
    DS_Q_Produtos_inventario: TDataSource;
    QRelVendas: TIBQuery;
    QRelVendasCOD_VENDAS: TIntegerField;
    QRelVendasCOD_CLIENTE: TIntegerField;
    QRelVendasNOME_CLI: TIBStringField;
    QRelVendasCODIGO: TIntegerField;
    QRelVendasDESCRICAO: TIBStringField;
    QRelVendasTOTAL: TIBBCDField;
    QRelVendasDATA: TDateField;
    QRelVendasHORA: TTimeField;
    QRelVendasOBS: TWideMemoField;
    QRelOE: TIBQuery;
    QRelOEQUANT: TIBBCDField;
    QRelOECOD_ES: TIntegerField;
    QRelOECOD_PRO: TIntegerField;
    QRelOENOME_PRO: TIBStringField;
    QRelOENOME_ES: TIBStringField;
    Q_RelEntradas: TIBQuery;
    Q_RelEntradasCOD_OUTRA: TIntegerField;
    Q_RelEntradasDATA_OUTRA: TDateField;
    Q_RelEntradasCOD_FOR: TIntegerField;
    Q_RelEntradasCOD_EMP: TIntegerField;
    Q_RelEntradasTOTAL_OUTRA: TIBBCDField;
    Q_RelEntradasNUMERO_NOTA_FISCAL: TIntegerField;
    Q_RelEntradasSERIE_NOTA_FISCAL: TIBStringField;
    Q_RelEntradasCANCELADA: TIntegerField;
    Q_RelEntradasDATA_VENCTO: TDateField;
    Q_RelEntradasRAZAO_FOR: TIBStringField;
    tb_usuarios: TIBTable;
    tb_usuariosCOD_USU: TIntegerField;
    tb_usuariosNOME_USU: TIBStringField;
    tb_usuariosSENHA_USU: TIBStringField;
    tb_usuariosCOD_EMPR: TIntegerField;
    tb_usuariosOPERADOR_CAIXA: TIBStringField;
    Dts_Usuarios: TDataSource;
    QLogin: TIBQuery;
    QLoginCOD_USU: TIntegerField;
    QLoginNOME_USU: TIBStringField;
    QLoginSENHA_USU: TIBStringField;
    QLoginCOD_EMPR: TIntegerField;
    QLoginOPERADOR_CAIXA: TIBStringField;
    QRelOS: TIBQuery;
    QRelOSCOD_OUTRA: TIntegerField;
    QRelOSDATA_OUTRA: TDateField;
    QRelOSCOD_TIPO: TIntegerField;
    QRelOSCOD_CLI: TIntegerField;
    QRelOSCOD_EMP: TIntegerField;
    QRelOSTOTAL_OUTRA: TIBBCDField;
    QRelOSCANCELADA: TIntegerField;
    QRelOSNOME_CLI: TIBStringField;
    QRelOSCOD_CLI1: TIntegerField;
    Q_Produtos_inventarioVL_TOTAL_EM_PROD: TFMTBCDField;
    Q_RelVencidos: TIBQuery;
    Q_RelVencidosCOD_OUTRA: TIntegerField;
    Q_RelVencidosCOD_PRO: TIntegerField;
    Q_RelVencidosNOME_PRO: TIBStringField;
    Q_RelVencidosDATA_VENCTO: TDateField;
    Q_RelVencidosDESCRICAO: TIBStringField;
    Q_Qtd_vendida: TIBQuery;
    Q_Qtd_vendidaCOD_PRO: TIntegerField;
    Q_Qtd_vendidaTOTAL_VENDIDO: TIBBCDField;
    Q_Qtd_vendidaNOME_PRO: TIBStringField;
    Q_Qtd_vendidaDATA: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ImpressoraCupom : String;
  end;

var
  DmDados: TDmDados;
  iniconf: Tinifile;
  iniConf2: TiniFile;
  arq: string;
  ini_arq, ini_configuracoes, vHost, vPatch: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmDados.DataModuleCreate(Sender: TObject);
var
  Local_exe : String;
begin
    Local_exe:= ParamStr(0);

    ini_arq := Copy(ExtractFileDir(Local_exe), 1, LastDelimiter('\', ExtractFileDir(Local_exe))) + 'config\' + 'dbconnections.ini';
    iniConf := TIniFile.Create(ini_arq);

    arq := ExtractFilePath(Local_exe) + 'dbconnections.ini';

    Conexao.Connected := False;
    if (FileExists(ini_arq)) then
    begin
        try
            ImpressoraCupom := Iniconf.ReadString('Impressora', 'porta', '');

            if (Iniconf.ReadString('Base', 'host', '') = '') then
            begin
                Conexao.Connected := False;
                Conexao.DatabaseName := '';
                Conexao.DatabaseName := 'localhost' + ':' + Iniconf.ReadString('Base', 'Caminho', '');
            end
            else
            begin
                Conexao.Connected := False;
                Conexao.DatabaseName := '';
                Conexao.DatabaseName := Iniconf.ReadString('Base', 'host', '') + ':' + Iniconf.ReadString('Base', 'Caminho', '');
            end;

            Conexao.Params.Values['user_name = SYSDBA'];
            Conexao.Params.Values['password = masterkey'];
            Conexao.Connected := True;

            tb_empresa.Open;

          //doSaveLog('Conectou ao banco de dados!');
        except
            begin
                Application.MessageBox('ERRO #015' + #13 + #13 + 'Não foi possível se conectar ao banco de dados!', 'Erro de Conexão', MB_OK + MB_ICONERROR);
                Application.Terminate;
            end;
        end;
    end;
end;

end.
