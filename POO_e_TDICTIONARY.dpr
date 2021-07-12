program POO_e_TDICTIONARY;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  classe.Nota in 'classe.Nota.pas',
  classe.ItemNota in 'classe.ItemNota.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
