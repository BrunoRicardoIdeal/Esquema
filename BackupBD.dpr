program BackupBD;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uCopiarBanco in 'uCopiarBanco.pas',
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uCopiarDados in 'uCopiarDados.pas',
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
