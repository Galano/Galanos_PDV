object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 563
  Width = 1237
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = Conexao
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 32
  end
  object tb_empresa: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EMPRESA'
    UniDirectional = False
    Left = 56
    Top = 112
    object tb_empresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object tb_empresaRAZAO_EMP: TIBStringField
      FieldName = 'RAZAO_EMP'
      Required = True
      Size = 50
    end
    object tb_empresaEND_EMP: TIBStringField
      FieldName = 'END_EMP'
      Size = 50
    end
    object tb_empresaBAI_EMP: TIBStringField
      FieldName = 'BAI_EMP'
      Size = 30
    end
    object tb_empresaCID_EMP: TIBStringField
      FieldName = 'CID_EMP'
      Size = 30
    end
    object tb_empresaCEP_EMP: TIBStringField
      FieldName = 'CEP_EMP'
      Size = 9
    end
    object tb_empresaEST_EMP: TIBStringField
      FieldName = 'EST_EMP'
      Size = 2
    end
    object tb_empresaINSC_EMP: TIBStringField
      FieldName = 'INSC_EMP'
    end
    object tb_empresaTEL_EMP: TIBStringField
      FieldName = 'TEL_EMP'
      Size = 13
    end
    object tb_empresaFAX_EMP: TIBStringField
      FieldName = 'FAX_EMP'
      Size = 13
    end
    object tb_empresaNUMERO_EMP: TIBStringField
      FieldName = 'NUMERO_EMP'
      Size = 10
    end
    object tb_empresaRESP_EMP: TIBStringField
      FieldName = 'RESP_EMP'
      Size = 50
    end
    object tb_empresaCAMINHO_FOTO_EMP: TIBStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Size = 150
    end
    object tb_empresaFANTASIA_EMP: TIBStringField
      FieldName = 'FANTASIA_EMP'
      Size = 50
    end
    object tb_empresaCNPJ_EMP: TIBStringField
      FieldName = 'CNPJ_EMP'
      Size = 14
    end
    object tb_empresaCAMINHO_VALIDADOR_SINTEGRA: TIBStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Size = 80
    end
    object tb_empresaINSCRICAO_MUNICIPAL: TIBStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
    end
  end
  object tb_vendedor: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VENDEDOR'
    UniDirectional = False
    Left = 56
    Top = 176
    object tb_vendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Required = True
    end
    object tb_vendedorNOME_VEND: TIBStringField
      FieldName = 'NOME_VEND'
      Required = True
      Size = 50
    end
    object tb_vendedorATIVO_VEND: TIBStringField
      FieldName = 'ATIVO_VEND'
      Required = True
      Size = 1
    end
    object tb_vendedorCOMISSAO_VEND: TIBBCDField
      FieldName = 'COMISSAO_VEND'
      Precision = 18
      Size = 2
    end
  end
  object Conexao: TIBDatabase
    Connected = True
    DatabaseName = 
      'E:\Alessandro\Delphi\Sistemas\Estoque AllSoftware\database\estoq' +
      'ue.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 40
    Top = 32
  end
  object tb_classifica_cliente: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_CLA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME_CLA'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY19'
        Fields = 'COD_CLA'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CLASSIF_CLIENTE'
    UniDirectional = False
    Left = 55
    Top = 240
    object tb_classifica_clienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = '"CLASSIF_CLIENTE"."COD_CLA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_classifica_clienteNOME_CLA: TIBStringField
      FieldName = 'NOME_CLA'
      Origin = '"CLASSIF_CLIENTE"."NOME_CLA"'
      Required = True
      Size = 30
    end
  end
  object tb_fornecedor: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_FOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FJ_FOR'
        Attributes = [faRequired, faFixed]
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'RAZAO_FOR'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 60
      end
      item
        Name = 'END_FOR'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'BAI_FOR'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CID_FOR'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CEP_FOR'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 9
      end
      item
        Name = 'EST_FOR'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'CNPJ_FOR'
        DataType = ftWideString
        Size = 18
      end
      item
        Name = 'INSC_FOR'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'TEL_FOR'
        DataType = ftWideString
        Size = 13
      end
      item
        Name = 'FAX_FOR'
        DataType = ftWideString
        Size = 13
      end
      item
        Name = 'CONTATO_FOR'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'NUM_FOR'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'CODIGO_IBGE'
        DataType = ftInteger
      end
      item
        Name = 'EMAIL_FOR'
        DataType = ftWideString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'COD_FOR'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'FORNECEDOR'
    UniDirectional = False
    Left = 472
    Top = 32
    object tb_fornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"FORNECEDOR"."COD_FOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_fornecedorFJ_FOR: TIBStringField
      FieldName = 'FJ_FOR'
      Origin = '"FORNECEDOR"."FJ_FOR"'
      Required = True
      Size = 1
    end
    object tb_fornecedorRAZAO_FOR: TIBStringField
      FieldName = 'RAZAO_FOR'
      Origin = '"FORNECEDOR"."RAZAO_FOR"'
      Required = True
      Size = 60
    end
    object tb_fornecedorEND_FOR: TIBStringField
      FieldName = 'END_FOR'
      Origin = '"FORNECEDOR"."END_FOR"'
      Size = 50
    end
    object tb_fornecedorBAI_FOR: TIBStringField
      FieldName = 'BAI_FOR'
      Origin = '"FORNECEDOR"."BAI_FOR"'
      Size = 30
    end
    object tb_fornecedorCID_FOR: TIBStringField
      FieldName = 'CID_FOR'
      Origin = '"FORNECEDOR"."CID_FOR"'
      Size = 30
    end
    object tb_fornecedorCEP_FOR: TIBStringField
      FieldName = 'CEP_FOR'
      Origin = '"FORNECEDOR"."CEP_FOR"'
      Size = 9
    end
    object tb_fornecedorEST_FOR: TIBStringField
      FieldName = 'EST_FOR'
      Origin = '"FORNECEDOR"."EST_FOR"'
      Size = 2
    end
    object tb_fornecedorCNPJ_FOR: TIBStringField
      FieldName = 'CNPJ_FOR'
      Origin = '"FORNECEDOR"."CNPJ_FOR"'
      Size = 18
    end
    object tb_fornecedorINSC_FOR: TIBStringField
      FieldName = 'INSC_FOR'
      Origin = '"FORNECEDOR"."INSC_FOR"'
    end
    object tb_fornecedorTEL_FOR: TIBStringField
      FieldName = 'TEL_FOR'
      Origin = '"FORNECEDOR"."TEL_FOR"'
      Size = 13
    end
    object tb_fornecedorFAX_FOR: TIBStringField
      FieldName = 'FAX_FOR'
      Origin = '"FORNECEDOR"."FAX_FOR"'
      Size = 13
    end
    object tb_fornecedorCONTATO_FOR: TIBStringField
      FieldName = 'CONTATO_FOR'
      Origin = '"FORNECEDOR"."CONTATO_FOR"'
      Size = 50
    end
    object tb_fornecedorNUM_FOR: TIBStringField
      FieldName = 'NUM_FOR'
      Origin = '"FORNECEDOR"."NUM_FOR"'
      Size = 10
    end
    object tb_fornecedorCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"FORNECEDOR"."CODIGO_IBGE"'
    end
    object tb_fornecedorEMAIL_FOR: TIBStringField
      FieldName = 'EMAIL_FOR'
      Origin = '"FORNECEDOR"."EMAIL_FOR"'
      Size = 100
    end
  end
  object tb_fpagamentos: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FORMAS_PAGAMENTO'
    UniDirectional = False
    Left = 320
    Top = 216
    object tb_fpagamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tb_fpagamentosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object tb_clientes: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIENTE'
    UniDirectional = False
    Left = 48
    Top = 296
    object tb_clientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object tb_clientesNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object tb_clientesCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Required = True
    end
    object tb_clientesENDRES_CLI: TIBStringField
      FieldName = 'ENDRES_CLI'
      Size = 50
    end
    object tb_clientesBAIRES_CLI: TIBStringField
      FieldName = 'BAIRES_CLI'
      Size = 30
    end
    object tb_clientesCIDRES_CLI: TIBStringField
      FieldName = 'CIDRES_CLI'
      Size = 30
    end
    object tb_clientesESTRES_CLI: TIBStringField
      FieldName = 'ESTRES_CLI'
      Size = 2
    end
    object tb_clientesCEPRES_CLI: TIBStringField
      FieldName = 'CEPRES_CLI'
      Size = 9
    end
    object tb_clientesTELRES_CLI: TIBStringField
      FieldName = 'TELRES_CLI'
      Size = 13
    end
    object tb_clientesCPF_CLI: TIBStringField
      FieldName = 'CPF_CLI'
      Size = 18
    end
    object tb_clientesRG_CLI: TIBStringField
      FieldName = 'RG_CLI'
    end
    object tb_clientesAPELIDO_CLI: TIBStringField
      FieldName = 'APELIDO_CLI'
      Size = 50
    end
    object tb_clientesLIMITE_CLI: TIBBCDField
      FieldName = 'LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object tb_clientesATIVO_CLI: TIBStringField
      FieldName = 'ATIVO_CLI'
      Required = True
      Size = 1
    end
    object tb_clientesOBS_CLI: TIBStringField
      FieldName = 'OBS_CLI'
      Size = 500
    end
    object tb_clientesNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
    end
    object tb_clientesDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Required = True
    end
    object tb_clientesATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
    end
    object tb_clientesCELULAR_CLI: TIBStringField
      FieldName = 'CELULAR_CLI'
      Size = 13
    end
    object tb_clientesIMP_SALDO_PENDENTE_CLI: TIBStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Required = True
      Size = 1
    end
    object tb_clientesLIMITE_CHEQUE: TIBBCDField
      FieldName = 'LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object tb_clientesCONTATO_CLI: TIBStringField
      FieldName = 'CONTATO_CLI'
      Size = 70
    end
    object tb_clientesCONTROLAR_LIMITE: TIBStringField
      FieldName = 'CONTROLAR_LIMITE'
      Required = True
      Size = 1
    end
    object tb_clientesEMAIL_CLI: TIBStringField
      FieldName = 'EMAIL_CLI'
      Size = 100
    end
  end
  object tb_secao: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SECAO'
    UniDirectional = False
    Left = 320
    Top = 144
    object tb_secaoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Required = True
    end
    object tb_secaoNOME_SEC: TIBStringField
      FieldName = 'NOME_SEC'
      Required = True
      Size = 50
    end
  end
  object tb_UnidadesMedidas: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'UNIDADE_MEDIDA'
    UniDirectional = False
    Left = 320
    Top = 288
    object tb_UnidadesMedidasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tb_UnidadesMedidasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object Q_Consulta: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 288
    Top = 88
  end
  object Dts_empresa: TDataSource
    DataSet = tb_empresa
    Left = 128
    Top = 112
  end
  object Dts_vendedor: TDataSource
    DataSet = tb_vendedor
    Left = 137
    Top = 176
  end
  object Dts_classifica_cliente: TDataSource
    DataSet = tb_classifica_cliente
    Left = 150
    Top = 240
  end
  object Dts_clientes: TDataSource
    DataSet = tb_clientes
    Left = 142
    Top = 296
  end
  object Dts_secao: TDataSource
    DataSet = tb_secao
    Left = 376
    Top = 144
  end
  object Dts_fPagamentos: TDataSource
    DataSet = tb_fpagamentos
    Left = 404
    Top = 216
  end
  object Dts_UnidadesMedidades: TDataSource
    DataSet = tb_UnidadesMedidas
    Left = 416
    Top = 288
  end
  object Dts_fornecedor: TDataSource
    DataSet = tb_fornecedor
    Left = 560
    Top = 32
  end
  object Dts_Marcas: TDataSource
    DataSet = tb_marcas
    Left = 672
    Top = 128
  end
  object tb_marcas: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MARCAS'
    UniDirectional = False
    Left = 600
    Top = 128
    object tb_marcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tb_marcasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 70
    end
  end
  object tb_produtos: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUTO'
    UniDirectional = False
    Left = 608
    Top = 200
    object tb_produtosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object tb_produtosCODIGO_BARRA_PRO: TIBStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object tb_produtosTP_PRODUTO: TIBStringField
      FieldName = 'TP_PRODUTO'
      Required = True
      Size = 80
    end
    object tb_produtosTP_PRODUCAO: TIBStringField
      FieldName = 'TP_PRODUCAO'
      Size = 80
    end
    object tb_produtosESTOQUE_MINIMO: TIBBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 3
    end
    object tb_produtosNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object tb_produtosDESC_CUPOM: TIBStringField
      FieldName = 'DESC_CUPOM'
      Required = True
      Size = 80
    end
    object tb_produtosCOD_MARC: TIntegerField
      FieldName = 'COD_MARC'
      Required = True
    end
    object tb_produtosCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Required = True
    end
    object tb_produtosCOD_GRUP: TIntegerField
      FieldName = 'COD_GRUP'
      Required = True
    end
    object tb_produtosCOD_SGRUP: TIntegerField
      FieldName = 'COD_SGRUP'
      Required = True
    end
    object tb_produtosCOD_UNI_ENT: TIntegerField
      FieldName = 'COD_UNI_ENT'
      Required = True
    end
    object tb_produtosCOD_UNI_SAI: TIntegerField
      FieldName = 'COD_UNI_SAI'
      Required = True
    end
    object tb_produtosPRECO_VAREJO: TIBBCDField
      FieldName = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object tb_produtosPRECO_PROMOCAO: TIBBCDField
      FieldName = 'PRECO_PROMOCAO'
      Precision = 18
      Size = 4
    end
    object tb_produtosPRECO_PRAZO: TIBBCDField
      FieldName = 'PRECO_PRAZO'
      Precision = 18
      Size = 4
    end
    object tb_produtosMARGEM_LUCRO: TIBBCDField
      FieldName = 'MARGEM_LUCRO'
      Precision = 18
      Size = 4
    end
    object tb_produtosQUANT_ESTOQ: TIBBCDField
      FieldName = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
    object tb_produtosDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
    end
    object tb_produtosDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
    end
    object tb_produtosCONTROLA_ESTOQUE_PRO: TIBStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Size = 1
    end
    object tb_produtosATIVO_PRO: TIBStringField
      FieldName = 'ATIVO_PRO'
      Required = True
      Size = 1
    end
    object tb_produtosCAMINHO_FOTO_PRO: TBlobField
      FieldName = 'CAMINHO_FOTO_PRO'
    end
  end
  object Dts_produtos: TDataSource
    DataSet = tb_produtos
    Left = 680
    Top = 200
  end
  object Q_Fornecedor: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FO' +
        'RNECEDOR ')
    Left = 1056
    Top = 16
    object Q_FornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"FORNECEDOR"."COD_FOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_FornecedorRAZAO_FOR: TIBStringField
      FieldName = 'RAZAO_FOR'
      Origin = '"FORNECEDOR"."RAZAO_FOR"'
      Required = True
      Size = 60
    end
    object Q_FornecedorTEL_FOR: TIBStringField
      FieldName = 'TEL_FOR'
      Origin = '"FORNECEDOR"."TEL_FOR"'
      Size = 13
    end
    object Q_FornecedorFAX_FOR: TIBStringField
      FieldName = 'FAX_FOR'
      Origin = '"FORNECEDOR"."FAX_FOR"'
      Size = 13
    end
    object Q_FornecedorCONTATO_FOR: TIBStringField
      FieldName = 'CONTATO_FOR'
      Origin = '"FORNECEDOR"."CONTATO_FOR"'
      Size = 50
    end
  end
  object Dts_Q_Fornecedor: TDataSource
    DataSet = Q_Fornecedor
    Left = 1128
    Top = 16
  end
  object Q_Produtos: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  PRODUTO.COD_PRO,'
      '  PRODUTO.CODIGO_BARRA_PRO,'
      '  PRODUTO.ESTOQUE_MINIMO,'
      '  PRODUTO.QUANT_ESTOQ,'
      '  PRODUTO.NOME_PRO,'
      '  PRODUTO.PRECO_VAREJO,'
      '  PRODUTO.PRECO_PROMOCAO,'
      '  PRODUTO.DATA_VALIDADE,'
      '  MARCAS.DESCRICAO,'
      '  SECAO.NOME_SEC,'
      '  SECAO_GRUPO.DESCRICAO,'
      '  SECAO_GRUPO_SUBGRUPO.DESCRICAO,'
      '  UNIDADE_MEDIDA.DESCRICAO'
      'FROM'
      '  MARCAS'
      '  INNER JOIN PRODUTO ON (MARCAS.CODIGO = PRODUTO.COD_MARC)'
      '  INNER JOIN SECAO ON (PRODUTO.COD_SEC = SECAO.COD_SEC)'
      
        '  INNER JOIN SECAO_GRUPO ON (SECAO_GRUPO.COD_GRUPO = PRODUTO.COD' +
        '_GRUP)'
      '  AND (SECAO_GRUPO.COD_SEC = PRODUTO.COD_SEC)'
      
        '  INNER JOIN SECAO_GRUPO_SUBGRUPO ON (SECAO_GRUPO_SUBGRUPO.COD_S' +
        'UBGRUPO = PRODUTO.COD_SGRUP)'
      '  AND (SECAO_GRUPO_SUBGRUPO.COD_SEC = PRODUTO.COD_SEC)'
      '  AND (SECAO_GRUPO_SUBGRUPO.COD_GRUPO = PRODUTO.COD_GRUP)'
      
        ' INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MED' +
        'IDA.CODIGO)')
    Left = 1056
    Top = 88
    object Q_ProdutosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ProdutosCODIGO_BARRA_PRO: TIBStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Q_ProdutosESTOQUE_MINIMO: TIBBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = '"PRODUTO"."ESTOQUE_MINIMO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 3
    end
    object Q_ProdutosNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q_ProdutosPRECO_VAREJO: TIBBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = '"PRODUTO"."PRECO_VAREJO"'
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object Q_ProdutosPRECO_PROMOCAO: TIBBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = '"PRODUTO"."PRECO_PROMOCAO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 4
    end
    object Q_ProdutosDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = '"PRODUTO"."DATA_VALIDADE"'
    end
    object Q_ProdutosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"MARCAS"."DESCRICAO"'
      Required = True
      Size = 70
    end
    object Q_ProdutosNOME_SEC: TIBStringField
      FieldName = 'NOME_SEC'
      Origin = '"SECAO"."NOME_SEC"'
      Required = True
      Size = 50
    end
    object Q_ProdutosDESCRICAO1: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"SECAO_GRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object Q_ProdutosDESCRICAO2: TIBStringField
      FieldName = 'DESCRICAO2'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object Q_ProdutosDESCRICAO3: TIBStringField
      FieldName = 'DESCRICAO3'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object Q_ProdutosQUANT_ESTOQ: TIBBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = '"PRODUTO"."QUANT_ESTOQ"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 3
    end
  end
  object DS_Q_Produtos: TDataSource
    DataSet = Q_Produtos
    Left = 1136
    Top = 88
  end
  object Q_executa: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 360
    Top = 96
  end
  object Q_Clientes: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT C.COD_CLI, C.NOME_CLI, C.NASCIMENTO_CLI, C.TELRES_CLI'
      'FROM CLIENTE C')
    Left = 1056
    Top = 160
    object Q_ClientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ClientesNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object Q_ClientesNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = '"CLIENTE"."NASCIMENTO_CLI"'
    end
    object Q_ClientesTELRES_CLI: TIBStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
  end
  object DS_Q_clientes: TDataSource
    DataSet = Q_Clientes
    Left = 1136
    Top = 160
  end
  object Q_Vendedores: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM VENDEDOR ORDER BY COD_VEND')
    Left = 1056
    Top = 240
    object Q_VendedoresCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDEDOR"."COD_VEND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_VendedoresNOME_VEND: TIBStringField
      FieldName = 'NOME_VEND'
      Origin = '"VENDEDOR"."NOME_VEND"'
      Required = True
      Size = 50
    end
    object Q_VendedoresATIVO_VEND: TIBStringField
      FieldName = 'ATIVO_VEND'
      Origin = '"VENDEDOR"."ATIVO_VEND"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q_VendedoresCOMISSAO_VEND: TIBBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = '"VENDEDOR"."COMISSAO_VEND"'
      Precision = 18
      Size = 2
    end
  end
  object DS_Q_Vendedores: TDataSource
    DataSet = Q_Vendedores
    Left = 1144
    Top = 240
  end
  object Q_Classifica: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIF_CLIENTE')
    Left = 1057
    Top = 320
    object Q_ClassificaCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = '"CLASSIF_CLIENTE"."COD_CLA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ClassificaNOME_CLA: TIBStringField
      FieldName = 'NOME_CLA'
      Origin = '"CLASSIF_CLIENTE"."NOME_CLA"'
      Required = True
      Size = 30
    end
  end
  object DS_Q_Classifica: TDataSource
    DataSet = Q_Classifica
    Left = 1144
    Top = 320
  end
  object Q_Secao_Grupo: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT S.COD_SEC, S.NOME_SEC, G.COD_GRUPO, G.DESCRICAO NOME_GRUP' +
        'O,'
      'SUB.COD_SUBGRUPO, SUB.DESCRICAO NOME_SUBGRUPO'
      'FROM SECAO S'
      'LEFT JOIN SECAO_GRUPO G'
      'ON (S.COD_SEC = G.COD_SEC)'
      'LEFT JOIN SECAO_GRUPO_SUBGRUPO SUB'
      'ON (G.COD_SEC = SUB.COD_SEC AND G.COD_GRUPO = SUB.COD_GRUPO)')
    Left = 1063
    Top = 384
  end
  object DS_Q_Secao_Grupo: TDataSource
    DataSet = Q_Secao_Grupo
    Left = 1152
    Top = 384
  end
  object DS_Q_Marcas: TDataSource
    DataSet = Q_Marcas
    Left = 928
    Top = 392
  end
  object Q_Marcas: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from MARCAS')
    Left = 840
    Top = 392
    object Q_MarcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MARCAS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_MarcasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"MARCAS"."DESCRICAO"'
      Required = True
      Size = 70
    end
  end
  object tb_entradas: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ENTRADAS'
    UniDirectional = False
    Left = 600
    Top = 264
    object tb_entradasCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Required = True
    end
    object tb_entradasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Required = True
    end
    object tb_entradasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object tb_entradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object tb_entradasTOTAL_OUTRA: TIBBCDField
      FieldName = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object tb_entradasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object tb_entradasSERIE_NOTA_FISCAL: TIBStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object tb_entradasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Required = True
    end
    object tb_entradasDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
    end
  end
  object Dts_entradas: TDataSource
    DataSet = tb_entradas
    Left = 680
    Top = 264
  end
  object Dts_Outras_Saidas: TDataSource
    DataSet = tb_Outras_Saidas
    Left = 680
    Top = 320
  end
  object tb_Outras_Saidas: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'OUTRAS_SAIDAS'
    UniDirectional = False
    Left = 584
    Top = 328
    object tb_Outras_SaidasCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Required = True
    end
    object tb_Outras_SaidasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Required = True
    end
    object tb_Outras_SaidasCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object tb_Outras_SaidasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object tb_Outras_SaidasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object tb_Outras_SaidasTOTAL_OUTRA: TIBBCDField
      FieldName = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object tb_Outras_SaidasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Required = True
    end
  end
  object Q_Produtos_inventario: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  PRODUTO.COD_PRO,'
      '  PRODUTO.CODIGO_BARRA_PRO,'
      '  PRODUTO.ESTOQUE_MINIMO,'
      '  PRODUTO.QUANT_ESTOQ,'
      '  PRODUTO.NOME_PRO,'
      '  PRODUTO.PRECO_VAREJO,'
      '  PRODUTO.PRECO_PROMOCAO,'
      '  PRODUTO.DATA_VALIDADE,'
      '  MARCAS.DESCRICAO,'
      '  SECAO.NOME_SEC,'
      '  SECAO_GRUPO.DESCRICAO,'
      '  SECAO_GRUPO_SUBGRUPO.DESCRICAO,'
      '  UNIDADE_MEDIDA.DESCRICAO,'
      
        ' (PRODUTO.PRECO_VAREJO * PRODUTO.QUANT_ESTOQ) AS VL_TOTAL_EM_PRO' +
        'D'
      'FROM'
      '  MARCAS'
      '  INNER JOIN PRODUTO ON (MARCAS.CODIGO = PRODUTO.COD_MARC)'
      '  INNER JOIN SECAO ON (PRODUTO.COD_SEC = SECAO.COD_SEC)'
      
        '  INNER JOIN SECAO_GRUPO ON (SECAO_GRUPO.COD_GRUPO = PRODUTO.COD' +
        '_GRUP)'
      '  AND (SECAO_GRUPO.COD_SEC = PRODUTO.COD_SEC)'
      
        '  INNER JOIN SECAO_GRUPO_SUBGRUPO ON (SECAO_GRUPO_SUBGRUPO.COD_S' +
        'UBGRUPO = PRODUTO.COD_SGRUP)'
      '  AND (SECAO_GRUPO_SUBGRUPO.COD_SEC = PRODUTO.COD_SEC)'
      '  AND (SECAO_GRUPO_SUBGRUPO.COD_GRUPO = PRODUTO.COD_GRUP)'
      
        ' INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_MED' +
        'IDA.CODIGO)')
    Left = 795
    Top = 40
    object Q_Produtos_inventarioCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Produtos_inventarioCODIGO_BARRA_PRO: TIBStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Q_Produtos_inventarioESTOQUE_MINIMO: TIBBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = '"PRODUTO"."ESTOQUE_MINIMO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 3
    end
    object Q_Produtos_inventarioNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioPRECO_VAREJO: TIBBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = '"PRODUTO"."PRECO_VAREJO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 2
    end
    object Q_Produtos_inventarioPRECO_PROMOCAO: TIBBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = '"PRODUTO"."PRECO_PROMOCAO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 4
    end
    object Q_Produtos_inventarioDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = '"PRODUTO"."DATA_VALIDADE"'
    end
    object Q_Produtos_inventarioDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"MARCAS"."DESCRICAO"'
      Required = True
      Size = 70
    end
    object Q_Produtos_inventarioNOME_SEC: TIBStringField
      FieldName = 'NOME_SEC'
      Origin = '"SECAO"."NOME_SEC"'
      Required = True
      Size = 50
    end
    object Q_Produtos_inventarioDESCRICAO1: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"SECAO_GRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioDESCRICAO2: TIBStringField
      FieldName = 'DESCRICAO2'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioDESCRICAO3: TIBStringField
      FieldName = 'DESCRICAO3'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object Q_Produtos_inventarioQUANT_ESTOQ: TIBBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = '"PRODUTO"."QUANT_ESTOQ"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 3
    end
    object Q_Produtos_inventarioVL_TOTAL_EM_PROD: TFMTBCDField
      FieldName = 'VL_TOTAL_EM_PROD'
      ProviderFlags = []
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 5
    end
  end
  object DS_Q_Produtos_inventario: TDataSource
    DataSet = Q_Produtos_inventario
    Left = 899
    Top = 40
  end
  object QRelVendas: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  VENDAS.COD_VENDAS,'
      '  VENDAS.COD_CLIENTE,'
      '  CLIENTE.NOME_CLI,'
      '  FORMAS_PAGAMENTO.CODIGO,'
      '  FORMAS_PAGAMENTO.DESCRICAO,'
      '  VENDAS.TOTAL,'
      '  VENDAS.DATA,'
      '  VENDAS.HORA,'
      '  VENDAS.OBS'
      'FROM'
      '  CLIENTE'
      '  INNER JOIN VENDAS ON (CLIENTE.COD_CLI = VENDAS.COD_CLIENTE)'
      
        '  INNER JOIN FORMAS_PAGAMENTO ON (VENDAS.COD_FPGTO = FORMAS_PAGA' +
        'MENTO.CODIGO)')
    Left = 800
    Top = 120
    object QRelVendasCOD_VENDAS: TIntegerField
      FieldName = 'COD_VENDAS'
      Origin = '"VENDAS"."COD_VENDAS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelVendasCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"VENDAS"."COD_CLIENTE"'
      Required = True
    end
    object QRelVendasNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QRelVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"FORMAS_PAGAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelVendasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"FORMAS_PAGAMENTO"."DESCRICAO"'
      Required = True
    end
    object QRelVendasTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"VENDAS"."TOTAL"'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QRelVendasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS"."DATA"'
    end
    object QRelVendasHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"VENDAS"."HORA"'
    end
    object QRelVendasOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"VENDAS"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
  end
  object QRelOE: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT SUM(QUANT_ITEM) QUANT, O.COD_ES, I.COD_PRO, P.NOME_PRO,  ' +
        'T.NOME_ES'
      'FROM ITENS_OUTRAS_ENTRADAS I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN OUTRAS_ENTRADAS O'
      'ON (I.COD_OUTRA = O.COD_OUTRA)'
      'INNER JOIN TIPO_ES T'
      'ON (O.COD_ES = T.COD_ES)'
      'GROUP BY O.COD_ES, I.COD_PRO, P.NOME_PRO, T.NOME_ES')
    Left = 896
    Top = 120
    object QRelOEQUANT: TIBBCDField
      FieldName = 'QUANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QRelOECOD_ES: TIntegerField
      FieldName = 'COD_ES'
      Required = True
    end
    object QRelOECOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object QRelOENOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelOENOME_ES: TIBStringField
      FieldName = 'NOME_ES'
      Required = True
      Size = 50
    end
  end
  object Q_RelEntradas: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  ENTRADAS.COD_OUTRA,'
      '  ENTRADAS.DATA_OUTRA,'
      '  ENTRADAS.COD_FOR,'
      '  ENTRADAS.COD_EMP,'
      '  ENTRADAS.TOTAL_OUTRA,'
      '  ENTRADAS.NUMERO_NOTA_FISCAL,'
      '  ENTRADAS.SERIE_NOTA_FISCAL,'
      '  ENTRADAS.CANCELADA,'
      '  ENTRADAS.DATA_VENCTO,'
      '  FORNECEDOR.RAZAO_FOR'
      'FROM'
      '  FORNECEDOR'
      '  INNER JOIN ENTRADAS ON (FORNECEDOR.COD_FOR = ENTRADAS.COD_FOR)')
    Left = 800
    Top = 192
    object Q_RelEntradasCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = '"ENTRADAS"."COD_OUTRA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_RelEntradasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = '"ENTRADAS"."DATA_OUTRA"'
      Required = True
    end
    object Q_RelEntradasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"ENTRADAS"."COD_FOR"'
      Required = True
    end
    object Q_RelEntradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ENTRADAS"."COD_EMP"'
      Required = True
    end
    object Q_RelEntradasTOTAL_OUTRA: TIBBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = '"ENTRADAS"."TOTAL_OUTRA"'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object Q_RelEntradasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = '"ENTRADAS"."NUMERO_NOTA_FISCAL"'
      Required = True
    end
    object Q_RelEntradasSERIE_NOTA_FISCAL: TIBStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = '"ENTRADAS"."SERIE_NOTA_FISCAL"'
      Size = 3
    end
    object Q_RelEntradasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = '"ENTRADAS"."CANCELADA"'
      Required = True
    end
    object Q_RelEntradasDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = '"ENTRADAS"."DATA_VENCTO"'
    end
    object Q_RelEntradasRAZAO_FOR: TIBStringField
      FieldName = 'RAZAO_FOR'
      Origin = '"FORNECEDOR"."RAZAO_FOR"'
      Required = True
      Size = 60
    end
  end
  object tb_usuarios: TIBTable
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'USUARIO'
    UniDirectional = False
    Left = 48
    Top = 352
    object tb_usuariosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Required = True
    end
    object tb_usuariosNOME_USU: TIBStringField
      FieldName = 'NOME_USU'
      Required = True
      Size = 10
    end
    object tb_usuariosSENHA_USU: TIBStringField
      FieldName = 'SENHA_USU'
      Required = True
      Size = 6
    end
    object tb_usuariosCOD_EMPR: TIntegerField
      FieldName = 'COD_EMPR'
      Required = True
    end
    object tb_usuariosOPERADOR_CAIXA: TIBStringField
      FieldName = 'OPERADOR_CAIXA'
      Required = True
      Size = 1
    end
  end
  object Dts_Usuarios: TDataSource
    DataSet = tb_usuarios
    Left = 136
    Top = 352
  end
  object QLogin: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from USUARIO')
    Left = 312
    Top = 352
    object QLoginCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = '"USUARIO"."COD_USU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QLoginNOME_USU: TIBStringField
      FieldName = 'NOME_USU'
      Origin = '"USUARIO"."NOME_USU"'
      Required = True
      Size = 10
    end
    object QLoginSENHA_USU: TIBStringField
      FieldName = 'SENHA_USU'
      Origin = '"USUARIO"."SENHA_USU"'
      Required = True
      Size = 6
    end
    object QLoginCOD_EMPR: TIntegerField
      FieldName = 'COD_EMPR'
      Origin = '"USUARIO"."COD_EMPR"'
      Required = True
    end
    object QLoginOPERADOR_CAIXA: TIBStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = '"USUARIO"."OPERADOR_CAIXA"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QRelOS: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select c.cod_cli, c.nome_cli, O.* from OUTRAS_SAIDAS O, cliente ' +
        'c where c.cod_cli = o.cod_cli')
    Left = 896
    Top = 184
    object QRelOSCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."COD_OUTRA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelOSDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."DATA_OUTRA"'
      Required = True
    end
    object QRelOSCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Origin = '"OUTRAS_SAIDAS"."COD_TIPO"'
      Required = True
    end
    object QRelOSCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"OUTRAS_SAIDAS"."COD_CLI"'
      Required = True
    end
    object QRelOSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"OUTRAS_SAIDAS"."COD_EMP"'
      Required = True
    end
    object QRelOSTOTAL_OUTRA: TIBBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."TOTAL_OUTRA"'
      Precision = 18
      Size = 2
    end
    object QRelOSCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = '"OUTRAS_SAIDAS"."CANCELADA"'
      Required = True
    end
    object QRelOSNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QRelOSCOD_CLI1: TIntegerField
      FieldName = 'COD_CLI1'
      Origin = '"OUTRAS_SAIDAS"."COD_CLI"'
      Required = True
    end
  end
  object Q_RelVencidos: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  ITENS_ENTRADAS.COD_OUTRA,'
      '  ITENS_ENTRADAS.COD_PRO,'
      '  PRODUTO.NOME_PRO,'
      '  ITENS_ENTRADAS.DATA_VENCTO,'
      '  UNIDADE_MEDIDA.DESCRICAO'
      'FROM'
      '  PRODUTO'
      
        '  INNER JOIN ITENS_ENTRADAS ON (PRODUTO.COD_PRO = ITENS_ENTRADAS' +
        '.COD_PRO)'
      
        '  INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_ME' +
        'DIDA.CODIGO)'
      'WHERE'
      '  ITENS_ENTRADAS.DATA_VENCTO between :hj and :hj2'
      'ORDER BY PRODUTO.NOME_PRO,ITENS_ENTRADAS.DATA_VENCTO')
    Left = 800
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hj2'
        ParamType = ptUnknown
      end>
    object Q_RelVencidosCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = '"ITENS_ENTRADAS"."COD_OUTRA"'
      Required = True
    end
    object Q_RelVencidosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ENTRADAS"."COD_PRO"'
      Required = True
    end
    object Q_RelVencidosNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q_RelVencidosDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = '"ITENS_ENTRADAS"."DATA_VENCTO"'
    end
    object Q_RelVencidosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object Q_Qtd_vendida: TIBQuery
    Database = Conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select '
      '    itens_venda.cod_pro,'
      '    vendas.data,'
      '    Sum(itens_venda.quant_item) as total_vendido,'
      '    produto.nome_pro'
      'from vendas'
      
        '   inner join itens_venda on (vendas.cod_vendas = itens_venda.co' +
        'd_venda)'
      '   inner join produto on (itens_venda.cod_pro = produto.cod_pro)'
      'where '
      '   ('
      '    (vendas.data between :dt1 and :dt2)'
      '   )'
      'group by itens_venda.cod_pro,'
      '         vendas.data,'
      '         produto.nome_pro'
      'order by produto.nome_pro')
    Left = 400
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end>
    object Q_Qtd_vendidaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object Q_Qtd_vendidaTOTAL_VENDIDO: TIBBCDField
      FieldName = 'TOTAL_VENDIDO'
      ProviderFlags = []
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 3
    end
    object Q_Qtd_vendidaNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q_Qtd_vendidaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS"."DATA"'
    end
  end
end
