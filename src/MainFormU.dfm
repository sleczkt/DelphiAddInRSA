object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 453
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 360
    Top = 91
    Width = 21
    Height = 13
    Caption = 'Bars'
  end
  object Label2: TLabel
    Left = 360
    Top = 35
    Width = 30
    Height = 13
    Caption = 'Nodes'
  end
  object RadioButton1: TRadioButton
    Left = 410
    Top = 224
    Width = 113
    Height = 17
    Caption = 'RadioButton1'
    TabOrder = 0
  end
  object RadioButton2: TRadioButton
    Left = 392
    Top = 280
    Width = 113
    Height = 17
    Caption = 'RadioButton2'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 410
    Top = 384
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 440
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 321
    Height = 425
    ItemHeight = 13
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 440
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 536
    Top = 168
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
end
