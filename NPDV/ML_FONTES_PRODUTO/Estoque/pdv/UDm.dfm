object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 430
  Width = 711
  object IBTransaction1: TFDTransaction
    Connection = conexao
    Left = 136
    Top = 48
  end
  object conexao: TFDConnection
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
  object tb_fpagamentos: TFDTable
    Connection = conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'FORMAS_PAGAMENTO'
    TableName = 'FORMAS_PAGAMENTO'
    Left = 272
    Top = 208
    object tb_fpagamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tb_fpagamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
  object Dts_fPagamentos: TDataSource
    DataSet = tb_fpagamentos
    Left = 364
    Top = 208
  end
  object tb_clientes: TFDTable
    Connection = conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'CLIENTE'
    TableName = 'CLIENTE'
    Left = 48
    Top = 296
    object tb_clientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object tb_clientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object tb_clientesCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Required = True
    end
    object tb_clientesENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Size = 50
    end
    object tb_clientesBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Size = 30
    end
    object tb_clientesCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Size = 30
    end
    object tb_clientesESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Size = 2
    end
    object tb_clientesCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Size = 9
    end
    object tb_clientesTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Size = 13
    end
    object tb_clientesCPF_CLI: TStringField
      FieldName = 'CPF_CLI'
      Size = 18
    end
    object tb_clientesRG_CLI: TStringField
      FieldName = 'RG_CLI'
    end
    object tb_clientesAPELIDO_CLI: TStringField
      FieldName = 'APELIDO_CLI'
      Size = 50
    end
    object tb_clientesLIMITE_CLI: TFloatField
      FieldName = 'LIMITE_CLI'
    end
    object tb_clientesATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Required = True
      Size = 1
    end
    object tb_clientesOBS_CLI: TStringField
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
    object tb_clientesCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Size = 13
    end
    object tb_clientesIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Required = True
      Size = 1
    end
    object tb_clientesLIMITE_CHEQUE: TFloatField
      FieldName = 'LIMITE_CHEQUE'
    end
    object tb_clientesCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Size = 70
    end
    object tb_clientesCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Required = True
      Size = 1
    end
    object tb_clientesEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Size = 100
    end
  end
  object Dts_clientes: TDataSource
    DataSet = tb_clientes
    Left = 142
    Top = 296
  end
  object tb_vendedor: TFDTable
    IndexFieldNames = 'COD_VEND'
    Connection = conexao
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'VENDEDOR'
    TableName = 'VENDEDOR'
    Left = 56
    Top = 176
    object tb_vendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Required = True
    end
    object tb_vendedorNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Required = True
      Size = 50
    end
    object tb_vendedorATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Required = True
      Size = 1
    end
    object tb_vendedorCOMISSAO_VEND: TFloatField
      FieldName = 'COMISSAO_VEND'
    end
  end
  object Dts_vendedor: TDataSource
    DataSet = tb_vendedor
    Left = 137
    Top = 176
  end
  object tb_empresa: TFDTable
    IndexFieldNames = 'COD_EMP'
    Connection = conexao
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
  object Dts_empresa: TDataSource
    DataSet = tb_empresa
    Left = 128
    Top = 112
  end
  object Q_Consulta: TFDQuery
    Connection = conexao
    Transaction = IBTransaction1
    Left = 288
    Top = 88
  end
  object Q_executa: TFDQuery
    Connection = conexao
    Transaction = IBTransaction1
    Left = 360
    Top = 96
  end
  object QLogin: TFDQuery
    Connection = conexao
    Transaction = IBTransaction1
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
    object QLoginNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = '"USUARIO"."NOME_USU"'
      Required = True
      Size = 10
    end
    object QLoginSENHA_USU: TStringField
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
    object QLoginOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = '"USUARIO"."OPERADOR_CAIXA"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
