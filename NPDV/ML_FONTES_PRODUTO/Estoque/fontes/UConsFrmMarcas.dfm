object FrmConsMarcas: TFrmConsMarcas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Consulta de Marcas'
  ClientHeight = 468
  ClientWidth = 457
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
    Top = 65
    Width = 457
    Height = 56
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object LTipo: TLabel
      Left = 8
      Top = 8
      Width = 25
      Height = 13
      Caption = 'LTipo'
    end
    object EdtCons: TEdit
      Left = 8
      Top = 24
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      TabOrder = 0
    end
    object BtnOK: TBitBtn
      Left = 365
      Top = 21
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 457
    Height = 328
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 453
      Height = 287
      Align = alTop
      Color = clSilver
      DataSource = DSConsulta
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
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 80
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 347
          Visible = True
        end>
    end
    object BtnSair: TBitBtn
      Left = 191
      Top = 295
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 449
    Width = 457
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 453
      Height = 13
      Align = alTop
      Caption = 'Consultar Por'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 77
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 453
      Height = 48
      Align = alClient
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = 'Nome'
        Items.Strings = (
          'Palavra Chave'
          'Nome'
          'C'#243'digo')
      end
    end
  end
  object Q_Consulta: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM MARCAS')
    Left = 312
    Top = 200
    object Q_ConsultaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MARCAS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ConsultaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"MARCAS"."DESCRICAO"'
      Required = True
      Size = 70
    end
  end
  object DSConsulta: TDataSource
    DataSet = Q_Consulta
    Left = 384
    Top = 201
  end
end
