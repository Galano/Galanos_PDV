unit Udm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JclPeImage, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL;

type
  TDmDados = class(TDataModule)
    Conexao: TFDConnection;
    tb_empresa: TFDTable;
    tb_empresaCOD_EMP: TIntegerField;
    tb_empresaRAZAO_EMP: TStringField;
    tb_empresaEND_EMP: TStringField;
    tb_empresaBAI_EMP: TStringField;
    tb_empresaCID_EMP: TStringField;
    tb_empresaCEP_EMP: TStringField;
    tb_empresaEST_EMP: TStringField;
    tb_empresaINSC_EMP: TStringField;
    tb_empresaTEL_EMP: TStringField;
    tb_empresaFAX_EMP: TStringField;
    tb_empresaNUMERO_EMP: TStringField;
    tb_empresaRESP_EMP: TStringField;
    tb_empresaCAMINHO_FOTO_EMP: TStringField;
    tb_empresaFANTASIA_EMP: TStringField;
    tb_empresaCNPJ_EMP: TStringField;
    tb_empresaCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    tb_empresaINSCRICAO_MUNICIPAL: TStringField;
    tb_vendedor: TFDTable;
    tb_vendedorCOD_VEND: TIntegerField;
    tb_vendedorNOME_VEND: TStringField;
    tb_vendedorATIVO_VEND: TStringField;
    tb_vendedorCOMISSAO_VEND: TBCDField;
    tb_classifica_cliente: TFDTable;
    tb_classifica_clienteCOD_CLA: TIntegerField;
    tb_classifica_clienteNOME_CLA: TStringField;
    tb_fornecedor: TFDTable;
    tb_fornecedorCOD_FOR: TIntegerField;
    tb_fornecedorFJ_FOR: TStringField;
    tb_fornecedorRAZAO_FOR: TStringField;
    tb_fornecedorEND_FOR: TStringField;
    tb_fornecedorBAI_FOR: TStringField;
    tb_fornecedorCID_FOR: TStringField;
    tb_fornecedorCEP_FOR: TStringField;
    tb_fornecedorEST_FOR: TStringField;
    tb_fornecedorCNPJ_FOR: TStringField;
    tb_fornecedorINSC_FOR: TStringField;
    tb_fornecedorTEL_FOR: TStringField;
    tb_fornecedorFAX_FOR: TStringField;
    tb_fornecedorCONTATO_FOR: TStringField;
    tb_fornecedorNUM_FOR: TStringField;
    tb_fornecedorCODIGO_IBGE: TIntegerField;
    tb_fornecedorEMAIL_FOR: TStringField;
    tb_fpagamentos: TFDTable;
    tb_fpagamentosCODIGO: TIntegerField;
    tb_fpagamentosDESCRICAO: TStringField;
    tb_clientes: TFDTable;
    tb_clientesCOD_CLI: TIntegerField;
    tb_clientesNOME_CLI: TStringField;
    tb_clientesCOD_CLA: TIntegerField;
    tb_clientesENDRES_CLI: TStringField;
    tb_clientesBAIRES_CLI: TStringField;
    tb_clientesCIDRES_CLI: TStringField;
    tb_clientesESTRES_CLI: TStringField;
    tb_clientesCEPRES_CLI: TStringField;
    tb_clientesTELRES_CLI: TStringField;
    tb_clientesCPF_CLI: TStringField;
    tb_clientesRG_CLI: TStringField;
    tb_clientesAPELIDO_CLI: TStringField;
    tb_clientesLIMITE_CLI: TBCDField;
    tb_clientesATIVO_CLI: TStringField;
    tb_clientesNASCIMENTO_CLI: TDateField;
    tb_clientesDATACADASTRO_CLI: TDateField;
    tb_clientesATRAZO_MAXIMO_CLI: TIntegerField;
    tb_clientesCELULAR_CLI: TStringField;
    tb_clientesIMP_SALDO_PENDENTE_CLI: TStringField;
    tb_clientesLIMITE_CHEQUE: TBCDField;
    tb_clientesCONTATO_CLI: TStringField;
    tb_clientesCONTROLAR_LIMITE: TStringField;
    tb_clientesEMAIL_CLI: TStringField;
    tb_secao: TFDTable;
    tb_secaoCOD_SEC: TIntegerField;
    tb_secaoNOME_SEC: TStringField;
    tb_UnidadesMedidas: TFDTable;
    tb_UnidadesMedidasCODIGO: TIntegerField;
    tb_UnidadesMedidasDESCRICAO: TStringField;
    Dts_empresa: TDataSource;
    Dts_vendedor: TDataSource;
    Dts_classifica_cliente: TDataSource;
    Dts_clientes: TDataSource;
    Dts_secao: TDataSource;
    Dts_fPagamentos: TDataSource;
    Dts_UnidadesMedidades: TDataSource;
    Dts_fornecedor: TDataSource;
    Dts_Marcas: TDataSource;
    Q_Consulta: TFDQuery;
    tb_marcas: TFDTable;
    tb_produtos: TFDTable;
    Dts_produtos: TDataSource;
    Q_Fornecedor: TFDQuery;
    Dts_Q_Fornecedor: TDataSource;
    Q_Produtos: TFDQuery;
    DS_Q_Produtos: TDataSource;
    Q_executa: TFDQuery;
    Q_Clientes: TFDQuery;
    DS_Q_clientes: TDataSource;
    Q_Vendedores: TFDQuery;
    DS_Q_Vendedores: TDataSource;
    Q_Classifica: TFDQuery;
    DS_Q_Classifica: TDataSource;
    Q_Secao_Grupo: TFDQuery;
    DS_Q_Secao_Grupo: TDataSource;
    DS_Q_Marcas: TDataSource;
    Q_Marcas: TFDQuery;
    tb_entradas: TFDTable;
    Dts_entradas: TDataSource;
    Dts_Outras_Saidas: TDataSource;
    tb_Outras_Saidas: TFDTable;
    Q_Produtos_inventario: TFDQuery;
    DS_Q_Produtos_inventario: TDataSource;
    QRelVendas: TFDQuery;
    QRelOE: TFDQuery;
    Q_RelEntradas: TFDQuery;
    tb_usuarios: TFDTable;
    Dts_Usuarios: TDataSource;
    QLogin: TFDQuery;
    QRelOS: TFDQuery;
    Q_RelVencidos: TFDQuery;
    Q_Qtd_vendida: TFDQuery;
    Q_ClassificaCOD_CLA: TIntegerField;
    Q_ClassificaNOME_CLA: TStringField;
    Q_ClientesCOD_CLI: TIntegerField;
    Q_ClientesNOME_CLI: TStringField;
    Q_ClientesNASCIMENTO_CLI: TDateField;
    Q_ClientesTELRES_CLI: TStringField;
    Q_FornecedorCOD_FOR: TIntegerField;
    Q_FornecedorRAZAO_FOR: TStringField;
    Q_FornecedorTEL_FOR: TStringField;
    Q_FornecedorFAX_FOR: TStringField;
    Q_FornecedorCONTATO_FOR: TStringField;
    Q_MarcasCODIGO: TIntegerField;
    Q_MarcasDESCRICAO: TStringField;
    Q_ProdutosCOD_PRO: TIntegerField;
    Q_ProdutosCODIGO_BARRA_PRO: TStringField;
    Q_ProdutosESTOQUE_MINIMO: TBCDField;
    Q_ProdutosQUANT_ESTOQ: TBCDField;
    Q_ProdutosNOME_PRO: TStringField;
    Q_ProdutosPRECO_VAREJO: TBCDField;
    Q_ProdutosPRECO_PROMOCAO: TBCDField;
    Q_ProdutosDATA_VALIDADE: TDateField;
    Q_ProdutosDESCRICAO: TStringField;
    Q_ProdutosNOME_SEC: TStringField;
    Q_ProdutosDESCRICAO_1: TStringField;
    Q_ProdutosDESCRICAO_2: TStringField;
    Q_ProdutosDESCRICAO_3: TStringField;
    Q_Produtos_inventarioCOD_PRO: TIntegerField;
    Q_Produtos_inventarioCODIGO_BARRA_PRO: TStringField;
    Q_Produtos_inventarioESTOQUE_MINIMO: TBCDField;
    Q_Produtos_inventarioQUANT_ESTOQ: TBCDField;
    Q_Produtos_inventarioNOME_PRO: TStringField;
    Q_Produtos_inventarioPRECO_VAREJO: TBCDField;
    Q_Produtos_inventarioPRECO_PROMOCAO: TBCDField;
    Q_Produtos_inventarioDATA_VALIDADE: TDateField;
    Q_Produtos_inventarioDESCRICAO: TStringField;
    Q_Produtos_inventarioNOME_SEC: TStringField;
    Q_Produtos_inventarioDESCRICAO_1: TStringField;
    Q_Produtos_inventarioDESCRICAO_2: TStringField;
    Q_Produtos_inventarioDESCRICAO_3: TStringField;
    Q_Produtos_inventarioVL_TOTAL_EM_PROD: TFMTBCDField;
    Q_Qtd_vendidaCOD_PRO: TIntegerField;
    Q_Qtd_vendidaDATA: TDateField;
    Q_Qtd_vendidaTOTAL_VENDIDO: TBCDField;
    Q_Qtd_vendidaNOME_PRO: TStringField;
    Q_RelEntradasCOD_OUTRA: TIntegerField;
    Q_RelEntradasDATA_OUTRA: TDateField;
    Q_RelEntradasCOD_FOR: TIntegerField;
    Q_RelEntradasCOD_EMP: TIntegerField;
    Q_RelEntradasTOTAL_OUTRA: TBCDField;
    Q_RelEntradasNUMERO_NOTA_FISCAL: TIntegerField;
    Q_RelEntradasSERIE_NOTA_FISCAL: TStringField;
    Q_RelEntradasCANCELADA: TIntegerField;
    Q_RelEntradasDATA_VENCTO: TDateField;
    Q_RelEntradasRAZAO_FOR: TStringField;
    Q_RelVencidosCOD_OUTRA: TIntegerField;
    Q_RelVencidosCOD_PRO: TIntegerField;
    Q_RelVencidosNOME_PRO: TStringField;
    Q_RelVencidosDATA_VENCTO: TDateField;
    Q_RelVencidosDESCRICAO: TStringField;
    QRelOSCOD_CLI: TIntegerField;
    QRelOSNOME_CLI: TStringField;
    QRelOSCOD_OUTRA: TIntegerField;
    QRelOSDATA_OUTRA: TDateField;
    QRelOSCOD_TIPO: TIntegerField;
    QRelOSCOD_CLI_1: TIntegerField;
    QRelOSCOD_EMP: TIntegerField;
    QRelOSTOTAL_OUTRA: TBCDField;
    QRelOSCANCELADA: TIntegerField;
    QRelVendasCOD_VENDAS: TIntegerField;
    QRelVendasCOD_CLIENTE: TIntegerField;
    QRelVendasNOME_CLI: TStringField;
    QRelVendasCODIGO: TIntegerField;
    QRelVendasDESCRICAO: TStringField;
    QRelVendasTOTAL: TBCDField;
    QRelVendasDATA: TDateField;
    QRelVendasHORA: TTimeField;
    QRelVendasOBS: TMemoField;
    tb_entradasCOD_OUTRA: TIntegerField;
    tb_entradasDATA_OUTRA: TDateField;
    tb_entradasCOD_FOR: TIntegerField;
    tb_entradasCOD_EMP: TIntegerField;
    tb_entradasTOTAL_OUTRA: TBCDField;
    tb_entradasNUMERO_NOTA_FISCAL: TIntegerField;
    tb_entradasSERIE_NOTA_FISCAL: TStringField;
    tb_entradasCANCELADA: TIntegerField;
    tb_entradasDATA_VENCTO: TDateField;
    tb_marcasCODIGO: TIntegerField;
    tb_marcasDESCRICAO: TStringField;
    tb_Outras_SaidasCOD_OUTRA: TIntegerField;
    tb_Outras_SaidasDATA_OUTRA: TDateField;
    tb_Outras_SaidasCOD_TIPO: TIntegerField;
    tb_Outras_SaidasCOD_CLI: TIntegerField;
    tb_Outras_SaidasCOD_EMP: TIntegerField;
    tb_Outras_SaidasTOTAL_OUTRA: TBCDField;
    tb_Outras_SaidasCANCELADA: TIntegerField;
    tb_produtosCOD_PRO: TIntegerField;
    tb_produtosCODIGO_BARRA_PRO: TStringField;
    tb_produtosTP_PRODUTO: TStringField;
    tb_produtosTP_PRODUCAO: TStringField;
    tb_produtosESTOQUE_MINIMO: TBCDField;
    tb_produtosNOME_PRO: TStringField;
    tb_produtosDESC_CUPOM: TStringField;
    tb_produtosCOD_MARC: TIntegerField;
    tb_produtosCOD_SEC: TIntegerField;
    tb_produtosCOD_GRUP: TIntegerField;
    tb_produtosCOD_SGRUP: TIntegerField;
    tb_produtosCOD_UNI_ENT: TIntegerField;
    tb_produtosCOD_UNI_SAI: TIntegerField;
    tb_produtosPRECO_VAREJO: TBCDField;
    tb_produtosPRECO_PROMOCAO: TBCDField;
    tb_produtosPRECO_PRAZO: TBCDField;
    tb_produtosMARGEM_LUCRO: TBCDField;
    tb_produtosQUANT_ESTOQ: TBCDField;
    tb_produtosDATA_VALIDADE: TDateField;
    tb_produtosDIAS_VALIDADE_PRO: TIntegerField;
    tb_produtosCONTROLA_ESTOQUE_PRO: TStringField;
    tb_produtosATIVO_PRO: TStringField;
    tb_produtosCAMINHO_FOTO_PRO: TBlobField;
    tb_usuariosCOD_USU: TIntegerField;
    tb_usuariosNOME_USU: TStringField;
    tb_usuariosSENHA_USU: TStringField;
    tb_usuariosCOD_EMPR: TIntegerField;
    tb_usuariosOPERADOR_CAIXA: TStringField;
    QLoginCOD_USU: TIntegerField;
    QLoginNOME_USU: TStringField;
    QLoginSENHA_USU: TStringField;
    QLoginCOD_EMPR: TIntegerField;
    QLoginOPERADOR_CAIXA: TStringField;
    Q_VendedoresCOD_VEND: TIntegerField;
    Q_VendedoresNOME_VEND: TStringField;
    Q_VendedoresATIVO_VEND: TStringField;
    Q_VendedoresCOMISSAO_VEND: TBCDField;
    Q_Secao_GrupoCOD_SEC: TIntegerField;
    Q_Secao_GrupoNOME_SEC: TStringField;
    Q_Secao_GrupoCOD_GRUPO: TIntegerField;
    Q_Secao_GrupoNOME_GRUPO: TStringField;
    Q_Secao_GrupoCOD_SUBGRUPO: TIntegerField;
    Q_Secao_GrupoNOME_SUBGRUPO: TStringField;
    driveMysql: TFDPhysMySQLDriverLink;
    tb_clientesOBS_CLI: TMemoField;
    

    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ImpressoraCupom : String;
    function GeneratorID(aName: string; Connection: TFDConnection; Incrementa: Boolean): integer;
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
var ini_arq, caminhomysql : String;
  Local_exe : String;
