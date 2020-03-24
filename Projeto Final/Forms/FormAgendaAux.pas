unit FormAgendaAux;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmAgendaAux = class(TForm)
    DBGrid1: TDBGrid;
    dstClientes: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    dstAgenda: TDataSource;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaAux: TfrmAgendaAux;

implementation

{$R *.dfm}

uses DataModule;

procedure TfrmAgendaAux.btnFecharClick(Sender: TObject);
begin
  Dm.cdsAgenda.Cancel;
  Close;
end;

procedure TfrmAgendaAux.btnSalvarClick(Sender: TObject);
begin
  if Dm.cdsAgendaDATA.AsDateTime < Date then
    MessageDlg('A data n�o pode ser inferior a data atual', mtWarning, [mbOK],0)
  else
    begin
      Dm.cdsAgenda.FieldByName('CLIENTE').AsString := Dm.TblClientes.FieldByName('RAZAOSOCIAL').AsString;
      Dm.cdsAgenda.Post;
      Dm.cdsAgenda.SaveToFile('C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Cursos\TreinaWeb\Delphi\Projeto Final\Banco de Dados\Agenda.cds');
      Close;
    end;
end;

procedure TfrmAgendaAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.TblClientes.Active := False;
end;

procedure TfrmAgendaAux.FormCreate(Sender: TObject);
begin
  Dm.TblClientes.Active := True;
end;

end.