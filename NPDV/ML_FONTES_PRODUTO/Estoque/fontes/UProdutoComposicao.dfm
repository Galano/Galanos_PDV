object FrmProdutosComposicao: TFrmProdutosComposicao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Composi'#231#227'o de Produto e Valores'
  ClientHeight = 369
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 369
    Align = alClient
    Color = 16710131
    TabOrder = 0
    ExplicitHeight = 322
    object Bevel1: TBevel
      Left = 8
      Top = 317
      Width = 489
      Height = 50
    end
    object Label1: TLabel
      Left = 8
      Top = 43
      Width = 61
      Height = 13
      Caption = 'Cod.Produto'
    end
    object BtnConsProd: TSpeedButton
      Left = 61
      Top = 59
      Width = 23
      Height = 21
      Hint = 'Consultar Produto'
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
      OnClick = BtnConsProdClick
    end
    object Label2: TLabel
      Left = 112
      Top = 43
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
    end
    object Label12: TLabel
      Left = 424
      Top = 43
      Width = 34
      Height = 13
      Caption = 'Quant.'
    end
    object BtnAddPro: TSpeedButton
      Left = 85
      Top = 59
      Width = 25
      Height = 21
      Hint = 'Cadastrar Produto'
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        700077777777777770007777700077777000777770C077777000777770C07777
        7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
        7000777770C07777700077777000777770007777777777777000777777777777
        7000}
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object LabelUnd: TLabel
      Left = 496
      Top = 62
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'LabelUnd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 20
      Top = 326
      Width = 201
      Height = 35
      Caption = 'Pre'#231'o de Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 227
      Top = 321
      Width = 134
      Height = 42
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -35
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNomePro: TEdit
      Left = 112
      Top = 59
      Width = 305
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdtQuant: TCurrencyEdit
      Left = 424
      Top = 59
      Width = 65
      Height = 21
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DecimalPlaces = 3
      DisplayFormat = ',#0.000'
      FormatOnEditing = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 91
      Width = 489
      Height = 225
      TabStop = False
      Color = clSilver
      DataSource = DSProd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PROD.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 306
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 56
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'UND'
          Visible = True
        end>
    end
    object BtnGrava: TButton
      Left = 503
      Top = 92
      Width = 65
      Height = 25
      Caption = '&Gravar'
      TabOrder = 2
      OnClick = BtnGravaClick
    end
    object BtnExclui: TButton
      Left = 504
      Top = 123
      Width = 65
      Height = 25
      Caption = '&Excluir'
      TabOrder = 6
      OnClick = BtnExcluiClick
    end
    object Button1: TButton
      Left = 504
      Top = 171
      Width = 65
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = Button1Click
      OnExit = Button1Exit
    end
    object Edit1: TEdit
      Left = 8
      Top = 59
      Width = 55
      Height = 21
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
    end
    object spCodProdComp: TSpinEdit
      Left = 503
      Top = 202
      Width = 65
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
      Visible = False
    end
    object pnlProduto: TPanel
      Left = 1
      Top = 1
      Width = 574
      Height = 36
      Align = alTop
      Caption = '...'
      Color = 6838839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
      ExplicitLeft = 0
    end
  end
  object QProd: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  PRODUTO_COMPOSICAO.COD_PRO_COMPOSICAO,'
      '  PRODUTO_COMPOSICAO.COD_PRO,'
      '  PRODUTO.NOME_PRO,'
      '  PRODUTO_COMPOSICAO.QUANT,'
      '  UNIDADE_MEDIDA.DESCRICAO,'
      '  PRODUTO.PRECO_PRAZO'
      'FROM'
      '  PRODUTO_COMPOSICAO'
      
        '  INNER JOIN PRODUTO ON (PRODUTO_COMPOSICAO.COD_PRO = PRODUTO.CO' +
        'D_PRO)'
      
        '  INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_ME' +
        'DIDA.CODIGO)'
      'WHERE'
      '  PRODUTO_COMPOSICAO.COD_PRO_COMPOSICAO = :CODPRO')
    Left = 440
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPRO'
        ParamType = ptUnknown
      end>
    object QProdCOD_PRO_COMPOSICAO: TIntegerField
      FieldName = 'COD_PRO_COMPOSICAO'
      Origin = '"PRODUTO_COMPOSICAO"."COD_PRO_COMPOSICAO"'
      Required = True
    end
    object QProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO_COMPOSICAO"."COD_PRO"'
      Required = True
    end
    object QProdNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QProdQUANT: TIBBCDField
      FieldName = 'QUANT'
      Origin = '"PRODUTO_COMPOSICAO"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QProdDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QProdPRECO_PRAZO: TIBBCDField
      FieldName = 'PRECO_PRAZO'
      Origin = '"PRODUTO"."PRECO_PRAZO"'
      Precision = 18
      Size = 4
    end
  end
  object DSProd: TDataSource
    AutoEdit = False
    DataSet = QProd
    Left = 440
    Top = 192
  end
  object Q_Consulta_filtro: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM'
      '  PRODUTO'
      'WHERE'
      '  COD_PRO = :cod')
    Left = 104
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object Q_Consulta_filtroCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Consulta_filtroCODIGO_BARRA_PRO: TIBStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Q_Consulta_filtroTP_PRODUTO: TIBStringField
      FieldName = 'TP_PRODUTO'
      Origin = '"PRODUTO"."TP_PRODUTO"'
      Required = True
      Size = 80
    end
    object Q_Consulta_filtroTP_PRODUCAO: TIBStringField
      FieldName = 'TP_PRODUCAO'
      Origin = '"PRODUTO"."TP_PRODUCAO"'
      Size = 80
    end
    object Q_Consulta_filtroESTOQUE_MINIMO: TIBBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = '"PRODUTO"."ESTOQUE_MINIMO"'
      Precision = 18
      Size = 3
    end
    object Q_Consulta_filtroNOME_PRO: TIBStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q_Consulta_filtroDESC_CUPOM: TIBStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object Q_Consulta_filtroCOD_MARC: TIntegerField
      FieldName = 'COD_MARC'
      Origin = '"PRODUTO"."COD_MARC"'
      Required = True
    end
    object Q_Consulta_filtroCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"PRODUTO"."COD_SEC"'
      Required = True
    end
    object Q_Consulta_filtroCOD_GRUP: TIntegerField
      FieldName = 'COD_GRUP'
      Origin = '"PRODUTO"."COD_GRUP"'
      Required = True
    end
    object Q_Consulta_filtroCOD_SGRUP: TIntegerField
      FieldName = 'COD_SGRUP'
      Origin = '"PRODUTO"."COD_SGRUP"'
      Required = True
    end
    object Q_Consulta_filtroCOD_UNI_ENT: TIntegerField
      FieldName = 'COD_UNI_ENT'
      Origin = '"PRODUTO"."COD_UNI_ENT"'
      Required = True
    end
    object Q_Consulta_filtroCOD_UNI_SAI: TIntegerField
      FieldName = 'COD_UNI_SAI'
      Origin = '"PRODUTO"."COD_UNI_SAI"'
      Required = True
    end
    object Q_Consulta_filtroPRECO_VAREJO: TIBBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = '"PRODUTO"."PRECO_VAREJO"'
      Precision = 18
      Size = 2
    end
    object Q_Consulta_filtroPRECO_PROMOCAO: TIBBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = '"PRODUTO"."PRECO_PROMOCAO"'
      Precision = 18
      Size = 4
    end
    object Q_Consulta_filtroPRECO_PRAZO: TIBBCDField
      FieldName = 'PRECO_PRAZO'
      Origin = '"PRODUTO"."PRECO_PRAZO"'
      Precision = 18
      Size = 4
    end
    object Q_Consulta_filtroMARGEM_LUCRO: TIBBCDField
      FieldName = 'MARGEM_LUCRO'
      Origin = '"PRODUTO"."MARGEM_LUCRO"'
      Precision = 18
      Size = 4
    end
    object Q_Consulta_filtroQUANT_ESTOQ: TIBBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = '"PRODUTO"."QUANT_ESTOQ"'
      Precision = 18
      Size = 3
    end
    object Q_Consulta_filtroDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = '"PRODUTO"."DATA_VALIDADE"'
    end
    object Q_Consulta_filtroDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = '"PRODUTO"."DIAS_VALIDADE_PRO"'
    end
    object Q_Consulta_filtroCONTROLA_ESTOQUE_PRO: TIBStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = '"PRODUTO"."CONTROLA_ESTOQUE_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q_Consulta_filtroATIVO_PRO: TIBStringField
      FieldName = 'ATIVO_PRO'
      Origin = '"PRODUTO"."ATIVO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q_Consulta_filtroCAMINHO_FOTO_PRO: TBlobField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = '"PRODUTO"."CAMINHO_FOTO_PRO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object QPrecoCusto: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  SUM(PRECO_PRAZO) AS PRECO_CUSTO'
      'FROM'
      '  PRODUTO_COMPOSICAO'
      
        '  INNER JOIN PRODUTO ON (PRODUTO_COMPOSICAO.COD_PRO = PRODUTO.CO' +
        'D_PRO)'
      
        '  INNER JOIN UNIDADE_MEDIDA ON (PRODUTO.COD_UNI_SAI = UNIDADE_ME' +
        'DIDA.CODIGO)'
      'WHERE'
      '  PRODUTO_COMPOSICAO.COD_PRO_COMPOSICAO = :CODPRO')
    Left = 112
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODPRO'
        ParamType = ptUnknown
      end>
    object QPrecoCustoPRECO_CUSTO: TIBBCDField
      FieldName = 'PRECO_CUSTO'
      ProviderFlags = []
      DisplayFormat = ',R$ #0.00'
      Precision = 18
      Size = 4
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = QPrecoCusto
    ScopeMappings = <>
    Left = 280
    Top = 160
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 196
    Top = 173
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'PRECO_CUSTO'
      Component = Label3
      ComponentProperty = 'Caption'
    end
  end
end
