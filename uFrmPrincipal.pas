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
    procedure btnExecutarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  uCopiarBanco;


procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
var
 CopiaBanco : TCopiarBanco;
begin
  CopiaBanco                 := TCopiarBanco.Create;
  CopiaBanco.CaminhoBanco    := edtCaminhoBanco.Text;
  CopiaBanco.Usuario         := edtUsuario.Text;
  CopiaBanco.Senha           := edtSenha.Text;
  CopiaBanco.CaminhoMetaData := 'Metadata.sql';
  CopiaBanco.Init;
  CopiaBanco.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 edtUsuario.Text := 'HOJETEC';
 edtSenha.Text := 'systemby';
end;

end.