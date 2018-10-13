object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 355
  Width = 599
  object conexao: TIBDatabase
    DatabaseName = 
      'D:\Alessandro\Delphi\Sistemas\Estoque AllSoftware\database\ESTOQ' +
      'UE.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 48
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 136
    Top = 40
  end
  object tb_fpagamentos: TIBTable
    Database = conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FORMAS_PAGAMENTO'
    UniDirectional = False
    Left = 280
    Top = 208
    object tb_fpagamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tb_fpagamentosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object Dts_fPagamentos: TDataSource
    DataSet = tb_fpagamentos
    Left = 364
    Top = 208
  end
  object Dts_clientes: TDataSource
    DataSet = tb_clientes
    Left = 142
    Top = 296
  end
  object tb_clientes: TIBTable
    Database = conexao
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
  object Dts_vendedor: TDataSource
    DataSet = tb_vendedor
    Left = 137
    Top = 176
  end
  object tb_vendedor: TIBTable
    Database = conexao
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
  object Dts_empresa: TDataSource
    DataSet = tb_empresa
    Left = 128
    Top = 112
  end
  object tb_empresa: TIBTable
    Database = conexao
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
  object Q_Consulta: TIBQuery
    Database = conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 288
    Top = 88
  end
  object Q_executa: TIBQuery
    Database = conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 360
    Top = 96
  end
  object QLogin: TIBQuery
    Database = conexao
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from USUARIO')
    Left = 304
    Top = 280
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
end
