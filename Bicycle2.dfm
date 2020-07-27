object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 391
    Top = 56
    Width = 62
    Height = 13
    Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077':'
  end
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 385
    Height = 233
    Columns = <>
    TabOrder = 0
  end
  object Button1: TButton
    Left = 391
    Top = 8
    Width = 106
    Height = 25
    Action = FileOpen1
    TabOrder = 1
  end
  object distance: TEdit
    Left = 459
    Top = 53
    Width = 38
    Height = 21
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 40
    Top = 24
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
    end
  end
end
