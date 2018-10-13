object FrmConsOutrasSaidas: TFrmConsOutrasSaidas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Consulta de Outras Sa'#237'das'
  ClientHeight = 449
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 583
    Height = 113
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 169
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 153
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'CLIENTE'
          'DATA')
      end
    end
    object GB2: TGroupBox
      Left = 184
      Top = 8
      Width = 241
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 417
      Height = 49
      Caption = 'Consulta'
      TabOrder = 2
      object BtnConsCli: TSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Cliente'
        Flat = True
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
      object EdtNomeCli: TEdit
        Left = 97
        Top = 16
        Width = 311
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
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
        TabOrder = 0
      end
      object EdtCodCli: TEdit
        Left = 8
        Top = 16
        Width = 55
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = EdtCodCliChange
      end
      object EdtCod: TEdit
        Left = 8
        Top = 16
        Width = 401
        Height = 21
        Color = clSilver
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 474
      Top = 45
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 113
    Width = 583
    Height = 335
    Align = alTop
    Color = clSilver
    DataSource = DSQConsOS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = 16776176
        Expanded = False
        FieldName = 'COD_OUTRA'
        Title.Alignment = taCenter
        Title.Caption = 'COD.'
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'DATA_OUTRA'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Alignment = taCenter
        Title.Caption = 'CLIENTE'
        Width = 295
        Visible = True
      end
      item
        Color = 16776176
        Expanded = False
        FieldName = 'TOTAL_OUTRA'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL'
        Width = 78
        Visible = True
      end>
  end
  object QConsOS: TIBQuery
    Database = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  OS.*,'
      '  C.NOME_CLI'
      'FROM'
      '  OUTRAS_SAIDAS OS'
      '  INNER JOIN CLIENTE C ON (OS.COD_CLI = C.COD_CLI)')
    Left = 184
    Top = 288
    object QConsOSCOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."COD_OUTRA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsOSDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."DATA_OUTRA"'
      Required = True
    end
    object QConsOSCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Origin = '"OUTRAS_SAIDAS"."COD_TIPO"'
      Required = True
    end
    object QConsOSCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"OUTRAS_SAIDAS"."COD_CLI"'
      Required = True
    end
    object QConsOSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"OUTRAS_SAIDAS"."COD_EMP"'
      Required = True
    end
    object QConsOSTOTAL_OUTRA: TIBBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = '"OUTRAS_SAIDAS"."TOTAL_OUTRA"'
      DisplayFormat = ' ,0.00;- ,0.00'
      Precision = 18
      Size = 2
    end
    object QConsOSCANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = '"OUTRAS_SAIDAS"."CANCELADA"'
      Required = True
    end
    object QConsOSNOME_CLI: TIBStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
  end
  object DSQConsOS: TDataSource
    AutoEdit = False
    DataSet = QConsOS
    Left = 184
    Top = 344
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
    Left = 136
    Top = 104
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
end
