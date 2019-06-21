object FrrmLogin: TFrrmLogin
  Left = 479
  Top = 210
  BorderStyle = bsNone
  Caption = 'FrrmLogin'
  ClientHeight = 200
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 26
    Align = alTop
    BevelOuter = bvLowered
    Color = clActiveCaption
    TabOrder = 0
    object Label3: TLabel
      Left = 5
      Top = 1
      Width = 222
      Height = 23
      Caption = 'Estoque Master - Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 300
    Height = 148
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object Image1: TImage
      Left = 5
      Top = 6
      Width = 100
      Height = 100
      AutoSize = True
      Center = True
      Proportional = True
      Stretch = True
      Transparent = True
    end
    object Label1: TLabel
      Left = 124
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 124
      Top = 51
      Width = 37
      Height = 13
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edtusu: TEdit
      Left = 124
      Top = 27
      Width = 160
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      TabOrder = 0
      Text = 'VILA_RIO'
      OnKeyPress = EdtusuKeyPress
    end
    object Edtsenha: TEdit
      Left = 124
      Top = 67
      Width = 160
      Height = 21
      Color = clSilver
      PasswordChar = '*'
      TabOrder = 1
      Text = '123456'
      OnKeyPress = EdtsenhaKeyPress
    end
    object BtnOK1: TButton
      Left = 88
      Top = 112
      Width = 93
      Height = 27
      Caption = '&Entrar'
      TabOrder = 2
      OnClick = BtnOK1Click
    end
    object BtnCancelar1: TButton
      Left = 187
      Top = 112
      Width = 97
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = BtnCancelar1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 174
    Width = 300
    Height = 26
    Align = alBottom
    BevelOuter = bvLowered
    Color = clActiveCaption
    TabOrder = 2
    object Label4: TLabel
      Left = 265
      Top = 4
      Width = 29
      Height = 13
      Caption = 'v. 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Caixa: TFDQuery
    Connection = DmDados.Conexao
    Transaction = DmDados.IBTransaction1
    SQL.Strings = (
      'select * from CAIXA where cod_usu = :cod and data_abertura = :dt')
    Left = 48
    Top = 138
    ParamData = <
      item
        Name = 'cod'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'dt'
        DataType = ftDate
        ParamType = ptInput
      end>
    object CaixaCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = 'COD_CAIXA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CaixaCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
    end
    object CaixaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object CaixaHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = 'HORA_ABERTURA'
    end
    object CaixaVL_ABERTURA: TBCDField
      FieldName = 'VL_ABERTURA'
      Origin = 'VL_ABERTURA'
      Precision = 18
      Size = 2
    end
    object CaixaVL_FECHAMENTO: TBCDField
      FieldName = 'VL_FECHAMENTO'
      Origin = 'VL_FECHAMENTO'
      Precision = 18
      Size = 2
    end
    object CaixaVL_VENDAS: TBCDField
      FieldName = 'VL_VENDAS'
      Origin = 'VL_VENDAS'
      Precision = 18
      Size = 2
    end
    object CaixaRETIRADAS: TBCDField
      FieldName = 'RETIRADAS'
      Origin = 'RETIRADAS'
      Precision = 18
      Size = 2
    end
    object CaixaSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
      Size = 2
    end
    object CaixaDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'DATA_FECHAMENTO'
    end
    object CaixaHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = 'HORA_FECHAMENTO'
    end
    object CaixaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
  end
end
