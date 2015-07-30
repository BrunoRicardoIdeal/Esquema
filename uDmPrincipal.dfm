object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 373
  Width = 551
  object CONEXAO: TFDConnection
    Params.Strings = (
      'User_Name=HOJETEC'
      'Password=systemby'
      
        'Database=D:\Academia\HOJE_ACADEMIA\PrjPrincipal\Win32\Debug\CA_V' +
        'AZIO.IB'
      'DriverID=FB')
    Left = 48
    Top = 16
  end
  object qryAux: TFDQuery
    Connection = CONEXAO
    Left = 168
    Top = 24
  end
  object FdScripts: TFDScript
    SQLScripts = <
      item
        Name = 'scCreateDatabase'
      end>
    Connection = CONEXAO
    Params = <>
    Macros = <>
    Left = 72
    Top = 96
  end
  object CONEXAO_NOVO: TFDConnection
    Params.Strings = (
      'User_Name=HOJETEC'
      'Password=systemby'
      'DriverID=FB')
    Left = 400
    Top = 16
  end
  object qryTabelas: TFDQuery
    Connection = CONEXAO_NOVO
    SQL.Strings = (
      
        'select distinct RDB$Relation_name Tabela from RDB$Relation_field' +
        's '
      'where upper(RDB$Relation_name) not containing '#39'V_'#39' '
      'and RDB$Relation_name not containing '#39'$'#39)
    Left = 400
    Top = 72
  end
end
