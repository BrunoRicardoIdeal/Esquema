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
   constructor Create(estado : Integer; lista : TStrings);
 private
   var
    Tabelas : TStrings;
    estado : Integer;



End;


implementation

uses
  System.SysUtils, Winapi.Windows, ShellApi, uDmPrincipal, FireDAC.Comp.Client;

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
      end;
    end;

    if estado = EXCLUIR then
    begin
      for exclusao in Tabelas_Parametro do
        begin
          Tabelas.Delete(Tabelas.IndexOf(exclusao));   ok
        end;
    end;
  end;

end;

constructor TCopiarDados.Create(estado : Integer; lista : TStrings);
begin
  Self.estado := estado;
  Self.Tabelas_Parametro := lista;
end;

end.
