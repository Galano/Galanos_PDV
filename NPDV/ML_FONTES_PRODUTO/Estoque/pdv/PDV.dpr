program PDV;

uses
  Forms,
  UVendas in 'UVendas.pas' {FrmVendas},
  UDm in 'UDm.pas' {DmDados: TDataModule},
  UFrmConsCliente in 'UFrmConsCliente.pas' {FrmConsCliente},
  UFrmConsProduto in 'UFrmConsProduto.pas' {FrmConsProduto},
  UFrmCupom in 'UFrmCupom.pas' {FrmCupom},
  UfrmLogin in 'UfrmLogin.pas' {FrrmLogin},
  UFrmAberturaCaixa in 'UFrmAberturaCaixa.pas' {FrmAbreCaixa},
  untImpressao in 'untImpressao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmConsCliente, FrmConsCliente);
  Application.CreateForm(TFrmConsProduto, FrmConsProduto);
  Application.CreateForm(TFrmCupom, FrmCupom);
  Application.Run;
end.