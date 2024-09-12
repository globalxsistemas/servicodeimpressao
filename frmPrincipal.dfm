object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'FPrincipal 2.0'
  ClientHeight = 412
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    409
    412)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 77
    Height = 13
    Caption = 'Banco de Dados'
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 58
    Width = 393
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 389
    ExplicitHeight = 304
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DMPrimcipal.cxDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      object cxtvCategoria: TcxGridDBColumn
        Caption = 'Categoria'
        DataBinding.FieldName = 'CATEGORIA'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 217
      end
      object cxtvImpressora: TcxGridDBColumn
        Caption = 'Impressora'
        DataBinding.FieldName = 'IMPRESSORA'
        PropertiesClassName = 'TcxComboBoxProperties'
        Width = 190
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object btnSalvar: TcxButton
    Left = 326
    Top = 379
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    TabOrder = 1
    OnClick = btnSalvarClick
    ExplicitLeft = 322
    ExplicitTop = 378
  end
  object btnPreconta: TcxButton
    Left = 167
    Top = 379
    Width = 139
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Editar Layout Pr'#233' Conta'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    TabOrder = 2
    OnClick = btnPrecontaClick
    ExplicitLeft = 163
    ExplicitTop = 378
  end
  object btnPedido: TcxButton
    Left = 6
    Top = 379
    Width = 139
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Editar Layout pedido'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    TabOrder = 3
    OnClick = btnPedidoClick
    ExplicitLeft = 2
    ExplicitTop = 378
  end
  object edtBase: TEdit
    Left = 8
    Top = 29
    Width = 308
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 4
    ExplicitWidth = 304
  end
  object btnAbrir: TcxButton
    Left = 326
    Top = 27
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Abrir'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'McSkin'
    TabOrder = 5
    OnClick = btnAbrirClick
    ExplicitLeft = 322
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 176
  end
end
