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
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 48
    Top = 48
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
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
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
  object conMysql: TFDConnection
    Params.Strings = (
      'Server=mysql642.umbler.com'
      'Port=41890'
      'User_Name=usr_pdv'
      'Password=comandos123'
      'Database=pdv_galanos'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 624
    Top = 64
  end
  object driveMysql: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Fontes\Sistema Frente De Caixa Pdv\NPDV\ML_FONTES_PRODUTO\Est' +
      'oque\exe\libmySQL.dll'
    Left = 624
    Top = 136
  end
  object sqlVendas_Mysql: TFDQuery
    Connection = conMysql
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    SQL.Strings = (
      'SELECT * FROM vendas LIMIT 1,1'
      '')
    Left = 616
    Top = 200
    object sqlVendas_Mysqlid_venda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_venda'
      Origin = 'id_venda'
    end
    object sqlVendas_Mysqldt_ref: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_ref'
      Origin = 'dt_ref'
    end
    object sqlVendas_Mysqlvalor: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
    end
    object sqlVendas_MysqlEMPRESA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
  end
  object sqlVendas_Itens_Mysql: TFDQuery
    Connection = conMysql
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    SQL.Strings = (
      'select* from vendas_itens')
    Left = 616
    Top = 256
    object sqlVendas_Itens_Mysqlcod_item: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_item'
      Origin = 'cod_item'
    end
    object sqlVendas_Itens_Mysqlid_venda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_venda'
      Origin = 'id_venda'
    end
    object sqlVendas_Itens_Mysqlcod_prod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_prod'
      Origin = 'cod_prod'
    end
    object sqlVendas_Itens_Mysqlquant_item: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quant_item'
      Origin = 'quant_item'
    end
    object sqlVendas_Itens_Mysqlvalor_item: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'valor_item'
      Origin = 'valor_item'
    end
  end
  object sqlVendas_Itens_Para_Mysql: TFDQuery
    Connection = DmDados.Conexao
    SQL.Strings = (
      'select*  '
      'from ITENS_VENDA '
      'where cod_venda = :cod_venda')
    Left = 605
    Top = 319
    ParamData = <
      item
        Name = 'COD_VENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object sqlVendas_Itens_Para_MysqlCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'COD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlVendas_Itens_Para_MysqlCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'COD_VENDA'
      Required = True
    end
    object sqlVendas_Itens_Para_MysqlCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      Required = True
    end
    object sqlVendas_Itens_Para_MysqlCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object sqlVendas_Itens_Para_MysqlORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      Required = True
    end
    object sqlVendas_Itens_Para_MysqlQUANT_ITEM: TBCDField
      FieldName = 'QUANT_ITEM'
      Origin = 'QUANT_ITEM'
      Precision = 18
      Size = 3
    end
    object sqlVendas_Itens_Para_MysqlVALOR_ITEM: TBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object sqlVendasDeletarMysql: TFDQuery
    Connection = conMysql
    SQL.Strings = (
      'delete from vendas where id_venda = :id_venda'
      ' ')
    Left = 477
    Top = 383
    ParamData = <
      item
        Name = 'ID_VENDA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object sqlVendasDeletar: TFDQuery
    Connection = conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'delete from ITENS_VENDA where cod_venda = :cod_venda'
      ' ')
    Left = 376
    Top = 360
    ParamData = <
      item
        Name = 'COD_VENDA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object sqlItensVendasDeletar: TFDQuery
    Connection = conexao
    Transaction = IBTransaction1
    SQL.Strings = (
      'delete from ITENS_VENDA where cod_venda = :cod_venda'
      ' ')
    Left = 376
    Top = 320
    ParamData = <
      item
        Name = 'COD_VENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlItensVendasDeletarMysql: TFDQuery
    Connection = conMysql
    SQL.Strings = (
      'delete from vendas_itens where id_venda = :id_venda'
      ' ')
    Left = 477
    Top = 335
    ParamData = <
      item
        Name = 'ID_VENDA'
        DataType = ftWideString
        ParamType = ptInput
        Value = '1'
      end>
  end
end
