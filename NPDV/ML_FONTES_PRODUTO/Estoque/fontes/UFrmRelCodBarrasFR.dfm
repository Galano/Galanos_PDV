object FrmRelCodBarrasFR: TFrmRelCodBarrasFR
  Left = 0
  Top = 0
  Caption = 'FrmRelCodBarrasFR'
  ClientHeight = 485
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 2
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
      Height = 167
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      ColCount = 2
      object RLDBText1: TRLDBText
        Left = 16
        Top = 3
        Width = 323
        Height = 30
        AutoSize = False
        DataField = 'NOME_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe Print'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBBarcode1: TRLDBBarcode
        Left = 115
        Top = 38
        Width = 129
        Height = 105
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        DataField = 'CODIGO_BARRA_PRO'
        DataSource = DmDados.DS_Q_Produtos
      end
      object RLLabel1: TRLLabel
        Left = 10
        Top = 147
        Width = 76
        Height = 16
        Caption = 'C'#243'd. Barra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 92
        Top = 148
        Width = 142
        Height = 16
        DataField = 'CODIGO_BARRA_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 259
        Top = 148
        Width = 33
        Height = 16
        Caption = 'C'#243'd:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 298
        Top = 148
        Width = 49
        Height = 16
        DataField = 'COD_PRO'
        DataSource = DmDados.DS_Q_Produtos
        Text = ''
      end
    end
  end
end
