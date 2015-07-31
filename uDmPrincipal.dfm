object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 373
  Width = 551
  object CONEXAO: TFDConnection
    Params.Strings = (
      'User_Name=HOJETEC'
      'Password=systemby'
      'DriverID=FB')
    Left = 48
    Top = 16
  end
  object qryTabelaAntiga: TFDQuery
    Connection = CONEXAO
    Left = 368
    Top = 120
  end
  object FdScripts: TFDScript
    SQLScripts = <
      item
        Name = 'scCreateDatabase'
      end>
    Connection = CONEXAO_NOVO
    Params = <>
    Macros = <>
    Left = 384
    Top = 192
  end
  object CONEXAO_NOVO: TFDConnection
    Params.Strings = (
      'User_Name=HOJETEC'
      'Password=systemby'
      'DriverID=FB')
    LoginPrompt = False
    Left = 400
    Top = 16
  end
  object qryTabelas: TFDQuery
    Connection = CONEXAO
    SQL.Strings = (
      
        'select distinct RDB$Relation_name Tabela from RDB$Relation_field' +
        's '
      'where upper(RDB$Relation_name) not containing '#39'V_'#39' '
      'and RDB$Relation_name not containing '#39'$'#39)
    Left = 320
    Top = 72
  end
  object qryTabelaNova: TFDQuery
    Connection = CONEXAO_NOVO
    Left = 440
    Top = 80
  end
  object fdphysfbdrvrlnk1: TFDPhysFBDriverLink
    Left = 256
    Top = 168
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 216
  end
end
