program ProjetoFinal;

uses
  Vcl.Forms,
  FormPrincipal in 'Forms\FormPrincipal.pas' {frmPrincipal},
  DataModule in 'Forms\DataModule.pas' {Dm: TDataModule},
  FormCadClientes in 'Forms\FormCadClientes.pas' {frmCadClientes},
  FormAgendamentos in 'Forms\FormAgendamentos.pas' {frmAgendamentos},
  FormAgendaAux in 'Forms\FormAgendaAux.pas' {frmAgendaAux};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
