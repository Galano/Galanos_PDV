object FrmSelecionaItensEtiqueta: TFrmSelecionaItensEtiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Selecine os itens a serem impressos'
  ClientHeight = 323
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 575
    Height = 273
    Align = alTop
    DataSource = DmDados.DS_Q_Produtos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    MultiSelect = True
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
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
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VAREJO'
        Title.Caption = 'Pre'#231'o R$'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_PROMOCAO'
        Title.Caption = 'Pre'#231'o Promo'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_BARRA_PRO'
        Width = 0
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 183
    Top = 279
    Width = 98
    Height = 36
    Caption = 'Gerar Etiquetas'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 279
    Width = 113
    Height = 36
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object DsCdsEtiquetas: TDataSource
    DataSet = cdsEtiquetas
    Left = 320
    Top = 168
  end
  object cdsEtiquetas: TRxMemoryData
    FieldDefs = <>
    Left = 248
    Top = 168
    object cdsEtiquetascodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsEtiquetasproduto: TStringField
      FieldName = 'produto'
      Size = 255
    end
    object cdsEtiquetascod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 14
    end
    object cdsEtiquetasvalor: TCurrencyField
      FieldName = 'valor'
    end
    object cdsEtiquetasvalor_promocao: TCurrencyField
      FieldName = 'valor_promocao'
    end
  end
end
