program PrjTesteMVC;

uses
  Vcl.Forms,
  UVenda in 'view\UVenda.pas' {FrVenda},
  UConexao in 'dao\UConexao.pas' {FrDmConexao: TDataModule},
  UVendaModel in 'model\UVendaModel.pas',
  UDmVenda in 'dao\UDmVenda.pas' {FrDmVenda: TDataModule},
  UVendaController in 'controller\UVendaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrVenda, FrVenda);
  Application.CreateForm(TFrDmConexao, FrDmConexao);
  Application.Run;
end.
