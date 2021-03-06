unit UVendaController;

interface

uses
  UVendaModel, UDmVenda;

type
  TPedidoController = class
  public
    function InserirPedido(oPedido : TPedido; out sErro: string): Boolean;
    function InserirPedidoItens(oPedidoItens : TPedidoItens; out sErro: string): Boolean;
    procedure Pesquisar(vCodigo : Integer);
    function Excluir(vCodigo: Integer; out sErro: string): Boolean;
  end;

implementation

{ TVendaController }

function TPedidoController.Excluir(vCodigo: Integer;
  out sErro: string): Boolean;
begin
  FrDmVenda.Excluir(vCodigo, sErro);
end;

function TPedidoController.InserirPedido(oPedido: TPedido;
  out sErro: string): Boolean;
begin
  Result := FrDmVenda.InserirPedido(oPedido, sErro);
end;

function TPedidoController.InserirPedidoItens(oPedidoItens: TPedidoItens;
  out sErro: string): Boolean;
begin
  Result := FrDmVenda.InserirPedidoItens(oPedidoItens, sErro);
end;

procedure TPedidoController.Pesquisar(vCodigo: Integer);
begin
  FrDmVenda.Pesquisar(vCodigo);
end;

end.