begin
  try
   caminhomysql := ExtractFilePath(Application.ExeName) + 'libmySQL.dll';
       if FileExists(caminhomysql) then
        driveMysql.VendorLib := caminhomysql;

   conexao.Open();

   ini_arq := ExtractFileDir(Application.ExeName)+ '\dbconnections.ini';
   iniConf := TIniFile.Create(ini_arq);
   //Login_Padrao := Iniconf.ReadString('Base', 'Login_Padrao', '');


   except on e:exception do begin
     ShowMessage(e.message);
  end;



end;
(*
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
                Conexao.Params.Database := '';
                Conexao.Params.Database := 'localhost' + ':' + Iniconf.ReadString('Base', 'Caminho', '');
            end
            else
            begin
                Conexao.Connected := False;
                Conexao.Params.Database := '';
                Conexao.Params.Database := {Iniconf.ReadString('Base', 'host', '') + ':' +} Iniconf.ReadString('Base', 'Caminho', '');
            end;

            //Conexao.Params.Values['user_name = SYSDBA'];
            //Conexao.Params.Values['password = masterkey'];
            Conexao.Connected := True;
            tb_empresa.Open;


          //doSaveLog('Conectou ao banco de dados!');
        except on e:exception do
            begin
                //Application.MessageBox('ERRO #015' + #13 + #13 + 'Não foi possível se conectar ao banco de dados!'+e.Message+'', 'Erro de Conexão', MB_OK + MB_ICONERROR);
                ShowMessage(e.Message);
                Application.Terminate;
            end;
        end;
    end;
*)
end;

function TDmDados.GeneratorID(aName: string; Connection: TFDConnection;
  Incrementa: Boolean): integer;
var
    Qry: TFDQuery;
begin
    Qry := TFDQuery.Create(nil);
    try
        Qry.Connection  := Connection;
        if Incrementa then
            Qry.SQL.Add('SELECT LAST_INSERT_ID()+1')
            //Qry.SQL.Add('SELECT GEN_ID(' + aName + ', 1) FROM RDB$DATABASE')
        else
            Qry.SQL.Add('SELECT LAST_INSERT_ID()');
            //Qry.SQL.Add('SELECT GEN_ID(' + aName + ', 0) FROM RDB$DATABASE');
        Qry.Open;
        Result := Qry.Fields[0].AsInteger;
    finally
        FreeAndNil(Qry);
    end;

end;

end.
