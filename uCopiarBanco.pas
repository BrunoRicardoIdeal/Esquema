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
   CaminhoBancoNovo : String;
   procedure ExtrairMetaDados;
   procedure CriarDataBaseNovo;
   procedure Init;
   procedure ConectarBancoNovo;
   procedure ConectarBancoAntigo;
   constructor Create;
 private
   var
    ArquivoSQLMeta : TStringList;

  function AddAspaDuplas(Str : String):String;
  procedure EditaMetaData;



End;


implementation

uses
  System.SysUtils, Winapi.Windows, ShellApi, uDmPrincipal, FireDAC.Comp.Client, uFrmPrincipal,
  Vcl.Forms, Vcl.Dialogs,uFuncoes;

{ TCopiarBanco }

{$R Recurso.RES}

function TCopiarBanco.AddAspaDuplas(Str: String):String;
begin
 Result := '"' + str + '"';
end;

procedure TCopiarBanco.ConectarBancoNovo;
var
 i,j : Integer;
 SubScript : TStringList;
 posIni,posFim : Integer;
begin
  dmPrincipal.CONEXAO_NOVO.Params.Clear;
  dmPrincipal.CONEXAO_NOVO.Params.Add('Database='+ExtractFilePath(application.exeName)+CaminhoBancoNovo);
  dmPrincipal.CONEXAO_NOVO.Params.Add('user_name='+Usuario);
  dmPrincipal.CONEXAO_NOVO.Params.Add('password='+Senha);
  dmPrincipal.CONEXAO_NOVO.Params.Add('DriverID=FB');
  dmPrincipal.CONEXAO_NOVO.Open();

 SubScript := TStringList.Create;
 posIni := 0;
 posFim := 0;
 frmPrincipal.pbProcessamento.Min := 0;
 frmPrincipal.pbProcessamento.Max := ArquivoSQLMeta.Count;
 try
  for i := 0 to ArquivoSQLMeta.Count - 1 do
  begin
   frmPrincipal.pbProcessamento.Position := i;
   if ArquivoSQLMeta[i].Contains(';') then
   begin
     posFim := i;

     for j := posIni to posFim do
     begin
       SubScript.Add(ArquivoSQLMeta[j]);
     end;

     posIni := posFim + 1;

     dmPrincipal.qryExecutaSQL.SQL := SubScript;
     dmPrincipal.CONEXAO_NOVO.StartTransaction;
     dmPrincipal.qryExecutaSQL.ExecSQL;
     dmPrincipal.CONEXAO_NOVO.Commit;

     SubScript.Clear;
   end;

  end;
 finally
   SubScript.Free;
 end;

end;

procedure TCopiarBanco.ConectarBancoAntigo;
begin
  dmPrincipal.CONEXAO.Params.Clear;
  dmPrincipal.CONEXAO.Params.Add('Database='+frmPrincipal.edtCaminhoBanco.Text);
  dmPrincipal.CONEXAO.Params.Add('user_name='+Usuario);
  dmPrincipal.CONEXAO.Params.Add('password='+Senha);
  dmPrincipal.CONEXAO.Params.Add('DriverID=FB');
  dmPrincipal.CONEXAO.Open();

end;

constructor TCopiarBanco.Create;
begin
 ArquivoSQLMeta := TStringList.Create;
end;

procedure TCopiarBanco.CriarDataBaseNovo;
var
Res: TResourceStream; // classe para manipular recurso.
PathFile: String; // onde sera salvo o arquivo.
begin
 PathFile := CaminhoBancoNovo;
 Res := TResourceStream.Create(HInstance,'BANCONOVO','IBFILE');
 try
 Res.SaveToFile(PathFile); // salva o arquivo no diretorio.
 finally
 Res.Free; // libera da memoria o objeto
 end;
end;

procedure TCopiarBanco.EditaMetaData;
var
 i,j : integer;
 novoCount : Integer;
 total : integer;
 SubScript : tstringList;
 posIni, posFim : Integer;
 numScript : integer;
begin
 ArquivoSQLMeta.Delete(ArquivoSQLMeta.IndexOf('SET SQL DIALECT 3; '));
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

 ArquivoSQLMeta.SaveToFile(CaminhoMetaDAta);
end;

procedure TCopiarBanco.ExtrairMetaDados;
var
 funcoes : TFuncoes;
 Parametros : String;
 Handle : tHandle;
 comando : PAnsiChar;
begin
 if FileExists(CaminhoMetaData) then
  begin
     DeleteFile(PChar(CaminhoMetaData));
  end;

 if fileExists(CaminhoBanco) then
 begin
  Parametros :=  ' -extract -o ' + AddAspaDuplas(CaminhoMetaDAta) + '  ' + AddAspaDuplas(CaminhoBanco)
                              + ' -u '+ Usuario  +  ' -p ' + senha;
  funcoes := TFuncoes.Create;

  try
   funcoes.ShellExecuteAndWait('open', CaminhoIsql , Parametros, '', SW_SHOW, True);
  finally
    funcoes.Free;
  end;

 end;
 if FileExists(CaminhoMetaDAta) then
 begin
  ArquivoSQLMeta.LoadFromFile(CaminhoMetaDAta);
  EditaMetaData;
 end;

end;

procedure TCopiarBanco.Init;
begin
 if CaminhoMetaData = EmptyStr then
 begin
   CaminhoMetaData := 'metadata.sql';
 end;
 CaminhoBancoNovo :=  'BANCO_NOVO.IB';
 CaminhoISQl := AddAspaDuplas(CaminhoIsql);
 ExtrairMetaDados;
 CriarDataBaseNovo;
 ConectarBancoNovo;

end;

end.
