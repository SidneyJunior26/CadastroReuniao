unit FormCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadClientes = class(TForm)
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
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
    pnCadastro: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AtivarDesativaBotoes;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses DataModule;

procedure TfrmCadClientes.AtivarDesativaBotoes;
begin
  if Dm.TblClientes.State in [dsEdit,dsInsert] then
    begin
      btnSalvar.Enabled   := True;
      btnCancelar.Enabled := True;
      pnCadastro.Enabled  := True;
      btnNovo.Enabled     := False;
      btnEditar.Enabled   := False;
      btnExcluir.Enabled  := False;
      btnFechar.Enabled   := False;
    end
    else
      begin
        btnSalvar.Enabled   := False;
        btnCancelar.Enabled := False;
        pnCadastro.Enabled  := False;
        btnNovo.Enabled     := True;
        btnEditar.Enabled   := True;
        btnExcluir.Enabled  := True;
        btnFechar.Enabled   := True;
      end;

end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  dm.TblClientes.Cancel;

  AtivarDesativaBotoes;
end;

procedure TfrmCadClientes.btnEditarClick(Sender: TObject);
begin
  dm.TblClientes.Edit;

  AtivarDesativaBotoes;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do cliente atual?',mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      dm.TblClientes.Delete;
      ShowMessage('Cadastro Excluído!');
      AtivarDesativaBotoes;
    end;

end;

procedure TfrmCadClientes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  dm.TblClientes.Append;

  AtivarDesativaBotoes;
end;

procedure TfrmCadClientes.btnSalvarClick(Sender: TObject);
begin
  dm.TblClientes.Post;

  AtivarDesativaBotoes;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.TblClientes.Active := False;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  Dm.TblClientes.Active := True;
end;

end.
