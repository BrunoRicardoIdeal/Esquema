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
    Left = 104
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
end
