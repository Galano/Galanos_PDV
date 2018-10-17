object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 563
  Width = 1237
  object IBTransaction1: TFDTransaction
    Connection = Conexao
    Left = 128
    Top = 32
  end
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Fontes\Sistema Frente De Caixa Pdv\NPDV\ML_FONTES_PR' +
        'ODUTO\Estoque\database\ESTOQUE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object tb_empresa: TFDTable
    IndexFieldNames = 'COD_EMP'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'EMPRESA'
    TableName = 'EMPRESA'
    Left = 56
    Top = 112
    object tb_empresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_empresaRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'RAZAO_EMP'
      Required = True
      Size = 50
    end
    object tb_empresaEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = 'END_EMP'
      Size = 50
    end
    object tb_empresaBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = 'BAI_EMP'
      Size = 30
    end
    object tb_empresaCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = 'CID_EMP'
      Size = 30
    end
    object tb_empresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object tb_empresaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = 'EST_EMP'
      FixedChar = True
      Size = 2
    end
    object tb_empresaINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = 'INSC_EMP'
    end
    object tb_empresaTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = 'TEL_EMP'
      Size = 13
    end
    object tb_empresaFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = 'FAX_EMP'
      Size = 13
    end
    object tb_empresaNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = 'NUMERO_EMP'
      Size = 10
    end
    object tb_empresaRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = 'RESP_EMP'
      Size = 50
    end
    object tb_empresaCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = 'CAMINHO_FOTO_EMP'
      Size = 150
    end
    object tb_empresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      Size = 50
    end
    object tb_empresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = 'CNPJ_EMP'
      Size = 14
    end
    object tb_empresaCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = 'CAMINHO_VALIDADOR_SINTEGRA'
      Size = 80
    end
    object tb_empresaINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'INSCRICAO_MUNICIPAL'
    end
  end
  object tb_vendedor: TFDTable
    IndexFieldNames = 'COD_VEND'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'VENDEDOR'
    TableName = 'VENDEDOR'
    Left = 56
    Top = 176
    object tb_vendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'COD_VEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_vendedorNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'NOME_VEND'
      Required = True
      Size = 50
    end
    object tb_vendedorATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Origin = 'ATIVO_VEND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_vendedorCOMISSAO_VEND: TBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = 'COMISSAO_VEND'
      Precision = 18
      Size = 2
    end
  end
  object tb_classifica_cliente: TFDTable
    IndexFieldNames = 'COD_CLA'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'CLASSIF_CLIENTE'
    TableName = 'CLASSIF_CLIENTE'
    Left = 55
    Top = 240
    object tb_classifica_clienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'COD_CLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_classifica_clienteNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'NOME_CLA'
      Required = True
      Size = 30
    end
  end
  object tb_fornecedor: TFDTable
    IndexFieldNames = 'COD_FOR'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'FORNECEDOR'
    TableName = 'FORNECEDOR'
    Left = 472
    Top = 32
    object tb_fornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_fornecedorFJ_FOR: TStringField
      FieldName = 'FJ_FOR'
      Origin = 'FJ_FOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_fornecedorRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
    object tb_fornecedorEND_FOR: TStringField
      FieldName = 'END_FOR'
      Origin = 'END_FOR'
      Size = 50
    end
    object tb_fornecedorBAI_FOR: TStringField
      FieldName = 'BAI_FOR'
      Origin = 'BAI_FOR'
      Size = 30
    end
    object tb_fornecedorCID_FOR: TStringField
      FieldName = 'CID_FOR'
      Origin = 'CID_FOR'
      Size = 30
    end
    object tb_fornecedorCEP_FOR: TStringField
      FieldName = 'CEP_FOR'
      Origin = 'CEP_FOR'
      FixedChar = True
      Size = 9
    end
    object tb_fornecedorEST_FOR: TStringField
      FieldName = 'EST_FOR'
      Origin = 'EST_FOR'
      FixedChar = True
      Size = 2
    end
    object tb_fornecedorCNPJ_FOR: TStringField
      FieldName = 'CNPJ_FOR'
      Origin = 'CNPJ_FOR'
      Size = 18
    end
    object tb_fornecedorINSC_FOR: TStringField
      FieldName = 'INSC_FOR'
      Origin = 'INSC_FOR'
    end
    object tb_fornecedorTEL_FOR: TStringField
      FieldName = 'TEL_FOR'
      Origin = 'TEL_FOR'
      Size = 13
    end
    object tb_fornecedorFAX_FOR: TStringField
      FieldName = 'FAX_FOR'
      Origin = 'FAX_FOR'
      Size = 13
    end
    object tb_fornecedorCONTATO_FOR: TStringField
      FieldName = 'CONTATO_FOR'
      Origin = 'CONTATO_FOR'
      Size = 50
    end
    object tb_fornecedorNUM_FOR: TStringField
      FieldName = 'NUM_FOR'
      Origin = 'NUM_FOR'
      Size = 10
    end
    object tb_fornecedorCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
    object tb_fornecedorEMAIL_FOR: TStringField
      FieldName = 'EMAIL_FOR'
      Origin = 'EMAIL_FOR'
      Size = 100
    end
  end
  object tb_fpagamentos: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'FORMAS_PAGAMENTO'
    TableName = 'FORMAS_PAGAMENTO'
    Left = 320
    Top = 216
    object tb_fpagamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_fpagamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
  end
  object tb_clientes: TFDTable
    IndexFieldNames = 'COD_CLI'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'CLIENTE'
    TableName = 'CLIENTE'
    Left = 48
    Top = 296
    object tb_clientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_clientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object tb_clientesCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'COD_CLA'
      Required = True
    end
    object tb_clientesENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'ENDRES_CLI'
      Size = 50
    end
    object tb_clientesBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'BAIRES_CLI'
      Size = 30
    end
    object tb_clientesCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CIDRES_CLI'
      Size = 30
    end
    object tb_clientesESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object tb_clientesCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object tb_clientesTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object tb_clientesCPF_CLI: TStringField
      FieldName = 'CPF_CLI'
      Origin = 'CPF_CLI'
      Size = 18
    end
    object tb_clientesRG_CLI: TStringField
      FieldName = 'RG_CLI'
      Origin = 'RG_CLI'
    end
    object tb_clientesAPELIDO_CLI: TStringField
      FieldName = 'APELIDO_CLI'
      Origin = 'APELIDO_CLI'
      Size = 50
    end
    object tb_clientesLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object tb_clientesATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_clientesOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = 'OBS_CLI'
      Size = 500
    end
    object tb_clientesNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'NASCIMENTO_CLI'
    end
    object tb_clientesDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'DATACADASTRO_CLI'
      Required = True
    end
    object tb_clientesATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = 'ATRAZO_MAXIMO_CLI'
    end
    object tb_clientesCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CELULAR_CLI'
      Size = 13
    end
    object tb_clientesIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = 'IMP_SALDO_PENDENTE_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_clientesLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object tb_clientesCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = 'CONTATO_CLI'
      Size = 70
    end
    object tb_clientesCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = 'CONTROLAR_LIMITE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_clientesEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = 'EMAIL_CLI'
      Size = 100
    end
  end
  object tb_secao: TFDTable
    IndexFieldNames = 'COD_SEC'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'SECAO'
    TableName = 'SECAO'
    Left = 320
    Top = 144
    object tb_secaoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_secaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      Required = True
      Size = 50
    end
  end
  object tb_UnidadesMedidas: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'UNIDADE_MEDIDA'
    TableName = 'UNIDADE_MEDIDA'
    Left = 320
    Top = 288
    object tb_UnidadesMedidasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_UnidadesMedidasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
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
  object Q_Consulta: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    Left = 288
    Top = 88
  end
  object tb_marcas: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'MARCAS'
    TableName = 'MARCAS'
    Left = 600
    Top = 128
    object tb_marcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_marcasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 70
    end
  end
  object tb_produtos: TFDTable
    IndexFieldNames = 'COD_PRO'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'PRODUTO'
    TableName = 'PRODUTO'
    Left = 608
    Top = 200
    object tb_produtosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_produtosCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object tb_produtosTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'TP_PRODUTO'
      Required = True
      Size = 80
    end
    object tb_produtosTP_PRODUCAO: TStringField
      FieldName = 'TP_PRODUCAO'
      Origin = 'TP_PRODUCAO'
      Size = 80
    end
    object tb_produtosESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 3
    end
    object tb_produtosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object tb_produtosDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      Required = True
      Size = 80
    end
    object tb_produtosCOD_MARC: TIntegerField
      FieldName = 'COD_MARC'
      Origin = 'COD_MARC'
      Required = True
    end
    object tb_produtosCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      Required = True
    end
    object tb_produtosCOD_GRUP: TIntegerField
      FieldName = 'COD_GRUP'
      Origin = 'COD_GRUP'
      Required = True
    end
    object tb_produtosCOD_SGRUP: TIntegerField
      FieldName = 'COD_SGRUP'
      Origin = 'COD_SGRUP'
      Required = True
    end
    object tb_produtosCOD_UNI_ENT: TIntegerField
      FieldName = 'COD_UNI_ENT'
      Origin = 'COD_UNI_ENT'
      Required = True
    end
    object tb_produtosCOD_UNI_SAI: TIntegerField
      FieldName = 'COD_UNI_SAI'
      Origin = 'COD_UNI_SAI'
      Required = True
    end
    object tb_produtosPRECO_VAREJO: TBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object tb_produtosPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Precision = 18
    end
    object tb_produtosPRECO_PRAZO: TBCDField
      FieldName = 'PRECO_PRAZO'
      Origin = 'PRECO_PRAZO'
      Precision = 18
    end
    object tb_produtosMARGEM_LUCRO: TBCDField
      FieldName = 'MARGEM_LUCRO'
      Origin = 'MARGEM_LUCRO'
      Precision = 18
    end
    object tb_produtosQUANT_ESTOQ: TBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
    object tb_produtosDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
    end
    object tb_produtosDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = 'DIAS_VALIDADE_PRO'
    end
    object tb_produtosCONTROLA_ESTOQUE_PRO: TStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = 'CONTROLA_ESTOQUE_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_produtosATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tb_produtosCAMINHO_FOTO_PRO: TBlobField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = 'CAMINHO_FOTO_PRO'
    end
  end
  object Dts_produtos: TDataSource
    DataSet = tb_produtos
    Left = 680
    Top = 200
  end
  object Q_Fornecedor: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FO' +
        'RNECEDOR ')
    Left = 1056
    Top = 16
    object Q_FornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_FornecedorRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
    object Q_FornecedorTEL_FOR: TStringField
      FieldName = 'TEL_FOR'
      Origin = 'TEL_FOR'
      Size = 13
    end
    object Q_FornecedorFAX_FOR: TStringField
      FieldName = 'FAX_FOR'
      Origin = 'FAX_FOR'
      Size = 13
    end
    object Q_FornecedorCONTATO_FOR: TStringField
      FieldName = 'CONTATO_FOR'
      Origin = 'CONTATO_FOR'
      Size = 50
    end
  end
  object Dts_Q_Fornecedor: TDataSource
    DataSet = Q_Fornecedor
    Left = 1128
    Top = 16
  end
  object Q_Produtos: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
      Origin = 'COD_PRO'
      Required = True
    end
    object Q_ProdutosCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object Q_ProdutosESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 3
    end
    object Q_ProdutosQUANT_ESTOQ: TBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
    object Q_ProdutosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object Q_ProdutosPRECO_VAREJO: TBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object Q_ProdutosPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Precision = 18
    end
    object Q_ProdutosDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
    end
    object Q_ProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 70
    end
    object Q_ProdutosNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object Q_ProdutosDESCRICAO_1: TStringField
      FieldName = 'DESCRICAO_1'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object Q_ProdutosDESCRICAO_2: TStringField
      FieldName = 'DESCRICAO_2'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object Q_ProdutosDESCRICAO_3: TStringField
      FieldName = 'DESCRICAO_3'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DS_Q_Produtos: TDataSource
    DataSet = Q_Produtos
    Left = 1136
    Top = 88
  end
  object Q_executa: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    Left = 360
    Top = 96
  end
  object Q_Clientes: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT C.COD_CLI, C.NOME_CLI, C.NASCIMENTO_CLI, C.TELRES_CLI'
      'FROM CLIENTE C')
    Left = 1056
    Top = 160
    object Q_ClientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ClientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object Q_ClientesNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'NASCIMENTO_CLI'
    end
    object Q_ClientesTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'TELRES_CLI'
      FixedChar = True
      Size = 13
    end
  end
  object DS_Q_clientes: TDataSource
    DataSet = Q_Clientes
    Left = 1136
    Top = 160
  end
  object Q_Vendedores: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT * FROM VENDEDOR ORDER BY COD_VEND')
    Left = 1056
    Top = 240
    object Q_VendedoresCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'COD_VEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_VendedoresNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'NOME_VEND'
      Required = True
      Size = 50
    end
    object Q_VendedoresATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Origin = 'ATIVO_VEND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q_VendedoresCOMISSAO_VEND: TBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = 'COMISSAO_VEND'
      Precision = 18
      Size = 2
    end
  end
  object DS_Q_Vendedores: TDataSource
    DataSet = Q_Vendedores
    Left = 1144
    Top = 240
  end
  object Q_Classifica: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIF_CLIENTE')
    Left = 1057
    Top = 320
    object Q_ClassificaCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'COD_CLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ClassificaNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'NOME_CLA'
      Required = True
      Size = 30
    end
  end
  object DS_Q_Classifica: TDataSource
    DataSet = Q_Classifica
    Left = 1144
    Top = 320
  end
  object Q_Secao_Grupo: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
    object Q_Secao_GrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Secao_GrupoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object Q_Secao_GrupoCOD_GRUPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Q_Secao_GrupoNOME_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object Q_Secao_GrupoCOD_SUBGRUPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_SUBGRUPO'
      Origin = 'COD_SUBGRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Q_Secao_GrupoNOME_SUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SUBGRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
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
  object Q_Marcas: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'select *  from MARCAS')
    Left = 840
    Top = 392
    object Q_MarcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_MarcasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 70
    end
  end
  object tb_entradas: TFDTable
    IndexFieldNames = 'COD_OUTRA'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'ENTRADAS'
    TableName = 'ENTRADAS'
    Left = 600
    Top = 264
    object tb_entradasCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'COD_OUTRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_entradasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'DATA_OUTRA'
      Required = True
    end
    object tb_entradasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      Required = True
    end
    object tb_entradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object tb_entradasTOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object tb_entradasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object tb_entradasSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object tb_entradasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object tb_entradasDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = 'DATA_VENCTO'
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
  object tb_Outras_Saidas: TFDTable
    IndexFieldNames = 'COD_OUTRA'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'OUTRAS_SAIDAS'
    TableName = 'OUTRAS_SAIDAS'
    Left = 584
    Top = 328
    object tb_Outras_SaidasCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'COD_OUTRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_Outras_SaidasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'DATA_OUTRA'
      Required = True
    end
    object tb_Outras_SaidasCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      Required = True
    end
    object tb_Outras_SaidasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      Required = True
    end
    object tb_Outras_SaidasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object tb_Outras_SaidasTOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object tb_Outras_SaidasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
  end
  object Q_Produtos_inventario: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
      Origin = 'COD_PRO'
      Required = True
    end
    object Q_Produtos_inventarioCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object Q_Produtos_inventarioESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 3
    end
    object Q_Produtos_inventarioQUANT_ESTOQ: TBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
    object Q_Produtos_inventarioNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioPRECO_VAREJO: TBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object Q_Produtos_inventarioPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Precision = 18
    end
    object Q_Produtos_inventarioDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
    end
    object Q_Produtos_inventarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 70
    end
    object Q_Produtos_inventarioNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object Q_Produtos_inventarioDESCRICAO_1: TStringField
      FieldName = 'DESCRICAO_1'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioDESCRICAO_2: TStringField
      FieldName = 'DESCRICAO_2'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object Q_Produtos_inventarioDESCRICAO_3: TStringField
      FieldName = 'DESCRICAO_3'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
    object Q_Produtos_inventarioVL_TOTAL_EM_PROD: TFMTBCDField
      FieldName = 'VL_TOTAL_EM_PROD'
      Origin = 'VL_TOTAL_EM_PROD'
      Precision = 18
      Size = 5
    end
  end
  object DS_Q_Produtos_inventario: TDataSource
    DataSet = Q_Produtos_inventario
    Left = 899
    Top = 40
  end
  object QRelVendas: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
      Origin = 'COD_VENDAS'
      Required = True
    end
    object QRelVendasCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Required = True
    end
    object QRelVendasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object QRelVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object QRelVendasTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 3
    end
    object QRelVendasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object QRelVendasHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object QRelVendasOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
  end
  object QRelOE: TFDQuery
    Connection = Conexao
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
  end
  object Q_RelEntradas: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
      Origin = 'COD_OUTRA'
      Required = True
    end
    object Q_RelEntradasDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'DATA_OUTRA'
      Required = True
    end
    object Q_RelEntradasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_RelEntradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object Q_RelEntradasTOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object Q_RelEntradasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object Q_RelEntradasSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object Q_RelEntradasCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object Q_RelEntradasDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = 'DATA_VENCTO'
    end
    object Q_RelEntradasRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
  end
  object tb_usuarios: TFDTable
    IndexFieldNames = 'COD_USU'
    Connection = Conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'USUARIO'
    TableName = 'USUARIO'
    Left = 48
    Top = 352
    object tb_usuariosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tb_usuariosNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      Required = True
      Size = 10
    end
    object tb_usuariosSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'SENHA_USU'
      Required = True
      Size = 6
    end
    object tb_usuariosCOD_EMPR: TIntegerField
      FieldName = 'COD_EMPR'
      Origin = 'COD_EMPR'
      Required = True
    end
    object tb_usuariosOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object Dts_Usuarios: TDataSource
    DataSet = tb_usuarios
    Left = 136
    Top = 352
  end
  object QLogin: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'select *  from USUARIO')
    Left = 312
    Top = 352
    object QLoginCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QLoginNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      Required = True
      Size = 10
    end
    object QLoginSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'SENHA_USU'
      Required = True
      Size = 6
    end
    object QLoginCOD_EMPR: TIntegerField
      FieldName = 'COD_EMPR'
      Origin = 'COD_EMPR'
      Required = True
    end
    object QLoginOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QRelOS: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select c.cod_cli, c.nome_cli, O.* from OUTRAS_SAIDAS O, cliente ' +
        'c where c.cod_cli = o.cod_cli')
    Left = 896
    Top = 184
    object QRelOSCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      Required = True
    end
    object QRelOSNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelOSCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'COD_OUTRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelOSDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'DATA_OUTRA'
      Required = True
    end
    object QRelOSCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      Required = True
    end
    object QRelOSCOD_CLI_1: TIntegerField
      FieldName = 'COD_CLI_1'
      Origin = 'COD_CLI'
      Required = True
    end
    object QRelOSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QRelOSTOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object QRelOSCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
  end
  object Q_RelVencidos: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
    object Q_RelVencidosCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'COD_OUTRA'
      Required = True
    end
    object Q_RelVencidosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_RelVencidosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object Q_RelVencidosDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = 'DATA_VENCTO'
    end
    object Q_RelVencidosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object Q_Qtd_vendida: TFDQuery
    Connection = Conexao
    Transaction = IBTransaction1
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
    object Q_Qtd_vendidaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      Required = True
    end
    object Q_Qtd_vendidaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object Q_Qtd_vendidaTOTAL_VENDIDO: TBCDField
      FieldName = 'TOTAL_VENDIDO'
      Origin = 'TOTAL_VENDIDO'
      Precision = 18
      Size = 3
    end
    object Q_Qtd_vendidaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
  end
end
