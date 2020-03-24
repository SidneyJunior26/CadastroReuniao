unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    Agendamentos1: TMenuItem;
    procedure CadastrodeClientes1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses FormCadClientes, DataModule, FormAgendamentos;

procedure TfrmPrincipal.Agendamentos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAgendamentos, frmAgendamentos);
    frmAgendamentos.ShowModal;
  finally
    FreeAndNil(frmAgendamentos);
  end;
end;

procedure TfrmPrincipal.CadastrodeClientes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadClientes, frmCadClientes);
    frmCadClientes.ShowModal;
  finally
    FreeAndNil(frmCadClientes);
  end;
end;

end.
