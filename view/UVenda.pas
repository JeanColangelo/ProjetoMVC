
unit UVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask,
  Vcl.ComCtrls;

type
  TFrVenda = class(TForm)
    MItens: TClientDataSet;
    MItensCodProduto: TIntegerField;
    MItensValor: TFloatField;
    MItensQuantidade: TIntegerField;
    MItensTotal: TFloatField;
    DsItens: TDataSource;
    MItensDescricao: TStringField;
    PageControl1: TPageControl;
    TsVenda: TTabSheet;
    tsPesqVenda: TTabSheet;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Cliente: TLabel;
    ComboCliente: TDBLookupComboBox;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    EdCodProd: TEdit;
    ComboProduto: TDBLookupComboBox;
    EdValor: TEdit;
    EdQuantidade: TEdit;
    BtInserirItem: TButton;
    DBGrid1: TDBGrid;
    PnlEditar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BtGravarEdicao: TButton;
    Panel2: TPanel;
    LblTotal: TLabel;
    BtGravarPedido: TButton;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    EdPesqCodVenda: TEdit;
    BtPesqCodVenda: TButton;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BtDeletarPedido: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BtGravarPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtInserirItemClick(Sender: TObject);
    procedure BtGravarEdicaoClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodProdExit(Sender: TObject);
    procedure BtPesqCodVendaClick(Sender: TObject);
    procedure BtDeletarPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboClienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InserirPedido;
    procedure InserirPedidoItens;
    procedure ValidaPedido;
    procedure ValidaItens;
    procedure LimpaCampos;
    procedure CalculaTotais;
    procedure LimparVenda;
    procedure Pesquisar;
    procedure Excluir;
var
    vTotal : Double;
  end;

var
  FrVenda: TFrVenda;

implementation

uses
  UConexao, UVendaController, UVendaModel, UDmVenda;

{$R *.dfm}

procedure TFrVenda.BtDeletarPedidoClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrVenda.BtGravarEdicaoClick(Sender: TObject);
begin
  MItens.Edit;
  MItensTotal.AsFloat := MItensQuantidade.AsInteger * MItensValor.AsFloat;
  MItens.Post;
  PnlEditar.Visible := False;
  DBGrid1.Enabled := True;
  CalculaTotais;
end;

procedure TFrVenda.BtGravarPedidoClick(Sender: TObject);
begin
  ValidaPedido;
  InserirPedido;
  InserirPedidoItens;

  LimparVenda;
end;

procedure TFrVenda.BtInserirItemClick(Sender: TObject);
begin

  ValidaItens;

  MItens.Append;
  MItensCodProduto.AsInteger := ComboProduto.KeyValue;
  MItensDescricao.AsString   := ComboProduto.Text;
  MItensQuantidade.AsInteger := StrToInt(EdQuantidade.Text);
  MItensValor.AsFloat        := StrToFloat(EdValor.Text);
  MItensTotal.AsFloat        := MItensValor.AsFloat * MItensQuantidade.AsInteger;
  MItens.Post;

  LimpaCampos;
  CalculaTotais;
  EdCodProd.SetFocus;

end;


procedure TFrVenda.BtPesqCodVendaClick(Sender: TObject);
begin

  if EdPesqCodVenda.Text <> '' then
    Pesquisar
  else
    Application.MessageBox('Informe o c?digo da venda para consulta!!!', 'Aviso');

end;

procedure TFrVenda.CalculaTotais;
begin
  vTotal := 0;
  MItens.First;
  while not MItens.Eof do begin

    vTotal := vTotal + MItensTotal.AsFloat;
    MItens.Next;
  end;

  LblTotal.Caption := FormatFloat('0.00',vTotal);

end;

procedure TFrVenda.ComboClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
      Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
    MItens.Delete;
    CalculaTotais;
  end;
end;

procedure TFrVenda.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    PnlEditar.Visible := True;
    DBGrid1.Enabled := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TFrVenda.EdCodProdExit(Sender: TObject);
begin
  if EdCodProd.Text <> '' then begin
    ComboProduto.KeyValue := StrToInt(EdCodProd.Text);
    EdValor.Text := FloatToStr(FrDmConexao.QProdutoPreco.AsFloat);
    EdQuantidade.SetFocus;
  end;
end;

procedure TFrVenda.Excluir;
var oPedidoController : TPedidoController;
  sErro: string;
