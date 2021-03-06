unit UDmVenda;

interface

uses
  System.SysUtils, System.Classes, UVendaModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrDmVenda = class(TDataModule)
    QConsulta: TFDQuery;
    QConsultaItens: TFDQuery;
    QConsultaItensCodPedItens: TFDAutoIncField;
    QConsultaItensCodPedido: TIntegerField;
    QConsultaItensCodProduto: TIntegerField;
    QConsultaItensQuantidade: TIntegerField;
    QConsultaItensValor: TSingleField;
    QConsultaItensTotal: TSingleField;
    QConsultaCodPedido: TFDAutoIncField;
    QConsultaEmissao: TDateField;
    QConsultaCodCliente: TIntegerField;
    QConsultaTotal: TSingleField;
    DsConsulta: TDataSource;
    DsConsultaItens: TDataSource;
  private
    { Private declarations }
  public
    function gerarCodPedido: Integer;
    function InserirPedido(oPedido : TPedido; out sErro: string): Boolean;
    function InserirPedidoItens(oPedidoItens : TPedidoItens; out sErro: string): Boolean;
    procedure Pesquisar(vCodigo: Integer);
    function Excluir(vCodigo: Integer; out sErro: string): Boolean;
  end;

var
  FrDmVenda: TFrDmVenda;

implementation

uses
  UConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFrDmVenda }

function TFrDmVenda.InserirPedido(oPedido: TPedido; out sErro: string): Boolean;
var vQuery : TFDQuery;
begin

  vQuery := TFDQuery.Create(nil);

  with vQuery, oPedido do begin

    Connection := FrDmConexao.FDConexao;

    Close;
    SQL.Text := 'INSERT INTO pedido(Emissao, CodCliente, Total) '+
                ' VALUES (:Emissao, :CodCliente, :Total)';
    ParamByName('Emissao').AsDate := Emissao;
    ParamByName('CodCliente').AsInteger := CodCliente;
    ParamByName('Total').AsFloat := Total;

    try

      ExecSQL;
      Result := True;

    except on E: Exception do begin
      sErro := 'Erro na insercao da Venda: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;

  end;

end;

function TFrDmVenda.InserirPedidoItens(oPedidoItens: TPedidoItens;
  out sErro: string): Boolean;
var vQuery : TFDQuery;
begin

  vQuery := TFDQuery.Create(nil);

  with vQuery, oPedidoItens do begin

    Connection := FrDmConexao.FDConexao;

    Close;
    SQL.Text := 'INSERT INTO pedido_itens(CodPedido, CodProduto, Quantidade, Valor, Total) '+
                ' VALUES (:CodPedido, :CodProduto, :Quantidade, :Valor, :Total)';
    ParamByName('CodPedido').AsInteger := gerarCodPedido;
    ParamByName('CodProduto').AsInteger := CodProduto;
    ParamByName('Quantidade').AsInteger := Quantidade;
    ParamByName('Valor').AsFloat := Valor;
    ParamByName('Total').AsFloat := Total;

    try

      ExecSQL;
      Result := True;

    except on E: Exception do begin
      sErro := 'Erro na insercao dos Itens: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;

  end;

end;

procedure TFrDmVenda.Pesquisar(vCodigo: Integer);
begin
  QConsulta.Close;
  QConsultaItens.Close;
  QConsulta.ParamByName('codigo').AsInteger := vCodigo;
  QConsulta.Open;
  QConsulta.First;
  QConsultaItens.Open;
end;

function TFrDmVenda.Excluir(vCodigo: Integer; out sErro: string): Boolean;
var vQuery : TFDQuery;
begin

  vQuery := TFDQuery.Create(nil);
  with vQuery do begin
    Connection := FrDmConexao.FDConexao;

    try
      Close;
      SQL.Text := 'DELETE FROM pedido WHERE CodPedido = :Codigo';
      ParamByName('Codigo').AsInteger := vCodigo;
      ExecSQL;

      Close;
      SQL.Text := 'DELETE FROM pedido_itens WHERE CodPedido = :Codigo';
      ParamByName('Codigo').AsInteger := vCodigo;
      ExecSQL;

      Result := True;
    except on E: Exception do begin
      sErro := 'Erro na exclusao do Pedido: ' + sLineBreak + E.Message;
      Result := False;
    end;
    end;

  end;

end;

function TFrDmVenda.gerarCodPedido: Integer;
var
  sqlSequencia : TFDQuery;
begin

  sqlSequencia := TFDQuery.Create(nil);

  try
    with sqlSequencia do begin
      Connection := FrDmConexao.FDConexao;
      Sql.Text := 'Select coalesce(max(CodPedido), 0) as seq from pedido';
      Open;
      Result := FieldByName('seq').AsInteger;
    end;

  finally
    FreeAndNil(sqlSequencia);
  end;

end;

end.
