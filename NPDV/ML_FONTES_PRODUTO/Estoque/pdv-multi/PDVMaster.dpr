program PDVMaster;

uses
  System.StartUpCopy,
  FMX.Forms,
  UVendas in 'UVendas.pas' {FrmVendas},
  UDm in 'UDm.pas' {DmDados: TDataModule},
  UFrmConsProduto in 'UFrmConsProduto.pas' {FrmConsProduto},
  untImpressao in 'untImpressao.pas',
  UfrmLogin in 'UfrmLogin.pas' {FrrmLogin},
  UFrmAberturaCaixa in 'UFrmAberturaCaixa.pas' {FrmAbreCaixa},
  UFrmConsCliente in 'UFrmConsCliente.pas' {FrmConsCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmConsProduto, FrmConsProduto);
  Application.CreateForm(TFrrmLogin, FrrmLogin);
  Application.CreateForm(TFrmAbreCaixa, FrmAbreCaixa);
  Application.CreateForm(TFrmConsCliente, FrmConsCliente);
  Application.Run;
end.
