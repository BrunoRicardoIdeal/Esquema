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
  object CONEXAO_NOVO: TFDConnection
    Params.Strings = (
      'User_Name=HOJETEC'
      'Password=systemby'
      'Database=D:\Esquema\Win32\Debug\BANCO_NOVO.IB'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evItems, evCache, evAutoFetchAll]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FetchOptions.Cache = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvStoreItems]
    ResourceOptions.StoreItems = [siData, siDelta]
    ConnectedStoredUsage = [auDesignTime]
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
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = []
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
  object qryExecutaSQL: TFDQuery
    BeforeExecute = qryExecutaSQLBeforeExecute
    Connection = CONEXAO_NOVO
    SQL.Strings = (
      
        'select distinct RDB$Relation_name Tabela from RDB$Relation_field' +
        's '
      'where upper(RDB$Relation_name) not containing '#39'V_'#39' '
      'and RDB$Relation_name not containing '#39'$'#39)
    Left = 312
    Top = 272
  end
  object FDScripts: TFDScript
    SQLScripts = <>
    Connection = CONEXAO_NOVO
    ScriptOptions.CommitEachNCommands = 10
    ScriptOptions.BreakOnError = True
    ScriptOptions.CommandSeparator = ';'
    ScriptOptions.SQLDialect = 3
    Params = <>
    Macros = <>
    Left = 392
    Top = 232
  end
  object fdDataMove: TFDDataMove
    TextDataDef.Fields = <>
    TextFileName = 'Data.txt'
    Mappings = <>
    LogFileName = 'Data.log'
    Source = qryTabelaAntiga
    Destination = qryTabelaNova
    Left = 96
    Top = 232
  end
end
