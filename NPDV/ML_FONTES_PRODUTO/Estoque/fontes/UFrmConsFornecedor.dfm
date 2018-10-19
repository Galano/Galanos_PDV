object FrmConsFornecedor: TFrmConsFornecedor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Consulta Fornecedor'
  ClientHeight = 379
  ClientWidth = 575
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 145
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 129
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = 'NOME'
        Items.Strings = (
          'C'#211'DIGO'
          'NOME'
          'CNPJ/CPF'
          'PALAVRA CHAVE')
      end
    end
    object GB2: TGroupBox
      Left = 160
      Top = 5
      Width = 321
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
      end
    end
    object BtnOk: TButton
      Left = 496
      Top = 18
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 575
    Height = 303
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 240
      Top = 271
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object DBGrid: TDBGrid
      Left = 8
      Top = 8
      Width = 561
      Height = 257
      Color = clSilver
      DataSource = DSConsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'COD_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 58
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'RAZ'#195'O SOCIAL'
          Width = 349
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CNPJ_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ/CPF'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TEL_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'FAX_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FAX'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CONTATO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'CONTATO'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 360
    Width = 575
    Height = 19
    Panels = <>
  end
  object DSConsulta: TDataSource
    DataSet = Q_Consulta
    Left = 289
    Top = 137
  end
  object Q_Consulta: TFDQuery
    Connection = DmDados.Conexao
    SQL.Strings = (
      'SELECT * FROM FORNECEDOR')
    Left = 224
    Top = 136
    object Q_ConsultaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ConsultaFJ_FOR: TStringField
      FieldName = 'FJ_FOR'
      Origin = 'FJ_FOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q_ConsultaRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
    object Q_ConsultaEND_FOR: TStringField
      FieldName = 'END_FOR'
      Origin = 'END_FOR'
      Size = 50
    end
    object Q_ConsultaBAI_FOR: TStringField
      FieldName = 'BAI_FOR'
      Origin = 'BAI_FOR'
      Size = 30
    end
    object Q_ConsultaCID_FOR: TStringField
      FieldName = 'CID_FOR'
      Origin = 'CID_FOR'
      Size = 30
    end
    object Q_ConsultaCEP_FOR: TStringField
      FieldName = 'CEP_FOR'
      Origin = 'CEP_FOR'
      FixedChar = True
      Size = 9
    end
    object Q_ConsultaEST_FOR: TStringField
      FieldName = 'EST_FOR'
      Origin = 'EST_FOR'
      FixedChar = True
      Size = 2
    end
    object Q_ConsultaCNPJ_FOR: TStringField
      FieldName = 'CNPJ_FOR'
      Origin = 'CNPJ_FOR'
      Size = 18
    end
    object Q_ConsultaINSC_FOR: TStringField
      FieldName = 'INSC_FOR'
      Origin = 'INSC_FOR'
    end
    object Q_ConsultaTEL_FOR: TStringField
      FieldName = 'TEL_FOR'
      Origin = 'TEL_FOR'
      Size = 13
    end
    object Q_ConsultaFAX_FOR: TStringField
      FieldName = 'FAX_FOR'
      Origin = 'FAX_FOR'
      Size = 13
    end
    object Q_ConsultaCONTATO_FOR: TStringField
      FieldName = 'CONTATO_FOR'
      Origin = 'CONTATO_FOR'
      Size = 50
    end
    object Q_ConsultaNUM_FOR: TStringField
      FieldName = 'NUM_FOR'
      Origin = 'NUM_FOR'
      Size = 10
    end
    object Q_ConsultaCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
    object Q_ConsultaEMAIL_FOR: TStringField
      FieldName = 'EMAIL_FOR'
      Origin = 'EMAIL_FOR'
      Size = 100
    end
  end
end
