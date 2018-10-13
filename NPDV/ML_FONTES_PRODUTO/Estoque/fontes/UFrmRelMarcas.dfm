object FrmRelMarcas: TFrmRelMarcas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Estoque Master - Relat'#243'rio de Marcas'
  ClientHeight = 114
  ClientWidth = 334
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    ExplicitWidth = 332
    object Rdg: TRadioGroup
      Left = 2
      Top = 2
      Width = 330
      Height = 53
      Align = alClient
      Caption = 'Ordem de Impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
      ExplicitWidth = 328
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 334
    Height = 38
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    ExplicitWidth = 332
    ExplicitHeight = 36
    object BtnVis: TButton
      Left = 28
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TButton
      Left = 128
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TButton
      Left = 228
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 95
    Width = 334
    Height = 19
    Panels = <>
    ExplicitTop = 93
    ExplicitWidth = 332
  end
end
