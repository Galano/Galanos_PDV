object FrmControleCredito: TFrmControleCredito
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Controle de Credi'#225'rio'
  ClientHeight = 532
  ClientWidth = 580
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    ExplicitWidth = 730
    object Label21: TLabel
      Left = 8
      Top = 12
      Width = 56
      Height = 13
      Caption = 'Cod.Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BtnConsCli: TSpeedButton
      Left = 67
      Top = 25
      Width = 23
      Height = 22
      Hint = 'Consultar Cliente'
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
    object Label22: TLabel
      Left = 96
      Top = 11
      Width = 97
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object EdtNomecli: TEdit
      Left = 96
      Top = 25
      Width = 478
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
      TabOrder = 1
    end
    object EdtCodcLI: TEdit
      Left = 8
      Top = 26
      Width = 56
      Height = 21
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = EdtCodcLIChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 71
    Width = 566
    Height = 391
    Caption = 'Lista de Compras em aberto'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 13
      Top = 19
      Width = 540
      Height = 334
      DataSource = ds_crediario
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'Data Vend.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taRightJustify
          Title.Caption = 'Total R$'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Forma de Pgto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 231
          Visible = True
        end>
    end
  end
  object GroupBox1: TGroupBox
    Left = 427
    Top = 468
    Width = 145
    Height = 60
    Caption = 'Total em Aberto'
    TabOrder = 2
    object EdtTotal: TCurrencyEdit
      Left = 10
      Top = 14
      Width = 129
      Height = 36
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clRed
      DisplayFormat = ',#0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -26
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 468
    Width = 193
    Height = 60
    Caption = 'Baixar Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFCFCFCCFCFCFAFAFAF949494949494949494949494
      949494949494949494949494949494949494949494949494AEAEAECFCFCFFCFC
      FCFF00FFFF00FFFF00FFFF00FFFF00FFF5F5F5A4A7A45B965A429B403AA4363A
      A4363AA4363AA4363AA4363AA4363AA4363AA4363AA4363AA4363AA4363AA436
      419B3E5B965AA2A39FF5F5F5FF00FFFF00FFFF00FFFCFCFC98A3973E9D3D3BA6
      3A47B24552BE5152BE5152BE5152BE5152BE5152BE5152BE5152BE5152BE5152
      BE5152BE5152BE5147B2453BA63A409E3E879E89FCFCFCFF00FFFF00FFC2D6C7
      409F403BA73C4DB24E4BAB4B48A54948A54948A54948A54948A54948A54948A5
      4948A54948A54948A54948A54948A5494AAA4B4DB24E3BA73C409F40CECFC8FF
      00FFFF00FF619E643CA63F4BAB4E49A74C49A74C49A74C49A84C49A84C51BA55
      55C35857C95B59CC5C59CD5C59CD5C59CD5C57C95B55C45951BA554DB0504BAB
      4E3CA63F619E64FF00FFFF00FF44A14A42A3484AA85050B75655C25B57C95E56
      C75C56C65C57C95ED0F4D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      AAE2AD4FB4554AA85042A34844A14AFF00FFFF00FF3BA14449A9524BAB5352BD
      5BCFF2D2FFFFFFFFFFFF57CB61FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF4DB1554AAA5348A8513BA044FF00FFFF00FF389D44
      4BAC564CAD564FB65BFFFFFFFFFFFFFFFFFF52BE5FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF4CB0584CAE574CAE574DB1594EB3594EB3594CAD564BAC56389D44FF
      00FFFF00FF389B464DB05B4DB15C4DB15CFFFFFFFFFFFFFFFFFF4FB55DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50B85F4DB0
      5B4CAF5A389B46FF00FFFF00FF399D4A4DB35F4DB35F4DB35FFFFFFFFFFFFFFF
      FFFF4EB560FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF4FB6614DB35F4DB25F399D4AFF00FFFF00FF3AA04F4FB5634FB5644FB5
      64FFFFFFFFFFFFFFFFFF4FB764FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FB5644F
      B5644FB5644FB5644FB6644FB8654FB5644EB4633A9F4EFF00FFFF00FF3BA252
      50B86850B86850B868FFFFFFFFFFFFFFFFFF50B969FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52BE6B50B8684FB7673BA252FF
      00FFFF00FF3CA55751BA6C51BA6C51BA6CFFFFFFFFFFFFFFFFFF51BA6CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52BD6D51BA
      6C51B96B3CA457FF00FFFF00FF3DA85B52BD7052BD7052BD70CDEED7FFFFFFFF
      FFFF52BD70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52BD7052BD7052BD7052BD70
      52BD7052BF7152BD7051BC6F3DA75BFF00FFFF00FF3EAA5F53BF7453BF7453BF
      7453BF7453BF7453BF7453BF7453BF74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF55C47753BF7452BE733EA95FFF00FFFF00FF3FAC63
      54C17854C17854C17854C17854C17854C17854C17854C178F6FCF8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAE2BD54C17854C17854C1783FAB63FF
      00FFFF00FF40AF6754C47C54C47C54C47C54C47C54C47C54C47C54C47C54C47C
      F5FCF8FFFFFFFFFFFF54C47C54C47C54C47C54C47C54C47C54C47C54C47C54C4
      7C54C47C3FAE66FF00FFFF00FF41B16B54C68055C78155C68055C58055C58055
      C58055C58055C580FFFFFFFFFFFFFFFFFF55C58055C58055C58055C58055C580
      55C68055C68055C78154C68041B16BFF00FFFF00FF4FB2744DC17B57CA8457C9
      8456C88456C88356C88356C88356C883FFFFFFFFFFFFFFFFFF56C88356C88356
      C88356C88356C88456C88457CA8458CB854DC17B4EB476FF00FFFF00FF91D5AB
      45BB755AD08A58CD8857CB8757CA8657CA8657CA8657CA86CFF1DCFFFFFFACE6
      C457CA8657CA8657CA8657CA8657CB8758CC8759CF895AD08A45BB7590D4AAFF
      00FFFF00FFF8FDFA51C38147C17A5BD38E5AD18C5AD08B59CF8A59CF8A59CF8A
      59CF8A59CF8A59CF8A59CF8A59CF8A59CF8A5AD08B5AD18C5AD28D5CD58F47C2
      7B52C180F8FDFAFF00FFFF00FFFF00FFDEF3E757C88848C78053D08A5CD8925C
      D8925CD8925CD8925CD8925CD8925CD8925CD8925CD8925CD8925DD9935CD993
      53D18A48C78054C887E3F6EBFF00FFFF00FFFF00FFFF00FFFF00FFF8FDFA93DC
      B25ACF8E4CCE864ACC854ACC854ACC854ACC854ACC854ACC854ACC854ACC854A
      CC854ACD854CCE865DCD9093DBB1F8FDFAFF00FFFF00FFFF00FF}
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object ToggleSwitch1: TToggleSwitch
    Left = 21
    Top = 430
    Width = 139
    Height = 20
    Color = 14286847
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    StateCaptions.CaptionOn = 'Desmarcar Todos'
    StateCaptions.CaptionOff = 'Marcar Todos '
    TabOrder = 4
    OnClick = ToggleSwitch1Click
  end
  object ds_crediario: TDataSource
    DataSet = Q_crediario
    Left = 360
    Top = 240
  end
  object Q_crediario: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select '
      '    vendas.cod_vendas,'
      '    vendas.cod_vendedor,'
      '    vendas.cod_fpgto,'
      '    vendas.total,'
      '    vendas.data,'
      '    vendas.hora,'
      '    vendas.obs,'
      '    vendas.dias_receber,'
      '    vendas.estado,'
      '    vendas.dt_pagto,'
      '    vendas.cod_cliente,'
      '    formas_pagamento.descricao'
      'from formas_pagamento'
      
        '   inner join vendas on (formas_pagamento.codigo = vendas.cod_fp' +
        'gto)'
      'where '
      '   ('
      '      (cod_cliente = :cod)'
      '   and '
      '      (cod_fpgto = 4)'
      '   and '
      '      (estado is null )'
      '   )'
      'order by vendas.data')
    Left = 288
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object Q_crediarioTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"VENDAS"."TOTAL"'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object Q_crediarioCOD_VENDAS: TIntegerField
      FieldName = 'COD_VENDAS'
      Origin = '"VENDAS"."COD_VENDAS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_crediarioCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"VENDAS"."COD_VENDEDOR"'
      Required = True
    end
    object Q_crediarioCOD_FPGTO: TIntegerField
      FieldName = 'COD_FPGTO'
      Origin = '"VENDAS"."COD_FPGTO"'
      Required = True
    end
    object Q_crediarioDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS"."DATA"'
    end
    object Q_crediarioHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"VENDAS"."HORA"'
    end
    object Q_crediarioOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"VENDAS"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object Q_crediarioDIAS_RECEBER: TIntegerField
      FieldName = 'DIAS_RECEBER'
      Origin = '"VENDAS"."DIAS_RECEBER"'
    end
    object Q_crediarioESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"VENDAS"."ESTADO"'
      Size = 1
    end
    object Q_crediarioDT_PAGTO: TDateField
      FieldName = 'DT_PAGTO'
      Origin = '"VENDAS"."DT_PAGTO"'
    end
    object Q_crediarioCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"VENDAS"."COD_CLIENTE"'
      Required = True
    end
    object Q_crediarioDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"FORMAS_PAGAMENTO"."DESCRICAO"'
      Required = True
    end
  end
  object QCli: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  CLIENTE.COD_CLI,'
      '  CLIENTE.NOME_CLI'
      'FROM'
      '  CLIENTE'
      'WHERE'
      '  CLIENTE.COD_CLI = :cod')
    Left = 120
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object QCliCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCliNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
  end
  object Q_Total: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select '
      '    sum( vendas.total) total'
      'from vendas'
      'where '
      '   ('
      '      (cod_cliente = :cod)'
      '   and '
      '      (cod_fpgto = 4)'
      '   and '
      '      (estado is null )'
      '   )')
    Left = 472
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object Q_TotalTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = Q_Total
    ScopeMappings = <>
    Left = 280
    Top = 304
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 452
    Top = 13
    object LinkPropertyToFieldValue: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'TOTAL'
      Component = EdtTotal
      ComponentProperty = 'Value'
    end
  end
  object Q_Baixa: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'update vendas set'
      '    estado = '#39'P'#39','
      '    dt_pagto = :hj'
      'where '
      '   ('
      '      (cod_vendas = :cod)'
      '   )')
    Left = 88
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object Q_Limite: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select '
      '    cliente.cod_cli,'
      '    cliente.nome_cli,'
      '    cliente.limite_cli'
      'from cliente'
      'where '
      '   ('
      '      (cliente.cod_cli = :cod)'
      '   )')
    Left = 88
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        ParamType = ptUnknown
      end>
    object Q_LimiteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_LimiteNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object Q_LimiteLIMITE_CLI: TIBBCDField
      FieldName = 'LIMITE_CLI'
      Origin = '"CLIENTE"."LIMITE_CLI"'
      Precision = 18
      Size = 2
    end
  end
end
