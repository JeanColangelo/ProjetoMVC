object FrVenda: TFrVenda
  Left = 0
  Top = 0
  Caption = 'Venda'
  ClientHeight = 418
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 650
    Height = 418
    ActivePage = TsVenda
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 698
    object TsVenda: TTabSheet
      Caption = 'Venda'
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 105
      ExplicitHeight = 92
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 642
        Height = 65
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
        ExplicitWidth = 690
        object GroupBox2: TGroupBox
          Left = 16
          Top = 0
          Width = 542
          Height = 59
          Caption = 'Dados da Venda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Cliente: TLabel
            Left = 19
            Top = 31
            Width = 42
            Height = 15
            Caption = 'Cliente:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ComboCliente: TDBLookupComboBox
            Left = 67
            Top = 23
            Width = 462
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'Codigo'
            ListField = 'Nome'
            ListSource = FrDmConexao.DsCliente
            ParentFont = False
            TabOrder = 0
            OnKeyPress = ComboClienteKeyPress
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 65
        Width = 642
        Height = 96
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 690
        object GroupBox1: TGroupBox
          Left = 16
          Top = 6
          Width = 617
          Height = 75
          Caption = 'Dados do Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 11
            Top = 24
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label5: TLabel
            Left = 87
            Top = 24
            Width = 33
            Height = 15
            Caption = 'Nome'
          end
          object Label6: TLabel
            Left = 407
            Top = 24
            Width = 65
            Height = 15
            Caption = 'Quantidade'
          end
          object Label7: TLabel
            Left = 488
            Top = 24
            Width = 29
            Height = 15
            Caption = 'Valor'
          end
          object EdCodProd: TEdit
            Left = 11
            Top = 40
            Width = 62
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = EdCodProdExit
            OnKeyPress = ComboClienteKeyPress
          end
          object ComboProduto: TDBLookupComboBox
            Left = 87
            Top = 40
            Width = 314
            Height = 23
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'Codigo'
            ListField = 'Descricao'
            ListSource = FrDmConexao.DsProduto
            ParentFont = False
            TabOrder = 1
            OnKeyPress = ComboClienteKeyPress
          end
          object EdValor: TEdit
            Left = 488
            Top = 40
            Width = 62
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnKeyPress = ComboClienteKeyPress
          end
          object EdQuantidade: TEdit
            Left = 407
            Top = 40
            Width = 67
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnKeyPress = ComboClienteKeyPress
          end
          object BtInserirItem: TButton
            Left = 571
            Top = 39
            Width = 38
            Height = 25
            Caption = '+'
            TabOrder = 4
            OnClick = BtInserirItemClick
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 161
        Width = 642
        Height = 173
        Align = alClient
        DataSource = DsItens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CodProduto'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Alignment = taCenter
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taCenter
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Title.Alignment = taCenter
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Title.Alignment = taCenter
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end>
      end
      object PnlEditar: TPanel
        Left = 232
        Top = 184
        Width = 185
        Height = 113
        TabOrder = 3
        Visible = False
        object Label1: TLabel
          Left = 40
          Top = 51
          Width = 29
          Height = 15
          Caption = 'Valor'
          FocusControl = DBEdit1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 18
          Top = 24
          Width = 65
          Height = 15
          Caption = 'Quantidade'
          FocusControl = DBEdit2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 104
          Top = 43
          Width = 73
          Height = 23
          DataField = 'Valor'
          DataSource = DsItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = ComboClienteKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 104
          Top = 16
          Width = 73
          Height = 23
          DataField = 'Quantidade'
          DataSource = DsItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = ComboClienteKeyPress
        end
        object BtGravarEdicao: TButton
          Left = 35
          Top = 78
          Width = 110
          Height = 25
          Caption = 'Gravar Edi'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtGravarEdicaoClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 334
        Width = 642
        Height = 56
        Align = alBottom
        TabOrder = 4
        ExplicitTop = 296
        ExplicitWidth = 733
        object LblTotal: TLabel
          Left = 27
          Top = 16
          Width = 5
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtGravarPedido: TButton
          Left = 496
          Top = 15
          Width = 129
          Height = 34
          Caption = '(F8) Gravar Pedido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BtGravarPedidoClick
        end
      end
    end
    object tsPesqVenda: TTabSheet
      Caption = 'Pesquisar'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 642
        Height = 65
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 690
        object GroupBox3: TGroupBox
          Left = 8
          Top = 0
          Width = 593
          Height = 55
          Caption = 'Pesquisar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label3: TLabel
            Left = 16
            Top = 24
            Width = 76
            Height = 14
            Caption = 'C'#243'digo Venda'
          end
          object EdPesqCodVenda: TEdit
            Left = 98
            Top = 23
            Width = 95
            Height = 22
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object BtPesqCodVenda: TButton
            Left = 208
            Top = 23
            Width = 89
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 1
            OnClick = BtPesqCodVendaClick
          end
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 193
        Width = 642
        Height = 135
        Align = alClient
        DataSource = FrDmVenda.DsConsultaItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 65
        Width = 642
        Height = 128
        Align = alTop
        DataSource = FrDmVenda.DsConsulta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel5: TPanel
        Left = 0
        Top = 328
        Width = 642
        Height = 62
        Align = alBottom
        TabOrder = 3
        ExplicitWidth = 690
        object BtDeletarPedido: TButton
          Left = 296
          Top = 23
          Width = 105
          Height = 25
          Caption = 'Deletar Pedido'
          TabOrder = 0
          OnClick = BtDeletarPedidoClick
        end
      end
    end
  end
  object MItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 144
    object MItensCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object MItensValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '0.00'
    end
    object MItensQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object MItensTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '0.00'
    end
    object MItensDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object DsItens: TDataSource
    DataSet = MItens
    Left = 560
    Top = 192
  end
end
