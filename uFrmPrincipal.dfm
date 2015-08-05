object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 420
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
    Height = 420
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 127
      Height = 13
      Caption = 'Caminho do banco Original'
    end
    object Label2: TLabel
      Left = 99
      Top = 51
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object lblSenha: TLabel
      Left = 105
      Top = 78
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object Label4: TLabel
      Left = 55
      Top = 105
      Width = 80
      Height = 13
      Caption = 'Caminho do iSQL'
    end
    object lbl1: TLabel
      Left = 55
      Top = 132
      Width = 78
      Height = 13
      Caption = 'Tabelas a serem'
    end
    object lblProcesso: TLabel
      Left = 55
      Top = 344
      Width = 92
      Height = 19
      Caption = 'lblProcesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCaminhoBanco: TEdit
      Left = 141
      Top = 21
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object edtUsuario: TEdit
      Left = 141
      Top = 48
      Width = 155
      Height = 21
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 141
      Top = 75
      Width = 155
      Height = 21
      TabOrder = 2
    end
    object pnlBotoes: TPanel
      Left = 1
      Top = 383
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
      end
    end
    object edtCaminhoIsql: TEdit
      Left = 141
      Top = 102
      Width = 385
      Height = 21
      TabOrder = 4
    end
    object mmoTables: TMemo
      Left = 141
      Top = 129
      Width = 385
      Height = 186
      Lines.Strings = (
        'pessoas_ent_sai'
        'pessoas_ent_sai_temp'
        'movimento'
        'movimentacao'
        'movimentacao_temp')
      TabOrder = 5
    end
    object btnMudaEstado: TButton
      Left = 60
      Top = 151
      Width = 75
      Height = 25
      Caption = 'Exclu'#237'das'
      TabOrder = 6
      OnClick = btnMudaEstadoClick
    end
  end
end
