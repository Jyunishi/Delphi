object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 640
  ClientWidth = 971
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBSRichViewEdit1: TDBSRichViewEdit
    Left = 8
    Top = 72
    Width = 945
    Height = 553
    Cursor = crIBeam
    Color = 10070188
    TabOrder = 0
    HScrollBarSchemeIndex = 0
    VScrollBarSchemeIndex = 0
    Version = 'v7.2.4'
    PageProperty.PageWidth = 210.000000000000000000
    PageProperty.PageHeight = 297.000000000000000000
    PageProperty.LeftMargin = 35.000000000000000000
    PageProperty.RightMargin = 15.000000000000000000
    PageProperty.TopMargin = 25.000000000000000000
    PageProperty.BottomMargin = 25.000000000000000000
    PageProperty.PageNoFont.Charset = DEFAULT_CHARSET
    PageProperty.PageNoFont.Color = clWindowText
    PageProperty.PageNoFont.Height = -11
    PageProperty.PageNoFont.Name = 'Arial'
    PageProperty.PageNoFont.Style = []
    PageProperty.PageBreak.Text = 'Page break'
    PageProperty.HeaderY = 10.000000000000000000
    PageProperty.FooterY = 10.000000000000000000
    ViewProperty.MarginBounds = [srvmbLeft, srvmbRight, srvmbTop, srvmbBottom]
    ViewProperty.HintFont.Charset = DEFAULT_CHARSET
    ViewProperty.HintFont.Color = clInfoText
    ViewProperty.HintFont.Height = -13
    ViewProperty.HintFont.Name = 'Tahoma'
    ViewProperty.HintFont.Style = []
    ViewProperty.HintPrefixText = 'Page '
    ViewProperty.ZoomPanelFont.Charset = DEFAULT_CHARSET
    ViewProperty.ZoomPanelFont.Height = -11
    ViewProperty.ZoomPanelFont.Name = 'Arial'
    ViewProperty.ZoomPercent = 112.000000000000000000
    ViewProperty.ZoomPercentEdit = 100.000000000000000000
    ViewProperty.ZoomPercentIN = 40.499530792236330000
    ViewProperty.ZoomPercentOUT = 100.000000000000000000
    ViewProperty.MainTitleFont.Charset = DEFAULT_CHARSET
    ViewProperty.MainTitleFont.Height = -11
    ViewProperty.MainTitleFont.Name = 'Tahoma'
    ViewProperty.MainTitleFont.Style = []
    ViewProperty.HeaderTitleFont.Charset = DEFAULT_CHARSET
    ViewProperty.HeaderTitleFont.Height = -11
    ViewProperty.HeaderTitleFont.Name = 'Tahoma'
    ViewProperty.HeaderTitleFont.Style = []
    ViewProperty.FooterTitleFont.Charset = DEFAULT_CHARSET
    ViewProperty.FooterTitleFont.Height = -11
    ViewProperty.FooterTitleFont.Name = 'Tahoma'
    ViewProperty.FooterTitleFont.Style = []
    LineNumberProperty.Font.Charset = DEFAULT_CHARSET
    LineNumberProperty.Font.Height = -11
    LineNumberProperty.Font.Name = 'Tahoma'
    LineNumberProperty.Font.Style = []
    BackgroundProperty.PercentMiddle = 50.000000000000000000
    MenuHButtons = <>
    MenuVButtons = <>
    MenuHorizontal.PenFrame.Color = 12937777
    MenuVertical.PenFrame.Color = 12937777
    CaretBlinkTime = 530
    RVColor = clWhite
    RVOptions = [rvoAllowSelection, rvoScrollToEnd, rvoTagsArePChars, rvoAutoCopyUnicodeText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoShowGridLines, rvoFastFormatting]
    RVEditorOptions = [rvoCtrlJumps, rvoWantTabs]
    RTFOptions = [rvrtfDuplicateUnicode, rvrtfSaveEMFAsWMF, rvrtfSaveJpegAsJpeg, rvrtfSavePngAsPng, rvrtfSaveDocParameters, rvrtfSaveHeaderFooter]
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoIgnoreUnknownPicFmt, rvfoIgnoreUnknownCtrls, rvfoConvUnknownStylesToZero, rvfoConvLargeImageIdxToZero, rvfoSaveBinary, rvfoSaveBack, rvfoLoadBack, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveLayout, rvfoLoadLayout, rvfoSaveDocProperties, rvfoLoadDocProperties]
    TabNavigation = rvtnNone
    AutoDisplay = True
    IgnoreEscape = False
    DataField = 'DATA'
    DataSource = OraDataSource1
    FieldFormat = rvdbRTF
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Insert'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'GetItem'
    TabOrder = 2
    OnClick = Button2Click
  end
  object OraSession1: TOraSession
    Username = 'system'
    Server = 'NVDS1'
    Connected = True
    LoginPrompt = False
    Left = 608
    Top = 200
    EncryptedPassword = 'ABFFA6FF94FFC6FF85FF9EFFB1FF'
  end
  object OraQuery1: TOraQuery
    Session = OraSession1
    SQL.Strings = (
      'select'
      '  rid,'
      '  data '
      'from'
      '  lpu.template'
      'where'
      '  rid = 227  '
      '  ')
    Active = True
    Left = 552
    Top = 280
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 472
    Top = 328
  end
end
