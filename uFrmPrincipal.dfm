object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 381
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFrundo: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 381
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 88
      Height = 13
      Caption = 'Caminho do banco'
    end
    object Label2: TLabel
      Left = 84
      Top = 51
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object lblSenha: TLabel
      Left = 90
      Top = 78
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtCaminhoBanco: TEdit
      Left = 126
      Top = 21
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object edtUsuario: TEdit
      Left = 126
      Top = 48
      Width = 155
      Height = 21
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 126
      Top = 75
      Width = 155
      Height = 21
      TabOrder = 2
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 344
      Width = 646
      Height = 36
      Align = alBottom
      TabOrder = 3
      object btnExecutar: TButton
        Left = 570
        Top = 1
        Width = 75
        Height = 34
        Align = alRight
        Caption = 'Executar'
        TabOrder = 0
        OnClick = btnExecutarClick
        ExplicitLeft = 571
      end
    end
  end
end
