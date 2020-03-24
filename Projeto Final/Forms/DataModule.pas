unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef;

type
  TDm = class(TDataModule)
    cdsAgenda: TClientDataSet;
    cdsAgendaCODINT: TIntegerField;
    cdsAgendaASSUNTO: TStringField;
    cdsAgendaDESCRICAO: TStringField;
    cdsAgendaDATA: TDateTimeField;
    cdsAgendaCLIENTE: TStringField;
    fdConexao: TFDConnection;
    TblClientes: TFDQuery;
    TblClientesCODINT: TIntegerField;
    TblClientesAPELIDO: TStringField;
    TblClientesRAZAOSOCIAL: TStringField;
    TblClientesENDERECO: TStringField;
    TblClientesCNPJCPF: TStringField;
    DsClientes: TDataSource;
    DsAgenda: TDataSource;
    cdsAuxiliar: TClientDataSet;
    cdsAuxiliarCODINT: TIntegerField;
    cdsAuxiliarASSUNTO: TStringField;
    cdsAuxiliarDESCRICAO: TStringField;
    cdsAuxiliarDATA: TDateTimeField;
    cdsAuxiliarCLIENTE: TStringField;
    DsAuxiliar: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarCodigoAgenda: Integer;
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDm }

function TDm.GerarCodigoAgenda: Integer;
begin
  cdsAuxiliar.LoadFromFile('C:\Users\sidne\OneDrive - Fatec Centro Paula Souza\Cursos\TreinaWeb\Delphi\Projeto Final\Banco de Dados\Agenda.cds');
  cdsAuxiliar.Active := True;

  cdsAuxiliar.Last;
  Result := cdsAuxiliar.FieldByName('CODINT').AsInteger;

  cdsAuxiliar.Active := False;
end;

end.
