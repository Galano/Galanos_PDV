object FrmConsCliente: TFrmConsCliente
  Left = 413
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Estoque Master -  Consulta de Clientes'
  ClientHeight = 417
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
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
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 369
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
        OnChange = EdtConsChange
        OnKeyDown = EdtConsKeyDown
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
  object DBGrid: TDBGrid
    Left = 0
    Top = 89
    Width = 687
    Height = 328
    Align = alClient
    Color = clSilver
    DataSource = DSQConsCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
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
        Width = 50
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
        Width = 64
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'TELRES_CLI'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFONE'
        Width = 64
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'NASCIMENTO_CLI'
        Title.Alignment = taCenter
        Title.Caption = 'NASCIMENTO'
        Width = 64
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
  object DSQConsCliente: TDataSource
    AutoEdit = False
    DataSet = QConsCliente
    Left = 144
    Top = 256
  end
  object QConsCliente: TFDQuery
    Connection = DmDados.conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'SELECT C.*, S.NOME_CLA'
      'FROM CLIENTE C'
      'INNER JOIN CLASSIF_CLIENTE S'
      'ON (C.COD_CLA = S.COD_CLA)')
    Left = 144
    Top = 200
    object QConsClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsClienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'COD_CLA'
      Required = True
    end
    object QConsClienteENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'ENDRES_CLI'
      Size = 50
    end
    object QConsClienteBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'BAIRES_CLI'
      Size = 30
    end
    object QConsClienteCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CIDRES_CLI'
      Size = 30
    end
    object QConsClienteESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QConsClienteCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QConsClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsClienteCPF_CLI: TStringField
      FieldName = 'CPF_CLI'
      Origin = 'CPF_CLI'
      Size = 18
    end
    object QConsClienteRG_CLI: TStringField
      FieldName = 'RG_CLI'
      Origin = 'RG_CLI'
    end
    object QConsClienteAPELIDO_CLI: TStringField
      FieldName = 'APELIDO_CLI'
      Origin = 'APELIDO_CLI'
      Size = 50
    end
    object QConsClienteLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object QConsClienteATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = 'OBS_CLI'
      Size = 500
    end
    object QConsClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'NASCIMENTO_CLI'
    end
    object QConsClienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'DATACADASTRO_CLI'
      Required = True
    end
    object QConsClienteATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = 'ATRAZO_MAXIMO_CLI'
    end
    object QConsClienteCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CELULAR_CLI'
      Size = 13
    end
    object QConsClienteIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = 'IMP_SALDO_PENDENTE_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object QConsClienteCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = 'CONTATO_CLI'
      Size = 70
    end
    object QConsClienteCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = 'CONTROLAR_LIMITE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = 'EMAIL_CLI'
      Size = 100
    end
    object QConsClienteNOME_CLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLA'
      Origin = 'NOME_CLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
end
