object FrDmVenda: TFrDmVenda
  OldCreateOrder = False
  Height = 301
  Width = 441
  object QConsulta: TFDQuery
    Connection = FrDmConexao.FDConexao
    SQL.Strings = (
      'SELECT * FROM pedido'
      'where codpedido = :codigo')
    Left = 40
    Top = 32
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object QConsultaCodPedido: TFDAutoIncField
      FieldName = 'CodPedido'
      Origin = 'CodPedido'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QConsultaEmissao: TDateField
      FieldName = 'Emissao'
      Origin = 'Emissao'
      Required = True
    end
    object QConsultaCodCliente: TIntegerField
      FieldName = 'CodCliente'
      Origin = 'CodCliente'
      Required = True
    end
    object QConsultaTotal: TSingleField
      FieldName = 'Total'
      Origin = 'Total'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object QConsultaItens: TFDQuery
    IndexFieldNames = 'CodPedido'
    MasterSource = DsConsulta
    MasterFields = 'CodPedido'
    Connection = FrDmConexao.FDConexao
    SQL.Strings = (
      'SELECT * FROM pedido_itens')
    Left = 40
    Top = 88
    object QConsultaItensCodPedItens: TFDAutoIncField
      FieldName = 'CodPedItens'
      Origin = 'CodPedItens'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QConsultaItensCodPedido: TIntegerField
      FieldName = 'CodPedido'
      Origin = 'CodPedido'
      Required = True
    end
    object QConsultaItensCodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'CodProduto'
      Required = True
    end
    object QConsultaItensQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      Required = True
    end
    object QConsultaItensValor: TSingleField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      DisplayFormat = '0.00'
    end
    object QConsultaItensTotal: TSingleField
      FieldName = 'Total'
      Origin = 'Total'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object DsConsulta: TDataSource
    DataSet = QConsulta
    Left = 112
    Top = 32
  end
  object DsConsultaItens: TDataSource
    DataSet = QConsultaItens
    Left = 112
    Top = 88
  end
end
