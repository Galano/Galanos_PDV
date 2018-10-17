object FrmRelVendas: TFrmRelVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estoque Master - Relat'#243'rio de Vendas'
  ClientHeight = 527
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 483
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnConsCli: TSpeedButton
      Left = 69
      Top = 144
      Width = 23
      Height = 21
      Hint = 'Consultar Fornecedor'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
        B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
        EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
        FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
        B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
        FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
        E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
        A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
        FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
        C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
        FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
        A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsCliClick
    end
    object Label2: TLabel
      Left = 9
      Top = 128
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 163
      Top = 103
      Width = 51
      Height = 13
      Caption = 'Abertura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 235
      Top = 103
      Width = 41
      Height = 13
      Caption = 'Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 364
      Top = 103
      Width = 51
      Height = 13
      Caption = 'Em Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object CheckCli: TCheckBox
      Left = 9
      Top = 168
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Clientes'
      TabOrder = 2
      OnClick = CheckCliClick
    end
    object GB2: TGroupBox
      Left = 9
      Top = 5
      Width = 415
      Height = 45
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 200
        Top = 22
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object lbCodFP: TLabel
        Left = 360
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
        Visible = False
      end
      object EdtDataIni: TDateTimePicker
        Left = 56
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 248
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object EdtNomeCli: TEdit
      Left = 99
      Top = 144
      Width = 324
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object GBTipoVenda: TGroupBox
      Left = 8
      Top = 56
      Width = 415
      Height = 45
      Caption = 'Tipo de Venda'
      TabOrder = 1
      object ComboTipoVenda: TComboBox
        Left = 8
        Top = 16
        Width = 399
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
    object CheckTipoVenda: TCheckBox
      Left = 8
      Top = 107
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Tipos de Venda'
      TabOrder = 4
      OnClick = CheckTipoVendaClick
    end
    object EdtCodCli: TEdit
      Left = 9
      Top = 144
      Width = 55
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 163
      Top = 117
      Width = 66
      Height = 21
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 235
      Top = 117
      Width = 87
      Height = 21
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = False
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 328
      Top = 117
      Width = 89
      Height = 21
      Color = 4194432
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 431
    Height = 44
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 27
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 334
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object Button1: TButton
      Left = 113
      Top = 10
      Width = 75
      Height = 25
      Caption = 'I&mprimir'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 203
      Top = 10
      Width = 125
      Height = 25
      Caption = 'Quantidade vendida'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 191
    Width = 415
    Height = 286
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Vendas'
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 405
        Height = 252
        DataSource = DataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_VENDAS'
            Title.Caption = 'C'#243'd'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLI'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total (R$)'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Itens da Venda'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 3
        Top = 3
        Width = 401
        Height = 252
        DataSource = Dts_Itens_Vendas
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_ITEM'
            Title.Caption = 'C'#243'd'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRO'
            Title.Caption = 'Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ITEM'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total do Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end>
      end
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DmDados.tb_fpagamentos
    ScopeMappings = <>
    Left = 152
    Top = 224
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 76
    Top = 221
    object LinkFillControlToPropertyCaption: TLinkFillControlToProperty
      Category = 'Quick Bindings'
      Track = True
      Control = ComboTipoVenda
      Component = lbCodFP
      ComponentProperty = 'Caption'
      FillDataSource = BindSourceDB1
      FillValueFieldName = 'CODIGO'
      FillDisplayFieldName = 'DESCRICAO'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
  end
  object DataSource1: TDataSource
    DataSet = DmDados.QRelVendas
    Left = 56
    Top = 320
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 264
    object ExcluirVenda1: TMenuItem
      Caption = 'Excluir Venda'
      OnClick = ExcluirVenda1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2VIADECUPOM1: TMenuItem
      Caption = '2'#170' Via de Cupom'
      OnClick = N2VIADECUPOM1Click
    end
  end
  object Q_Itens_Venda: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '  ITENS_VENDA.COD_ITEM,'
      '  ITENS_VENDA.COD_VENDA,'
      '  ITENS_VENDA.COD_PRO,'
      '  ITENS_VENDA.ORDEM,'
      '  ITENS_VENDA.QUANT_ITEM,'
      '  ITENS_VENDA.VALOR_ITEM,'
      '  PRODUTO.NOME_PRO,'
      '  PRODUTO.preco_varejo,'
      '  PRODUTO.preco_promocao'
      'FROM'
      '  PRODUTO'
      
        '  INNER JOIN ITENS_VENDA ON (PRODUTO.COD_PRO = ITENS_VENDA.COD_P' +
        'RO)'
      'WHERE'
      '  ITENS_VENDA.COD_VENDA = :cod'
      'ORDER BY ITENS_VENDA.ORDEM ASC ')
    Left = 288
    Top = 272
    ParamData = <
      item
        Name = 'cod'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object Q_Itens_VendaCOD_ITEM: TIntegerField
      FieldName = 'COD_ITEM'
      Origin = 'COD_ITEM'
      Required = True
    end
    object Q_Itens_VendaCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'COD_VENDA'
      Required = True
    end
    object Q_Itens_VendaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Itens_VendaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      Required = True
    end
    object Q_Itens_VendaQUANT_ITEM: TBCDField
      FieldName = 'QUANT_ITEM'
      Origin = 'QUANT_ITEM'
      Precision = 18
      Size = 3
    end
    object Q_Itens_VendaVALOR_ITEM: TBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object Q_Itens_VendaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object Q_Itens_VendaPRECO_VAREJO: TBCDField
      FieldName = 'PRECO_VAREJO'
      Origin = 'PRECO_VAREJO'
      Precision = 18
      Size = 2
    end
    object Q_Itens_VendaPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Precision = 18
    end
  end
  object Dts_Itens_Vendas: TDataSource
    DataSet = Q_Itens_Venda
    Left = 280
    Top = 336
  end
  object QPesqEstoque: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'SELECT'
      ' PRODUTO.COD_PRO, '
      '  PRODUTO.NOME_PRO,'
      '  PRODUTO.QUANT_ESTOQ'
      'FROM'
      '  PRODUTO'
      'WHERE'
      '  PRODUTO.COD_PRO = :cod')
    Left = 128
    Top = 328
    ParamData = <
      item
        Name = 'cod'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QPesqEstoqueCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPesqEstoqueNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QPesqEstoqueQUANT_ESTOQ: TBCDField
      FieldName = 'QUANT_ESTOQ'
      Origin = 'QUANT_ESTOQ'
      Precision = 18
      Size = 3
    end
  end
  object Q_ESTOQUE: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'UPDATE'
      '  PRODUTO'
      'SET'
      '  QUANT_ESTOQ = :QTD'
      'WHERE'
      '  PRODUTO.COD_PRO = :COD')
    Left = 128
    Top = 280
    ParamData = <
      item
        Name = 'QTD'
        DataType = ftBCD
        Precision = 18
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object PopupMenu2: TPopupMenu
    Left = 208
    Top = 320
    object Excluirprodutodavenda1: TMenuItem
      Caption = 'Excluir produto da venda'
      OnClick = Excluirprodutodavenda1Click
    end
  end
  object Q_Caixa_Aberto: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'select *  from CAIXA where DATA_ABERTURA = :dt')
    Left = 136
    Top = 400
    ParamData = <
      item
        Name = 'dt'
        DataType = ftDate
        ParamType = ptInput
      end>
    object Q_Caixa_AbertoCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = 'COD_CAIXA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Caixa_AbertoCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
    end
    object Q_Caixa_AbertoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object Q_Caixa_AbertoHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = 'HORA_ABERTURA'
    end
    object Q_Caixa_AbertoVL_ABERTURA: TBCDField
      FieldName = 'VL_ABERTURA'
      Origin = 'VL_ABERTURA'
      Precision = 18
      Size = 2
    end
    object Q_Caixa_AbertoVL_FECHAMENTO: TBCDField
      FieldName = 'VL_FECHAMENTO'
      Origin = 'VL_FECHAMENTO'
      Precision = 18
      Size = 2
    end
    object Q_Caixa_AbertoVL_VENDAS: TBCDField
      FieldName = 'VL_VENDAS'
      Origin = 'VL_VENDAS'
      Precision = 18
      Size = 2
    end
    object Q_Caixa_AbertoRETIRADAS: TBCDField
      FieldName = 'RETIRADAS'
      Origin = 'RETIRADAS'
      Precision = 18
      Size = 2
    end
    object Q_Caixa_AbertoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
      Size = 2
    end
    object Q_Caixa_AbertoDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'DATA_FECHAMENTO'
    end
    object Q_Caixa_AbertoHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = 'HORA_FECHAMENTO'
    end
    object Q_Caixa_AbertoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
  end
  object Q_Total_Vendas: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'SELECT'
      '  SUM(VENDAS.TOTAL)'
      'FROM'
      '  CLIENTE'
      '  INNER JOIN VENDAS ON (CLIENTE.COD_CLI = VENDAS.COD_CLIENTE)'
      
        '  INNER JOIN FORMAS_PAGAMENTO ON (VENDAS.COD_FPGTO = FORMAS_PAGA' +
        'MENTO.CODIGO)'
      'where vendas.data between :dt and :dt2')
    Left = 232
    Top = 400
    ParamData = <
      item
        Name = 'dt'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'dt2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object Q_Total_VendasSUM: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SUM'
      Origin = '"SUM"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object Q_Qtd_vendida: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'select '
      '    itens_venda.cod_pro,'
      '    vendas.data,'
      '    Sum(itens_venda.quant_item) as total_vendido,'
      '    produto.nome_pro'
      'from vendas'
      
        '   inner join itens_venda on (vendas.cod_vendas = itens_venda.co' +
        'd_venda)'
      '   inner join produto on (itens_venda.cod_pro = produto.cod_pro)'
      'where '
      '   ('
      '    (vendas.data between :dt1 and :dt2)'
      '   )'
      'group by itens_venda.cod_pro,'
      '         vendas.data,'
      '         produto.nome_pro'
      'order by produto.nome_pro')
    Left = 336
    Top = 392
    ParamData = <
      item
        Name = 'dt1'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'dt2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object Q_Qtd_vendidaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      Required = True
    end
    object Q_Qtd_vendidaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object Q_Qtd_vendidaTOTAL_VENDIDO: TBCDField
      FieldName = 'TOTAL_VENDIDO'
      Origin = 'TOTAL_VENDIDO'
      Precision = 18
      Size = 3
    end
    object Q_Qtd_vendidaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
  end
end
