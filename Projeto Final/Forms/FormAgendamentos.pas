unit FormAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAgendamentos = class(TForm)
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    pnDados: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

{$R *.dfm}

uses DataModule, FormAgendaAux;

procedure TfrmAgendamentos.btnEditarClick(Sender: TObject);
begin
  Dm.cdsAgenda.Edit;

  try
    Application.CreateForm(TfrmAgendaAux, frmAgendaAux);
    frmAgendaAux.ShowModal;
  finally
    FreeAndNil(frmAgendaAux);
  end;
end;

procedure TfrmAgendamentos.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclus�o deste agendamento?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      Dm.cdsAgenda.Delete;
      Dm.cdsAgenda.SaveToFile('C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Cursos\TreinaWeb\Delphi\Projeto Final\Banco de Dados\Agenda.cds');
      ShowMessage('Agendamento exclu�do!');
    end;

end;

procedure TfrmAgendamentos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgendamentos.btnNovoClick(Sender: TObject);
begin
  Dm.cdsAgenda.Append;
  Dm.cdsAgenda.FieldByName('DATA').AsDateTime   := Now;
  Dm.cdsAgenda.FieldByName('CODINT').AsInteger := Dm.GerarCodigoAgenda + 1;

  try
    Application.CreateForm(TfrmAgendaAux, frmAgendaAux);
    frmAgendaAux.ShowModal;
  finally
    FreeAndNil(frmAgendaAux);
  end;
end;

procedure TfrmAgendamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.cdsAgenda.SaveToFile('C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Cursos\TreinaWeb\Delphi\Projeto Final\Banco de Dados\Agenda.cds');
  Dm.cdsAgenda.Active := False;
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  Dm.cdsAgenda.LoadFromFile('C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Cursos\TreinaWeb\Delphi\Projeto Final\Banco de Dados\Agenda.cds');
  Dm.cdsAgenda.Active := True;
end;

end.
