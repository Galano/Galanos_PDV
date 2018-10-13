object FrmConsClientes01: TFrmConsClientes01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Consulta de Cliente'
  ClientHeight = 460
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 441
    Width = 691
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GBCons: TGroupBox
      Left = 8
      Top = 5
      Width = 177
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
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
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
      object BtnCons: TSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
          00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
          C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
          F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
          FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
          C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
          FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
          EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
          BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
          FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
          D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
          FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
          B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
      end
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
    object BtnOk: TButton
      Left = 583
      Top = 39
      Width = 97
      Height = 32
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object RdgAtivo: TRadioGroup
      Left = 8
      Top = 53
      Width = 569
      Height = 33
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ativos'
        'Destivados'
        'Todos')
      TabOrder = 3
    end
    object btnFormataCPF: TButton
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btnFormataCPF'
      TabOrder = 4
      Visible = False
      OnClick = btnFormataCPFClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 691
    Height = 352
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 687
      Height = 348
      Align = alClient
      Color = clSilver
      DataSource = DSQConsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
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
