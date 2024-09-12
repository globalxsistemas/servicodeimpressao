object DMPrimcipal: TDMPrimcipal
  OnCreate = DataModuleCreate
  Height = 468
  Width = 732
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\Globalfood\DATA.FDB'
      'Protocol='
      'Port=3025'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 34
    Top = 8
  end
  object cxDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'CATEGORIAIMPRESSORA')
    Left = 42
    Top = 88
  end
  object cxDataSource: TDataSource
    DataSet = cxDataSet
    Left = 114
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Globalfood\fbclient.dll'
    Left = 138
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 242
    Top = 8
  end
  object categoriaDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    SQL.Strings = (
      'SELECT CATEGORIA '
      'from produtos '
      'group by CATEGORIA '
      'order by CATEGORIA asc')
    Left = 58
    Top = 160
  end
  object comandaDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    SQL.Strings = (
      'SELECT '
      '    P.ean, '
      '    P.CATEGORIA as CATEGORIA,'
      '    C.DESCRICAO as DESCRICAOCOMANDA,'
      '    M.DESCRICAO AS DESCRICAOMESA,'
      '    C.QTD as QTD,'
      '    C.VL_ITEM as VL_ITEM,'
      '    C.VALORUNIT as VALORUNIT,'
      '    C.OPERADOR as OPERADOR,'
      '    M.NUMERO as NMMESA,'
      '    M.PESSOAS as PESSOAS,'
      '    M.ABERTURA as ABERTURA,'
      '    C.OBSERVACAO as OBSERVACAO,'
      '    G.NOME AS NOMEGARCON'
      'FROM COMANDAS AS C'
      'LEFT OUTER JOIN MESAS AS M ON (M.NUMERO = C.MESA)'
      'LEFT OUTER JOIN garcons AS G ON (G.COD = M.GARCOM)'
      'LEFT OUTER JOIN PRODUTOS AS P ON (P.EAN = C.COD_PROD)'
      'WHERE M.STATUS != '#39'2'#39' '
      '  AND C.COD IN (2444, 2445);')
    Left = 58
    Top = 216
    object comandaDataSetEAN: TStringField
      FieldName = 'EAN'
      Origin = 'EAN'
      Size = 50
    end
    object comandaDataSetCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 40
    end
    object comandaDataSetDESCRICAOCOMANDA: TStringField
      FieldName = 'DESCRICAOCOMANDA'
      Origin = 'DESCRICAOCOMANDA'
      Size = 100
    end
    object comandaDataSetDESCRICAOMESA: TStringField
      FieldName = 'DESCRICAOMESA'
      Origin = 'DESCRICAOMESA'
      Size = 100
    end
    object comandaDataSetQTD: TSingleField
      FieldName = 'QTD'
      Origin = 'QTD'
    end
    object comandaDataSetVL_ITEM: TSingleField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
    end
    object comandaDataSetVALORUNIT: TFMTBCDField
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      Precision = 18
      Size = 2
    end
    object comandaDataSetOPERADOR: TStringField
      FieldName = 'OPERADOR'
      Origin = 'OPERADOR'
    end
    object comandaDataSetNMMESA: TIntegerField
      FieldName = 'NMMESA'
      Origin = 'NMMESA'
    end
    object comandaDataSetPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
      Origin = 'PESSOAS'
    end
    object comandaDataSetABERTURA: TSQLTimeStampField
      FieldName = 'ABERTURA'
      Origin = 'ABERTURA'
    end
    object comandaDataSetOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object comandaDataSetNOMEGARCON: TStringField
      FieldName = 'NOMEGARCON'
      Origin = 'NOMEGARCON'
      Size = 100
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 440
    Top = 184
  end
  object categoriaImpressoraDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'CATEGORIAIMPRESSORA')
    Left = 58
    Top = 280
  end
  object impressorasDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    SQL.Strings = (
      'SELECT'
      'impressora'
      'FROM'
      'CATEGORIAIMPRESSORA  group by impressora')
    Left = 58
    Top = 344
  end
  object statusImpressoDataSet: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    FetchOptions.DetailOptimize = False
    Left = 58
    Top = 400
  end
  object frxReport1: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43413.753260891200000000
    ReportOptions.LastChange = 44951.771146261600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MemotOTALOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 280
    Top = 184
    Datasets = <
      item
        DataSet = ImpressaoComanda
        DataSetName = 'Comanda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 80.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 177
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 1.000000000000000000
      BottomMargin = 1.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 264.567100000000000000
        object ComandaNMMESA: TfrxMemoView
          AllowVectorExport = True
          Left = 1.677180000000000000
          Top = 49.543290000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'MESA : [Comanda."NMMESA"]                          ABERTURA : [C' +
              'omanda."ABERTURA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object ComandaNOMEGARCON: TfrxMemoView
          AllowVectorExport = True
          Left = 1.338590000000000000
          Top = 37.102350000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'GAR'#199'OM : [Comanda."NOMEGARCON"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 1.000000000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PR'#201' - CONTA')
          ParentFont = False
        end
        object ComandaOPERADOR: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 25.102350000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'OPERADOR : [Comanda."OPERADOR"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 66.165430000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 1.212740000000000000
          Top = 23.267780000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 0.740260000000000000
          Top = 78.488250000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 2.133890000000000000
          Top = 65.504020000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 42.236240000000000000
          Top = 66.047310000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 224.315090000000000000
          Top = 65.826840000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.677180000000000000
        Top = 181.417440000000000000
        Width = 264.567100000000000000
        DataSet = ImpressaoComanda
        DataSetName = 'Comanda'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object ComandaDESCRICAOCOMANDA: TfrxMemoView
          AllowVectorExport = True
          Left = 42.000000000000000000
          Top = 1.559060000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAOCOMANDA'
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Comanda."DESCRICAOCOMANDA"]')
          ParentFont = False
        end
        object ComandaQTD: TfrxMemoView
          AllowVectorExport = True
          Left = 2.181200000000000000
          Top = 1.118120000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Comanda."QTD"]')
          ParentFont = False
        end
        object ComandaVALORUNIT: TfrxMemoView
          AllowVectorExport = True
          Left = 209.433210000000000000
          Top = 1.118120000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Comanda."VL_ITEM"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 612.283860000000000000
        Width = 264.567100000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 136.913420000000000000
        Top = 219.212740000000000000
        Width = 264.567100000000000000
        object ComandaPESSOAS: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 92.559060000000000000
          Width = 260.787570000000000000
          Height = 41.574830000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '*****  Consideramos   [Comanda."PESSOAS"]  pessoas na mesa.'
            '         Se Estiver errado, pe'#231'a a corre'#231#227'o.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 103.708720000000000000
          Top = 2.000000000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL  :  [SUM(<Comanda."VL_ITEM">,MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = -1.779530000000000000
          Top = 2.000000000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -0.086580000000000000
          Top = 20.881880000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object MemotOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 168.889920000000000000
          Top = 43.574830000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<Comanda."VL_ITEM">,MasterData1) + SUM(<Comanda."VL_ITEM">,' +
              'MasterData1)/100*10]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 1.559060000000000000
          Top = 43.354360000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAMENTO TOTAL  : ')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 0.677180000000000000
          Top = 60.472480000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAMENTO POR PESSOA  : ')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -2.779530000000000000
          Top = 87.929190000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -1.779530000000000000
          Top = 90.929190000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object MemoGorjeta: TfrxMemoView
          AllowVectorExport = True
          Left = 169.330860000000000000
          Top = 26.456710000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Comanda."VL_ITEM">,MasterData1)/100*10]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 27.236240000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'GORJETA (10%)  : ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 168.858380000000000000
          Top = 59.472480000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(SUM(<Comanda."VL_ITEM">,MasterData1) +(SUM(<Comanda."VL_ITEM">' +
              ',MasterData1)/100*10))/(<Comanda."PESSOAS">)]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 114.141717640000000000
        Top = 438.425480000000000000
        Visible = False
        Width = 264.567100000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 67.881880000000000000
          Width = 260.787570000000000000
          Height = 41.574830000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '*****  Consideramos   [Comanda."PESSOAS"]  pessoas na mesa.'
            '         Se Estiver errado, pe'#231'a a corre'#231#227'o.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 110.488250000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL  :  [SUM(<Comanda."VALORUNIT">,MasterData2)]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 2.692950000000000000
          Top = 18.881880000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 175.669450000000000000
          Top = 22.677180000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Comanda."VALORUNIT">,MasterData2)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 22.456710000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAMENTO TOTAL  : ')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.456710000000000000
          Top = 39.574830000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAGAMENTO POR PESSOA  : ')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Top = 59.472480000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 62.472480000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 175.637910000000000000
          Top = 38.574830000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(SUM(<Comanda."VALORUNIT">,MasterData2) + (SUM(<Comanda."VALORU' +
              'NIT">,MasterData2)/100*10))/(<Comanda."PESSOAS">)]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 158.740260000000000000
        Width = 264.567100000000000000
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 377.953000000000000000
        Visible = False
        Width = 264.567100000000000000
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.677180000000000000
        Top = 400.630180000000000000
        Visible = False
        Width = 264.567100000000000000
        DataSet = ImpressaoComanda
        DataSetName = 'Comanda'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 42.000000000000000000
          Top = 1.559060000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAOCOMANDA'
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Comanda."DESCRICAOCOMANDA"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 2.181200000000000000
          Top = 1.118120000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Comanda."QTD"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 213.433210000000000000
          Top = 1.118120000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = ImpressaoComanda
          DataSetName = 'Comanda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Comanda."VALORUNIT"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 352
    Top = 184
  end
  object ImpressaoComanda: TfrxDBDataset
    UserName = 'Comanda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CATEGORIA=CATEGORIA'
      'DESCRICAOCOMANDA=DESCRICAOCOMANDA'
      'DESCRICAOMESA=DESCRICAOMESA'
      'QTD=QTD'
      'VL_ITEM=VL_ITEM'
      'VALORUNIT=VALORUNIT'
      'OPERADOR=OPERADOR'
      'NMMESA=NMMESA'
      'PESSOAS=PESSOAS'
      'ABERTURA=ABERTURA'
      'OBSERVACAO=OBSERVACAO'
      'NOMEGARCON=NOMEGARCON')
    DataSet = comandaDataSet
    BCDToCurrency = False
    DataSetOptions = []
    Left = 536
    Top = 184
  end
end
