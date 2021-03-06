object FrDmConexao: TFrDmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 333
  Width = 429
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=mvcdelphi'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 280
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\jean_\OneDrive\TCC - ETEC\Arquivos\Sistemas Xe10\TesteM' +
      'VC\libmysql.dll'
    Left = 128
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 144
  end
  object QCliente: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'Select * from clientes'
      'order by nome')
    Left = 288
    Top = 144
    object QClienteCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 100
    end
    object QClienteCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Required = True
      Size = 40
    end
    object QClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
  end
  object DsCliente: TDataSource
    DataSet = QCliente
    Left = 288
    Top = 200
  end
  object QProduto: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'Select * from produtos'
      'order by descricao')
    Left = 344
    Top = 144
    object QProdutoCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 60
    end
    object QProdutoPreco: TSingleField
      FieldName = 'Preco'
      Origin = 'Preco'
      Required = True
    end
  end
  object DsProduto: TDataSource
    DataSet = QProduto
    Left = 344
    Top = 200
  end
end
