program ServicoImpressao;

uses
  midaslib,
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  frmPrincipal in 'frmPrincipal.pas' {FPrincipal},
  uServerMethods in 'uServerMethods.pas',
  uServerContainer in 'uServerContainer.pas' {ServerContainer: TDataModule},
  DMPrincipal in 'DMPrincipal.pas' {DMPrimcipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TDMPrimcipal, DMPrimcipal);
  Application.Run;
end.

