unit uCopiarBanco;




interface

uses
  System.Classes;

type TCopiarBanco = Class(TObject)

 public
  var
   CaminhoBanco : String;
   Usuario      : String;
   Senha        : String;
   CaminhoMetaData : String;
   CaminhoiSQL :String;
   procedure ExtrairMetaDados;
   procedure CriarDataBaseNovo;
   procedure Init;
   constructor Create;
 private
   var
    ArquivoSQLMeta : TStringList;
    CaminhoBancoNovo : String;
  function AddAspaDuplas(Str : String):String;
  procedure EditaMetaData;



End;


implementation

uses
  System.SysUtils, Winapi.Windows, ShellApi, uDmPrincipal, FireDAC.Comp.Client;

{ TCopiarBanco }

function TCopiarBanco.AddAspaDuplas(Str: String):String;
begin
 Result := '"' + str + '"';
end;

constructor TCopiarBanco.Create;
begin
 ArquivoSQLMeta := TStringList.Create;
end;

procedure TCopiarBanco.CriarDataBaseNovo;
begin

end;

procedure TCopiarBanco.EditaMetaData;
var
 i,j : integer;
 novoCount : Integer;
 total : integer;
begin
 novoCount := ArquivoSQLMeta.Count;
 for i := 0 to novoCount - 1 do
 begin
  if UpperCase(ArquivoSQLMeta[i]).Contains('INDEX') then
  begin
   total := i;
   while(total < ArquivoSQLMeta.count-1) do
   begin
    ArquivoSQLMeta.delete(ArquivoSQLMeta.count-1);
   end;
   Break;
  end;

 end;
 ArquivoSQLMeta.SaveToFile(CaminhoMetaData);
end;

procedure TCopiarBanco.ExtrairMetaDados;
var

 Parametros : String;
 Handle : tHandle;
begin
 if fileExists(CaminhoBanco) then
 begin
  Parametros :=  ' -extract -o ' + AddAspaDuplas(CaminhoMetaDAta) + '  ' + AddAspaDuplas(CaminhoBanco)
                              + ' -u '+ Usuario  +  ' -p ' + senha;
  if FileExists(CaminhoMetaData) then
  begin
     DeleteFile(PChar(CaminhoMetaData));
  end;

  ShellExecute(Handle, 'open', pChar(CaminhoISQl),Pchar(Parametros),'',SW_HIDE);
 end;
 if FileExists(CaminhoMetaData) then
 begin
  ArquivoSQLMeta.LoadFromFile(CaminhoMetaData);
  EditaMetaData;
 end;

end;

procedure TCopiarBanco.Init;
begin
 if CaminhoMetaData = EmptyStr then
 begin
   CaminhoMetaData := 'metadata.sql';
 end;
 CaminhoBancoNovo :=  'CA2_bkp_BD.IB';
 CaminhoISQl := AddAspaDuplas(CaminhoIsql);

 ExtrairMetaDados;
 CriarDataBaseNovo;

end;

end.
