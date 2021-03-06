unit UConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Forms;

type
  TFrDmConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QCliente: TFDQuery;
    DsCliente: TDataSource;
    QClienteCodigo: TFDAutoIncField;
    QClienteNome: TStringField;
    QClienteCidade: TStringField;
    QClienteUF: TStringField;
    QProduto: TFDQuery;
    DsProduto: TDataSource;
    QProdutoCodigo: TFDAutoIncField;
    QProdutoDescricao: TStringField;
    QProdutoPreco: TSingleField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrDmConexao: TFrDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TFrDmConexao.DataModuleCreate(Sender: TObject);
begin
  if FileExists( ExtractFileDir(Application.ExeName)+'\libmysql.dll') then
    FDPhysMySQLDriverLink1.VendorLib := ExtractFileDir(Application.ExeName)+'\libmysql.dll';
end;

end.
