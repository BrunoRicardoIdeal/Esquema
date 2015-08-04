unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlFrundo: TPanel;
    Label1: TLabel;
    edtCaminhoBanco: TEdit;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    lblSenha: TLabel;
    pnlBotoes: TPanel;
    btnExecutar: TButton;
    Label4: TLabel;
    edtCaminhoIsql: TEdit;
    mmoTables: TMemo;
    lbl1: TLabel;
    btnMudaEstado: TButton;
    lblProcesso: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMudaEstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


 uses
  uCopiarBanco, uCopiarDados;


procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
var
 CopiaBanco : TCopiarBanco;
 CopiaDados : TCopiarDados;
 estado     : Integer;
begin
 try
  CopiaBanco                 := TCopiarBanco.Create;
  if FileExists(edtCaminhoBanco.Text) then
  begin
  CopiaBanco.CaminhoBanco    := edtCaminhoBanco.Text;
  end
  else
  begin
   MessageDlg('É inválido o caminho do banco de origem!', mtWarning, [mbOK], 0);
   Exit;
  end;
  CopiaBanco.Usuario         := edtUsuario.Text;
  CopiaBanco.Senha           := edtSenha.Text;
  CopiaBanco.CaminhoMetaData := ExtractFilePath(Application.ExeName)+'Metadata.sql';
  if FileExists(edtCaminhoIsql.Text) then
  begin
   CopiaBanco.CaminhoiSQL     := edtCaminhoIsql.Text;
  end
  else
  begin
    MessageDlg('É inválido o caminho do executável isql! ', mtWarning, [mbOK], 0);
    Exit;
  end;
  lblProcesso.Visible := True;
  lblProcesso.Caption := 'Conectando com o banco de origem...';
  CopiaBanco.ConectarBancoAntigo;
  lblProcesso.Caption := 'Extraindo metadados e criando o banco novo...';
  CopiaBanco.Init;
 finally
  CopiaBanco.Free;
 end;


   if mmoTables.Lines.Count = 0 then
  begin
    estado := 0;
  end
  else
  begin
    if btnMudaEstado.Caption = 'Incluídas' then
    begin
      estado := 1;
    end
    else
    if btnMudaEstado.Caption = 'Excluídas' then
    begin
      estado := 2;
    end;
  end;
  lblProcesso := 'Carregando as tabelas a serem copiadas...';
  try
   CopiaDados                 := TCopiarDados.Create(estado, mmoTables.Lines);
   CopiaDados.CarregarTabelas;
   lblProcesso.Caption := 'Transferindo os dados...';
   CopiaDados.Transfere;
  finally
    CopiaDados.Free;
  end;

  lblProcesso.Caption := 'Processo concluído!';

  Self.Close;
end;

procedure TfrmPrincipal.btnMudaEstadoClick(Sender: TObject);
begin
  if btnMudaEstado.Caption = 'Incluídas' then
  begin
    btnMudaEstado.Caption := 'Excluídas';
  end
  else
  begin
    btnMudaEstado.Caption := 'Incluídas';
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 edtUsuario.Text := 'HOJETEC';
 edtSenha.Text := 'systemby';
 edtCaminhoIsql.text := 'C:\Program Files\Firebird\Firebird_2_5\bin\isql.exe';
 lblProcesso.Visible := False;
end;

end.
