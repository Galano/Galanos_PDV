program ConsultaCaixas;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {frmConsultaCaixas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConsultaCaixas, frmConsultaCaixas);
  Application.Run;
end.
