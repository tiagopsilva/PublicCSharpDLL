object MainForm: TMainForm
  Left = 703
  Top = 409
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Example in Delphi DLL consumption'
  ClientHeight = 154
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lblResult: TLabel
    Left = 0
    Top = 0
    Width = 342
    Height = 45
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object TestButton: TButton
    Left = 136
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = TestButtonClick
  end
end
