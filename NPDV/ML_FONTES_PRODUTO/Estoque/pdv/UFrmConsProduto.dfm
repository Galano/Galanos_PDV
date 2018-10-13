object FrmConsProduto: TFrmConsProduto
  Left = 249
  Top = 107
  BorderStyle = bsToolWindow
  Caption = 'Estoque Master - Consulta de Produtos'
  ClientHeight = 456
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 97
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GB2: TGroupBox
      Left = 8
      Top = 8
      Width = 545
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object BtnCons: TSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object EdtCons: TEdit
        Left = 8
        Top = 16
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = EdtConsChange
        OnKeyDown = EdtConsKeyDown
      end
    end
    object RdgAtivo: TRadioGroup
      Left = 183
      Top = 58
      Width = 370
      Height = 33
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ativos'
        'Destivados'
        'Todos')
      TabOrder = 1
    end
    object RdOrdem: TRadioGroup
      Left = 8
      Top = 58
      Width = 169
      Height = 33
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Crescente'
        'Decrescente')
      TabOrder = 2
    end
    object BtnOk: TButton
      Left = 565
      Top = 41
      Width = 71
      Height = 25
      Caption = 'OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 650
    Height = 359
    Align = alClient
    Color = clSilver
    DataSource = DSProd
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Color = 16776176
        Expanded = False
        FieldName = 'COD_PRO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'D.'
        Width = 57
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'CODIGO_BARRA_PRO'
        Title.Alignment = taCenter
        Title.Caption = 'COD.BARRA'
        Width = 96
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'QUANT_ESTOQ'
        Title.Alignment = taCenter
        Width = 67
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'DATA_VALIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'DATA VALIDADE'
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'NOME_PRO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 338
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'PRECO_VAREJO'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Width = 68
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'PRECO_PROMOCAO'
        Title.Alignment = taCenter
        Title.Caption = 'PROMO'#199#195'O'
        Width = 70
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'PRECO_PRAZO'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR A PRAZO'
        Width = 90
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'NOME_SEC'
        Title.Alignment = taCenter
        Title.Caption = 'SE'#199#195'O'
        Width = 208
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'GRUPO'
        Width = 201
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'DESCRICAO1'
        Title.Alignment = taCenter
        Title.Caption = 'SUB-GRUPO'
        Width = 224
        Visible = True
      end>
  end
  object DSProd: TDataSource
    AutoEdit = False
    DataSet = QProd
    Left = 216
    Top = 216
  end
  object QProd: TFDQuery
    Connection = DmDados.conexao
    SQL.Strings = (
      'SELECT '
      '  P.*,'
      '  S.NOME_SEC,'
      '  SG.DESCRICAO,'
      '  SGS.DESCRICAO,'
      '  UE.DESCRICAO AS UND_ENTRADA,'
      '  US.DESCRICAO AS UND_SAIDA,'
      '  MARCAS.DESCRICAO '
      'FROM '
      '  PRODUTO P '
      '  INNER JOIN SECAO S ON (P.COD_SEC = S.COD_SEC)'
      '  INNER JOIN UNIDADE_MEDIDA UE ON (P.COD_UNI_ENT = UE.CODIGO)'
      '  INNER JOIN UNIDADE_MEDIDA US ON (P.COD_UNI_SAI = US.CODIGO)'
      '  LEFT OUTER JOIN SECAO_GRUPO SG ON (P.COD_SEC = SG.COD_SEC)'
      '  AND (P.COD_GRUP = SG.COD_GRUPO)'
      
        '  LEFT OUTER JOIN SECAO_GRUPO_SUBGRUPO SGS ON (P.COD_SEC = SGS.C' +
        'OD_SEC)'
      '  AND (P.COD_GRUP = SGS.COD_GRUPO)'
      '  AND (P.COD_SGRUP = SGS.COD_SUBGRUPO)'
      '  INNER JOIN MARCAS ON (P.COD_MARC = MARCAS.CODIGO)')
    Left = 448
    Top = 208
    object QProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QProdTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'TP_PRODUTO'
      Required = True
      Size = 80
    end
    object QProdTP_PRODUCAO: TStringField
      FieldName = 'TP_PRODUCAO'
      Origin = 'TP_PRODUCAO'
      Size = 80
    end
    object QProdESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 3
    end
    object QProdNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QProdDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QProdCOD_MARC: TIntegerField
      FieldName = 'COD_MARC'
      Origin = 'COD_MARC'
      Required = True
    end
    object QProdCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      Required = True
    end
    object QProdCOD_GRUP: TIntegerField
      FieldName = 'COD_GRUP'
      Origin = 'COD_GRUP'
      Required = True
    end
    object QProdCOD_SGRUP: TIntegerField
      FieldName = 'COD_SGRUP'
      Origin = 'COD_SGRUP'
      Required = True
    end
    object QProdCOD_UNI_ENT: TIntegerField
      FieldName = 'COD_UNI_ENT'
      Origin = 'COD_UNI_ENT'
      Required = True
    end
    object QProdCOD_UNI_SAI: TIntegerField
      FieldName = 'COD_UNI_SAI'
      Origin = 'COD_UNI_SAI'
      Required = True
    end
    object QProdPRECO_VAREJO: TBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object QProdPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Precision = 18
    end
    object QProdPRECO_PRAZO: TBCDField
      FieldName = 'PRECO_PRAZO'
      Origin = 'PRECO_PRAZO'
      Precision = 18
    end
    object QProdMARGEM_LUCRO: TBCDField
      FieldName = 'MARGEM_LUCRO'
      Origin = 'MARGEM_LUCRO'
      Precision = 18
    end
    object QProdQUANT_ESTOQ: TBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
    object QProdDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
    end
    object QProdDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = 'DIAS_VALIDADE_PRO'
    end
    object QProdCONTROLA_ESTOQUE_PRO: TStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = 'CONTROLA_ESTOQUE_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdCAMINHO_FOTO_PRO: TBlobField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = 'CAMINHO_FOTO_PRO'
    end
    object QProdNOME_SEC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QProdDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QProdDESCRICAO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_1'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QProdUND_ENTRADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UND_ENTRADA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QProdUND_SAIDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UND_SAIDA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QProdDESCRICAO_2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_2'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
  end
end
