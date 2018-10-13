object FrmRelCodBarras: TFrmRelCodBarras
  Left = 0
  Top = 0
  Caption = 'FrmRelCodBarras'
  ClientHeight = 530
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = -8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DmDados.DS_Q_Produtos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLDetailGrid1: TRLDetailGrid
      Left = 38
      Top = 38
      Width = 718
      Height = 163
      ColCount = 2
      object RLDraw1: TRLDraw
        Left = 10
        Top = 5
        Width = 339
        Height = 153
      end
      object RLDBText1: TRLDBText
        Left = 22
        Top = 10
        Width = 317
        Height = 37
        AutoSize = False
        DataField = 'NOME_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe Print'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 22
        Top = 137
        Width = 76
        Height = 16
        Caption = 'C'#243'd. Barra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 103
        Top = 137
        Width = 142
        Height = 16
        DataField = 'CODIGO_BARRA_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 285
        Top = 137
        Width = 33
        Height = 16
        Caption = 'C'#243'd:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBBarcode1: TRLDBBarcode
        Left = 45
        Top = 49
        Width = 268
        Height = 65
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Align = faCenter
        BarcodeType = bcCode39Extended
        DataField = 'CODIGO_BARRA_PRO'
        DataSource = DmDados.DS_Q_Produtos
      end
      object RLDBText3: TRLDBText
        Left = 321
        Top = 137
        Width = 67
        Height = 16
        DataField = 'COD_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
end
