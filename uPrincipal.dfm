object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Exemplo de P.O.O com TObjectDictionary '
  ClientHeight = 637
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 218
    Top = 144
    Width = 103
    Height = 13
    Caption = 'Quantidade de Itens:'
  end
  object Bevel1: TBevel
    Left = 186
    Top = 245
    Width = 225
    Height = 17
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 186
    Top = 359
    Width = 225
    Height = 17
    Shape = bsTopLine
  end
  object Button1: TButton
    Left = 218
    Top = 88
    Width = 145
    Height = 25
    Caption = 'Criar Nota com Itens'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 210
    Top = 293
    Width = 83
    Height = 25
    Caption = 'Consulta Item:'
    TabOrder = 1
    OnClick = Button2Click
  end
  object edtItem: TEdit
    Left = 299
    Top = 295
    Width = 72
    Height = 21
    TabOrder = 2
  end
  object SpinEdit1: TSpinEdit
    Left = 330
    Top = 141
    Width = 41
    Height = 22
    MaxValue = 999
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object Button3: TButton
    Left = 194
    Top = 391
    Width = 201
    Height = 25
    Caption = 'Exemplo mais b'#225'sico (debugando)'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 218
    Top = 192
    Width = 145
    Height = 25
    Caption = 'Liberar Nota da mem'#243'ria'
    TabOrder = 5
    OnClick = Button4Click
  end
end
