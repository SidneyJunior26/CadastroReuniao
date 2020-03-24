object Dm: TDm
  OldCreateOrder = False
  Height = 325
  Width = 464
  object cdsAgenda: TClientDataSet
    PersistDataPacket.Data = {
      8C0000009619E0BD0100000018000000050000000000030000008C0006434F44
      494E54040001000000000007415353554E544F01004900000001000557494454
      48020002001E000944455343524943414F010049000000010005574944544802
      00020096000444415441080008000000000007434C49454E5445010049000000
      01000557494454480200020050000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 8
    object cdsAgendaCODINT: TIntegerField
      FieldName = 'CODINT'
    end
    object cdsAgendaASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 30
    end
    object cdsAgendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsAgendaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsAgendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Curs' +
        'os\TreinaWeb\Delphi\Projeto Final\Banco de Dados\PROJETOFINAL.IB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object TblClientes: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 16
    Top = 80
    object TblClientesCODINT: TIntegerField
      FieldName = 'CODINT'
      Origin = 'CODINT'
      Required = True
    end
    object TblClientesAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 10
    end
    object TblClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Size = 80
    end
    object TblClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 150
    end
    object TblClientesCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 40
    end
  end
  object DsClientes: TDataSource
    AutoEdit = False
    DataSet = TblClientes
    Left = 16
    Top = 128
  end
  object DsAgenda: TDataSource
    AutoEdit = False
    DataSet = cdsAgenda
    Left = 240
    Top = 72
  end
  object cdsAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 8
    object cdsAuxiliarCODINT: TIntegerField
      FieldName = 'CODINT'
    end
    object cdsAuxiliarASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 30
    end
    object cdsAuxiliarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsAuxiliarDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsAuxiliarCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 80
    end
  end
  object DsAuxiliar: TDataSource
    Left = 160
    Top = 72
  end
end
