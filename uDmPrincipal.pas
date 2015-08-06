unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.Oracle, IBDatabase,
  FireDAC.Comp.ScriptCommands, FireDAC.Comp.Script, FireDAC.Comp.DataMove,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,ufrmPrincipal;

type
  TdmPrincipal = class(TDataModule)
    CONEXAO: TFDConnection;
    qryTabelaAntiga: TFDQuery;
    CONEXAO_NOVO: TFDConnection;
    qryTabelas: TFDQuery;
    qryTabelaNova: TFDQuery;
    fdphysfbdrvrlnk1: TFDPhysFBDriverLink;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    qryExecutaSQL: TFDQuery;
    FDScripts: TFDScript;
    fdDataMove: TFDDataMove;
    procedure qryExecutaSQLBeforeExecute(DataSet: TFDDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.qryExecutaSQLBeforeExecute(DataSet: TFDDataSet);
begin
 frmPrincipal.MemoExecucao.Text := qryExecutaSQL.SQL.Text;
 frmPrincipal.Repaint;
 Application.ProcessMessages;
 end;

end.
