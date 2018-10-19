object FrmConsOutrasEntradas: TFrmConsOutrasEntradas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Gerente - Consulta Entradas'
  ClientHeight = 408
  ClientWidth = 685
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
    Width = 685
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
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'FORNECEDOR'
          'DATA')
      end
    end
    object GB2: TGroupBox
      Left = 184
      Top = 8
      Width = 305
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
      Width = 481
      Height = 49
      Caption = 'Fornecedor'
      TabOrder = 2
      object BtnConsFor: TSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Fornecedor'
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
        OnClick = BtnConsForClick
      end
      object EdtNomeFor: TEdit
        Left = 98
        Top = 16
        Width = 375
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
      object EdtCodFor: TEdit
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
        OnChange = EdtCodForChange
      end
      object EdtCod: TEdit
        Left = 8
        Top = 16
        Width = 465
        Height = 21
        Color = clSilver
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 514
      Top = 22
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 514
      Top = 62
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 685
    Height = 276
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 681
      Height = 272
      Align = alClient
      Color = clSilver
      DataSource = DSQConsOE
      TabOrder = 0
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
          FieldName = 'NUMERO_NOTA_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'NOTA FISCAL'
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
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 435
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 339
      Top = 342
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 685
    Height = 19
    Panels = <>
  end
  object DSQConsOE: TDataSource
    AutoEdit = False
    DataSet = QConsOE
    Left = 120
    Top = 176
  end
  object QFor: TFDQuery
    Connection = DmDados.Conexao
    SQL.Strings = (
      'SELECT '
      '  FORNECEDOR.COD_FOR,'
      '  FORNECEDOR.RAZAO_FOR'
      'FROM'
      '  FORNECEDOR'
      'WHERE'
      '  FORNECEDOR.COD_FOR = :cod')
    Left = 64
    Top = 176
    object QForCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QForRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
  end
  object QConsOE: TFDQuery
    Connection = DmDados.Conexao
    SQL.Strings = (
      'SELECT OE.*, F.RAZAO_FOR'
      'FROM ENTRADAS OE'
      'INNER JOIN FORNECEDOR F'
      'ON (OE.COD_FOR = F.COD_FOR)')
    Left = 17
    Top = 177
    object QConsOECOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'COD_OUTRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsOEDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'DATA_OUTRA'
      Required = True
    end
    object QConsOECOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      Required = True
    end
    object QConsOECOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QConsOETOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'TOTAL_OUTRA'
      Precision = 18
      Size = 2
    end
    object QConsOENUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      Required = True
    end
    object QConsOESERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QConsOECANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object QConsOEDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
      Origin = 'DATA_VENCTO'
    end
    object QConsOERAZAO_FOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
end
