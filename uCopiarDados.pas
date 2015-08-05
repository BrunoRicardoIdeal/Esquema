unit uCopiarDados;




interface

uses
  System.Classes;

type TCopiarDados = Class(TObject)

 public
  const
   TOTAL   : Integer = 0;
   INCLUIR : Integer = 1;
   EXCLUIR : Integer = 2;
  var
   Tabelas_Parametro : TStrings;
   procedure CarregarTabelas;
   procedure Transfere;
   constructor Create(estado : Integer; lista : TStrings);
 private
   var
    Tabelas : TStrings;
    estado : Integer;



End;


implementation

uses
  System.SysUtils, Winapi.Windows, ShellApi, uDmPrincipal, FireDAC.Comp.Client,
  Vcl.Forms, uFrmPrincipal, uCopiarBanco;

{ TCopiarDados }

{ TCopiarDados }

procedure TCopiarDados.CarregarTabelas;
var
  exclusao : string;
begin
  if estado = INCLUIR then
  begin
    Tabelas := Tabelas_Parametro;
  end
  else
  begin
    Tabelas := TStringList.Create;
    dmPrincipal.qryTabelas.Open();
    if not dmPrincipal.qryTabelas.IsEmpty then
    begin
      dmPrincipal.qryTabelas.First;
      while not dmPrincipal.qryTabelas.eof do
      begin
        Tabelas.Add(dmPrincipal.qryTabelas.FieldByName('tabela').AsString);
        dmPrincipal.qryTabelas.Next;
      end;
    end;

    if estado = EXCLUIR then
    begin
      for exclusao in Tabelas_Parametro do
        begin
          if Tabelas.IndexOf(exclusao) > 0  then
          begin
           Tabelas.Delete(Tabelas.IndexOf(exclusao));
          end;
        end;
    end;
  end;

end;

constructor TCopiarDados.Create(estado : Integer; lista : TStrings);
begin
  Self.estado := estado;
  Self.Tabelas_Parametro := lista;
end;

procedure TCopiarDados.Transfere;
var
  tabela : string;
  i : Integer;
begin
  dmPrincipal.CONEXAO_NOVO.RefreshMetadataCache;
  for tabela in Tabelas do
  begin

    dmPrincipal.qryTabelaNova.Close;
    dmPrincipal.qryTabelaNova.SQL.Clear;
    dmPrincipal.qryTabelaNova.SQL.Add('select * from '+ tabela);
    dmPrincipal.qryTabelaNova.Open();

    dmPrincipal.qryTabelaAntiga.Close;
    dmPrincipal.qryTabelaAntiga.SQL.Clear;
    dmPrincipal.qryTabelaAntiga.SQL.Add('select * from '+tabela);
    dmPrincipal.qryTabelaAntiga.Open();


    if not dmPrincipal.qryTabelaAntiga.IsEmpty then
    begin
      dmPrincipal.qryTabelaAntiga.First;
      while not dmPrincipal.qryTabelaAntiga.Eof do
      begin
        dmPrincipal.qryTabelaNova.Append;
        for i := 0 to dmPrincipal.qryTabelaAntiga.Fields.Count-1 do
        begin
          dmPrincipal.qryTabelaNova.Fields[i].Value := dmPrincipal.qryTabelaAntiga.Fields[i].Value;
        end;
        dmPrincipal.qryTabelaAntiga.Next;
      end;
      dmPrincipal.qryTabelaNova.Post;
    end;

  end;


end;

end.