begin

  oPedidoController := TPedidoController.Create;

  try
    if FrDmVenda.QConsulta.RecordCount > 0 then begin

      if MessageDlg('Deseja realmente excluir esse pedido?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
        oPedidoController.Excluir(FrDmVenda.QConsultaCodPedido.AsInteger, sErro);

        FrDmVenda.QConsulta.Refresh;
      end;

    end else
      raise Exception.Create('Nao h? registros para excluir!!!');

  finally
    FreeAndNil(oPedidoController);
  end;



end;

procedure TFrVenda.FormCreate(Sender: TObject);
begin
  FrDmVenda := TFrDmVenda.Create(nil);
end;

procedure TFrVenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FrDmVenda);
end;

procedure TFrVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F8 then
    BtGravarPedido.Click;
end;

procedure TFrVenda.FormShow(Sender: TObject);
begin
  FrDmConexao.QCliente.Open;
  FrDmConexao.QProduto.Open;
  MItens.CreateDataSet;
  vTotal := 0;
  ComboCliente.SetFocus;
end;

procedure TFrVenda.InserirPedido;
var
  oPedido : TPedido;
  oPedidoController : TPedidoController;
  sErro : String;
begin

  oPedido := TPedido.Create;
  oPedidoController := TPedidoController.Create;

  try

    with oPedido do begin
      Emissao := Date;
      CodCliente := ComboCliente.KeyValue;
      Total := StrToFloat(LblTotal.Caption);
    end;

    if oPedidoController.InserirPedido(oPedido, sErro) = False then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oPedido);
    FreeAndNil(oPedidoController);
  end;

end;

procedure TFrVenda.InserirPedidoItens;
var
  oPedidoItens : TPedidoItens;
  oPedidoItensController : TPedidoController;
  sErro : String;
begin

  oPedidoItens := TPedidoItens.Create;
  oPedidoItensController := TPedidoController.Create;

  try

    MItens.First;
    while not MItens.Eof do begin

      with oPedidoItens do begin
        CodProduto := MItensCodProduto.AsInteger;
        Valor := MItensValor.AsFloat;
        Quantidade := MItensQuantidade.AsInteger;
        Total := MItensTotal.AsFloat;
      end;

      MItens.Next;

      if oPedidoItensController.InserirPedidoItens(oPedidoItens, sErro) = False then
        raise Exception.Create(sErro);

    end;

  finally
    FreeAndNil(oPedidoItens);
    FreeAndNil(oPedidoItensController);
  end;

end;

procedure TFrVenda.LimpaCampos;
begin
  EdCodProd.Clear;
  ComboProduto.KeyValue := 0;
  EdQuantidade.Clear;
  EdValor.Clear;
end;

procedure TFrVenda.LimparVenda;
begin
  ComboCliente.KeyValue := 0;
  MItens.Close;
  MItens.CreateDataSet;
  vTotal := 0;
  LblTotal.Caption := '';
end;

procedure TFrVenda.Pesquisar;
var
  oPedidoController : TPedidoController;
begin

  oPedidoController := TPedidoController.Create;

  try

    oPedidoController.Pesquisar(StrToInt(EdPesqCodVenda.Text));

  finally
    FreeAndNil(oPedidoController);
  end;

end;

procedure TFrVenda.ValidaItens;
begin
  if ComboProduto.Text = '' then begin
    Application.MessageBox('Informe Produto!!', 'Aviso' );
    EdCodProd.SetFocus;
    Abort;
  end;

  if EdQuantidade.Text <= '0' then begin
    Application.MessageBox('Informe Quantidade!!', 'Aviso' );
    EdQuantidade.SetFocus;
    Abort;
  end;

  if EdValor.Text <= '0' then begin
    Application.MessageBox('Informe Valor!!', 'Aviso' );
    EdValor.SetFocus;
    Abort;
  end;
end;

procedure TFrVenda.ValidaPedido;
begin
  if ComboCliente.Text = '' then begin
    Application.MessageBox('Informe Cliente!!', 'Aviso' );
    ComboCliente.SetFocus;
    Abort;
  end;

  if Mitens.IsEmpty then begin

    Application.MessageBox('Informe os itens!!', 'Aviso' );
    EdCodProd.SetFocus;
    Abort;

  end;
end;

end.
