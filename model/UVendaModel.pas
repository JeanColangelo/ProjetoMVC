unit UVendaModel;

interface

uses
  System.SysUtils;

type
TPedido = class
     private
        FEmissao : TDate;
        FCodCliente : Integer;
        FTotal : Double;
     public
        property Emissao: TDate read FEmissao write FEmissao;
        property CodCliente: Integer read FCodCliente write FCodCliente;
        property Total: Double read FTotal write FTotal;

     end;

TPedidoItens = class
              private
                FCodPedido : Integer;
                FCodProduto : Integer;
                FQuantidade : Integer;
                FValor : Double;
                FTotal : Double;
              public
                property CodPedido: Integer read FCodPedido write FCodPedido;
                property CodProduto: Integer read FCodProduto write FCodProduto;
                property Quantidade: Integer read FQuantidade write FQuantidade;
                property Valor: Double read FValor write FValor;
                property Total: Double read FTotal write FTotal;

              end;

implementation

end.
