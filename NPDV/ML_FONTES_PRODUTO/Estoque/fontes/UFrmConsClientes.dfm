object FrmConsClientes: TFrmConsClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master -  Consulta de Clientes'
  ClientHeight = 482
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 463
    Width = 693
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object btnFormataCPF: TButton
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnFormataCPF'
      TabOrder = 0
      Visible = False
      OnClick = btnFormataCPFClick
    end
    object BtnOk: TButton
      Left = 583
      Top = 39
      Width = 97
      Height = 32
      Caption = 'OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object RdgAtivo: TRadioGroup
      Left = 8
      Top = 51
      Width = 569
      Height = 33
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ativos'
        'Destivados'
        'Todos')
      TabOrder = 2
    end
    object GBCons: TGroupBox
      Left = 8
      Top = 5
      Width = 177
      Height = 46
      Caption = 'Consultar por'
      TabOrder = 3
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = 'NOME'
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'NOME'
          'BLOQUEADOS'
          'PALAVRA CHAVE'
          'CIDADE'
          'CNPJ/CPF')
      end
    end
    object GB2: TGroupBox
      Left = 192
      Top = 5
      Width = 385
      Height = 46
      Caption = 'Consultar por'
      TabOrder = 4
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 369
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 693
    Height = 374
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnSair: TButton
      Left = 316
      Top = 343
      Width = 65
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 689
      Height = 335
      Align = alTop
      Color = clSilver
      DataSource = DSQConsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'ATIVO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'SITUA'#199#195'O'
          Width = 119
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CIDRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CIDADE'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TELRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NASCIMENTO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NASCIMENTO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CNPJ_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CPF/CNPJ'
          Width = 132
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLA'
          Title.Alignment = taCenter
          Title.Caption = 'CLASSIFICA'#199#195'O'
          Width = 124
          Visible = True
        end>
    end
  end
  object QDias: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(VENCTO_CTR) VENC'
      'FROM CONTAS_RECEBER R'
      'WHERE R.COD_CLI = :CODCLI AND'
      'R.DTPAGTO_CTR IS NULL')
    Left = 216
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
    object QDiasVENC: TDateField
      FieldName = 'VENC'
    end
    object QDiasDIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIAS'
      Calculated = True
    end
  end
  object QConsCliente: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT C.*, S.NOME_CLA'
      'FROM CLIENTE C'
      'INNER JOIN CLASSIF_CLIENTE S'
      'ON (C.COD_CLA = S.COD_CLA)')
    Left = 144
    Top = 200
    object QConsClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsClienteNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QConsClienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = '"CLIENTE"."COD_CLA"'
      Required = True
    end
    object QConsClienteENDRES_CLI: TIBStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QConsClienteBAIRES_CLI: TIBStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QConsClienteCIDRES_CLI: TIBStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QConsClienteESTRES_CLI: TIBStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QConsClienteCEPRES_CLI: TIBStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QConsClienteTELRES_CLI: TIBStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object QConsClienteCPF_CLI: TIBStringField
      FieldName = 'CPF_CLI'
      Origin = '"CLIENTE"."CPF_CLI"'
      Size = 18
    end
    object QConsClienteRG_CLI: TIBStringField
      FieldName = 'RG_CLI'
      Origin = '"CLIENTE"."RG_CLI"'
    end
    object QConsClienteAPELIDO_CLI: TIBStringField
      FieldName = 'APELIDO_CLI'
      Origin = '"CLIENTE"."APELIDO_CLI"'
      Size = 50
    end
    object QConsClienteLIMITE_CLI: TIBBCDField
      FieldName = 'LIMITE_CLI'
      Origin = '"CLIENTE"."LIMITE_CLI"'
      Precision = 18
      Size = 2
    end
    object QConsClienteATIVO_CLI: TIBStringField
      FieldName = 'ATIVO_CLI'
      Origin = '"CLIENTE"."ATIVO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteOBS_CLI: TIBStringField
      FieldName = 'OBS_CLI'
      Origin = '"CLIENTE"."OBS_CLI"'
      Size = 500
    end
    object QConsClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = '"CLIENTE"."NASCIMENTO_CLI"'
    end
    object QConsClienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = '"CLIENTE"."DATACADASTRO_CLI"'
      Required = True
    end
    object QConsClienteATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = '"CLIENTE"."ATRAZO_MAXIMO_CLI"'
    end
    object QConsClienteCELULAR_CLI: TIBStringField
      FieldName = 'CELULAR_CLI'
      Origin = '"CLIENTE"."CELULAR_CLI"'
      Size = 13
    end
    object QConsClienteIMP_SALDO_PENDENTE_CLI: TIBStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = '"CLIENTE"."IMP_SALDO_PENDENTE_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteLIMITE_CHEQUE: TIBBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = '"CLIENTE"."LIMITE_CHEQUE"'
      Precision = 18
      Size = 2
    end
    object QConsClienteCONTATO_CLI: TIBStringField
      FieldName = 'CONTATO_CLI'
      Origin = '"CLIENTE"."CONTATO_CLI"'
      Size = 70
    end
    object QConsClienteCONTROLAR_LIMITE: TIBStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = '"CLIENTE"."CONTROLAR_LIMITE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteEMAIL_CLI: TIBStringField
      FieldName = 'EMAIL_CLI'
      Origin = '"CLIENTE"."EMAIL_CLI"'
      Size = 100
    end
    object QConsClienteNOME_CLA: TIBStringField
      FieldName = 'NOME_CLA'
      Origin = '"CLASSIF_CLIENTE"."NOME_CLA"'
      Required = True
      Size = 30
    end
  end
  object DSQConsCliente: TDataSource
    AutoEdit = False
    DataSet = QConsCliente
    Left = 144
    Top = 256
  end
end
