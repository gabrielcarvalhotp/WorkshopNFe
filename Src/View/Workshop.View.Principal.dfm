object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'ViewPrincipal'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 120
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Gerar NFe'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 120
    Top = 167
    Width = 361
    Height = 154
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 201
    Top = 137
    Width = 145
    Height = 23
    ItemIndex = 0
    TabOrder = 2
    Text = 'Simples Nacional'
    Items.Strings = (
      'Simples Nacional'
      'Simples Excesso Receita'
      'Regime Normal')
  end
end
