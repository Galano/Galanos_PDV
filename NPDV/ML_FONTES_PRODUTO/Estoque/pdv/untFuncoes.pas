unit untFuncoes;

Interface

  Uses Windows, Messages, System.SysUtils, Classes, Graphics, Dialogs, IniFiles, Db, DbTables,
     DBIProcs, Forms, StdCtrls, ComCtrls, Mask, DBCtrls, ExtCtrls, Controls, JvComponent,
     JvBaseDlg, JvProgressDialog, JvEdit, JvValidateEdit;


   {Arquivo INI}
   Function  LeIniStr( Const cArquivo, cSecao, cIdent, cDefault: String):String;
   Function  LeIniBool( Const cArquivo, cSecao, cIdent: String; Const lDefault: Boolean):Boolean;
   Procedure GrIniStr( Const cArquivo, cSecao, cIdent, cValor: String);
   Procedure GrIniBool( Const cArquivo, cSecao, cIdent: String; Const cValor:Boolean);

   {Strings}
   Function  Replicate( Const cTexto: String; Const nQtd: Integer ):String;
   Function  Empty( Const cTexto: String ):Boolean;
   Function  Right( Const cTexto: String; Const nQtde: Integer ):String;
   Function  ParteTexto(Frase: string; Parte: string): string;
   Function  BuscaTroca(Text,Busca,Troca : string) : string;
   Function  AjustaStr ( str: String; tam: Integer ): String;
   Function  Padl(s:string;n:integer):string;{alinha uma string à esquerda}
   Function  Padr(s:string;n:integer):string;{alinha uma string à direita}

   Function  Criptografia(mStr, mChave: string): string;
   Function  ContaCaracs(Edit:String): integer; {Retorna quantos caracteres tem um Edit especificado}
   Function  Alltrim(const Search: string): string; {Remove os espaços em branco de ambos os lados da string}

   {Arquivos}
   //Procedure DeletaArquivos(vMasc:String);
   Procedure DirList( ASource : string; ADirList :TStringList );
   Function  NumLinhasArq(Arqtexto:String): integer; { Retorna o número de linhas que um arquivo possui }

   {Data e Hora}
   //Function DifHora(Inicio,Fim : String):Integer;
   Function  DifHora(Inicio,Fim : String):String;
   Function  ProximoDiaUtil(dData : TDateTime):TDateTime;
   Function  UltDiaDoMes(Data: TDateTime): Word;
   Function  IncrementaMes(dData : TDateTime; nQtdMes: Integer):TDateTime;
   Function  AtribuiDia(dData : TDateTime; nDiaAtr: Word ):TDateTime;

   {Diversos}
   Procedure TeclaEnter( Formulario: Tform; Var Key: Char );
   Function  FormataRealString(rValor : Real): string;
   Function  PadC(S:string;Len:byte):string;
   Procedure EscondeTaskBar(Visible: Boolean); { ESCONDE BARRA DE TAREFA }
   Procedure Say(Nlin,Ncol: Integer;Var LinhaAtual: Integer; Var Arquivo: Text;Texto: Variant);
   { Function Confirmar(Mensagem: string; Botao: Byte): Boolean; }

   //Function Senha(lTipo:Boolean): Boolean;
   Function  StrZero(Zeros:string;Quant:integer):String;
   Function  StrCaracter(Zeros,caracter:string;Quant:integer):String;

   //Function FormataRealString(rValor : Real): string;

   { Tratamento do Form }
   Procedure MudaCor( Var Sender: TObject; Tipo: Char);

   { Trabalhar com impressoes }
   Function  IniciaImpressao():Boolean;
   Procedure FimImpressao();

   { Datas e horas }
   Function  HoraToMin(Hora: String): Integer; { Converte Horas para Minutos }
   Function  SubData(DataInicio,DataFim: TDate):String; { Subtração de Datas, retorna Dias }
   Function  Permanencia(DataInicio,DataFim:TDate;HoraInicio,HoraFim:string):TStringList;

   { Função para tratamento de erro }
   Procedure ManipulaErro (Sender: TObject; E: Exception);

   { Finalidade Mover o  Painel na Tela do Form }
   Procedure MovePainel(sNome : TPanel; Lado, Topo : Integer);

   { Caixa de progresso }
   Procedure DialogoProgressoInicio(nMaximo :Integer; sCabecalho :string );
   Procedure DialogoProgressoAtualiza(nNumero : Integer);

   //Procedure MostraMensagem(sMensagem:string);
   Function  Gerapercentual(valor:real;Percent:Real):real;
   Function  Justifica(mCad:string;mMAx:integer):string;
   Function  Centraliza( vTexto : String; vTam : Real) : String;
   //Retornar a data para
   Function  CovDataBanco(Data:TDateTime):string;
   Procedure AtualizaDados ( nomeDoArquivo: String );

   //Geração de Relatorios
   procedure InicializaRelatorio(sNome:string);
   procedure AddRelatorio(sTexto:string);
   procedure FinalizaRelatorio(Hora: TDateTime);

   Function  MesExtenso( Mes:Word ) : string;
   Function  Mes(Data:TDateTime):string;
   Function  VerPermissaoUsuario(idUsuario,idModulo:Integer):Boolean;
   Function  SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
   Procedure ExecutaForm(FormClass: TFormClass; var Reference);
   function  ValidaData(sData:string):Boolean;

   function  SenhaDia(sSenhaEntrada,hora:string):Boolean;
   function  Is4DigitYear: Boolean;
   function Codifica(const Str1: String): String;

   Function  IIF(Condicao:Boolean; retornaTrue, retornaFalse:Variant):Variant;

   Procedure PercorreArquivoTexto(nomeDoArquivo:String;lCodificado:Boolean);
   Procedure GravaArquivoTexto(nomeDoArquivo:String;lCodificado:Boolean);

   //Verifica se uma determinada versão do sistema e trial
   Procedure VerSistemaTrial;
   Procedure GravaVersaoTrial;


implementation

uses untDm, untFrmRelatorios; //untMensagem, untSenha;

const
  crMyCursor = 5;

Var
 //Variaveis de apoio do sistema
 Progresso : TJvProgressDialog;

{**************************************************************************
 ***** Finalidade: Lê Arquivo INI - Variáveis String                  *****
 **************************************************************************}
Function LeIniStr( Const cArquivo, cSecao, cIdent, cDefault: String):String;
Var
   cArqIni: TIniFile;
begin
   Try
      IF Not FileExists( cArquivo ) Then
      Begin
         MessageDlg( 'Arquivo Inexistente: '#10 + cArquivo, mtWarning, [mbOk], 0 );
         Result:= cDefault;
         Exit;
      End;

      cArqIni:= TIniFile.Create( cArquivo );
      Result:= cArqIni.ReadString( cSecao, cIdent, cDefault );
      cArqIni.Free;
   Except
      Result:= cDefault;
   End;
end;

{**************************************************************************
 ***** Finalidade: Lê Arquivo INI - Variáveis Boolean                 *****
 **************************************************************************}
Function LeIniBool( Const cArquivo, cSecao, cIdent: String; Const lDefault: Boolean):Boolean;
Var
   cArqIni: TIniFile;
begin
   Try
      IF Not FileExists( cArquivo ) Then
      Begin
         MessageDlg( 'Arquivo Inexistente: '#10 + cArquivo, mtWarning, [mbOk], 0 );
         Result:= lDefault;
         Exit;
      End;

      cArqIni:= TIniFile.Create( cArquivo );
      Result:= cArqIni.ReadBool( cSecao, cIdent, lDefault );
      //Result:= cArqIni.ReadBool( codifica(cSecao), codifica(cIdent), lDefault);
      cArqIni.Free;
   Except
      Result:= lDefault;
   End;
end;

{**************************************************************************
 ***** Finalidade: Grava Arquivo INI - Variáveis String               *****
 **************************************************************************}
Procedure GrIniStr( Const cArquivo, cSecao, cIdent, cValor: String);
Var
   cArqIni: TIniFile;
begin
   IF Not FileExists( cArquivo ) Then
   Begin
      MessageDlg( 'Arquivo Inexistente: '#10 + cArquivo, mtWarning, [mbOk], 0 );
      Exit;
   End;

   cArqIni:= TIniFile.Create( cArquivo );
   cArqIni.WriteString( cSecao, cIdent, cValor );
   //cArqIni.WriteString( codifica(cSecao), codifica(cIdent), codifica(cValor) );
   cArqIni.Free;
end;

{**************************************************************************
 ***** Finalidade: Grava Arquivo INI - Variáveis Boolean              *****
 **************************************************************************}
Procedure GrIniBool( Const cArquivo, cSecao, cIdent: String; Const cValor:Boolean);
Var
   cArqIni: TIniFile;
begin
   IF Not FileExists( cArquivo ) Then
   Begin
      MessageDlg( 'Arquivo Inexistente: '#10 + cArquivo, mtWarning, [mbOk], 0 );
      Exit;
   End;

   cArqIni:= TIniFile.Create( cArquivo );
   cArqIni.WriteBool( cSecao, cIdent, cValor );
   //cArqIni.WriteBool( codifica(cSecao), codifica(cIdent), cValor );
   cArqIni.Free;
end;

{**************************************************************************
 ***** Finalidade: Retorna a repetição de um determinado              *****
 *****             Caracter/Texto conforme a quantidade especificada  *****
 **************************************************************************}
Function Replicate( Const cTexto: String; Const nQtd: Integer ):String;
Var
   nAux: Integer;
Begin
   Result:= '';

   IF nQtd > 0 Then
   Begin
      For nAux:= 1 To nQtd Do
          Result:= Result + cTexto;
   End;
End;

{**************************************************************************
 ***** Finalidade: Verifica se a String está vazia                    *****
 **************************************************************************}
Function Empty( Const cTexto: String ):Boolean;
Begin
   Result:= False;
   IF Trim( cTexto ) = '' Then
      Result:= True;
End;

{**************************************************************************
 ***** Finalidade: Retorna uma substring a partir da direita          *****
 **************************************************************************}
Function Right( Const cTexto: String; Const nQtde: Integer ):String;
Begin
   Result:= Copy( cTexto, Length( cTexto ) - nQtde + 1, nQtde );
End;

{**************************************************************************
 ***** Finalidade: Retorna uma parte de um texto antes de um caracter *****
 *****             especificado                                       *****
 **************************************************************************}
Function ParteTexto(Frase: string; Parte: string): string;
Var
   i,max: integer;
   Buff: string;
Begin
   i := 1;
   buff := '';
   max := length(parte);
   while (i <= length(Frase)) and (buff <> parte) do
   begin
      buff := buff + Frase[i];
      if length(buff) > max then
         buff := copy(buff,2,max);

      inc(i);
   end;
   if buff = Parte then
   begin
      Result := copy(Frase,1,i - max -1);
      Frase := copy(Frase,i,length(Frase)+1 -i);
   end
   else
   begin
      Result := Frase;
      Frase := '';
   end;
end;

{**************************************************************************
 ***** Finalidade: Substitui um texto dentro de uma String            *****
 **************************************************************************}
Function BuscaTroca(Text,Busca,Troca : string) : string;
var
   n : integer;
Begin
   For n := 1 To length(Text) Do
   Begin
      If Copy(Text,n,length(Busca)) = Busca then
      Begin
         Delete(Text,n,length(Busca));
         Insert(Troca,Text,n);
      End;
   End;
   Result := Text;
end;

{**************************************************************************
 ***** Finalidade: Deleta arquivos usando mascaras tipo: c:Temp*.zip, *****
 *****             c:Temp*.*                                          *****
 ***** Observação: Requer o Path dos arquivos a serem deletados       *****
 **************************************************************************}
//Procedure DeletaArquivos(vMasc:String);
//Var
   //Dir : TsearchRec;
   //Erro: Integer;
//Begin
   //Erro := FindFirst(vMasc,faArchive,Dir);
   //While Erro = 0 do Begin
   //   DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
   //   Erro := FindNext(Dir);
   //End;
   //FindClose(Dir);
//End;


{**************************************************************************
 ***** Finalidade: Pesquisa arquivos retornando-os em um StringList   *****
 *****             DirList('C:\*.bat',lista)                          *****
 **************************************************************************}
Procedure DirList( ASource : string; ADirList :TStringList );
Var
   SearchRec : TSearchRec;
   Result : integer;
Begin
   Result := FindFirst( ASource, faAnyFile, SearchRec );
   IF Result = 0 then
      While (Result = 0) do
      Begin
         IF (SearchRec.Name+' ')[1] = '.' Then
            { Se pegou nome de SubDiretorio }
         Begin
            Result:= FindNext( SearchRec );
            Continue;
         End;
         ADirList.Add( SearchRec.Name );
         Result := FindNext( SearchRec );
      End;
   FindClose( SearchRec );
   ADirList.Sort;
end;

{**************************************************************************
 ***** Finalidade: Verifica se o registro está travado.               *****
 **************************************************************************}
Function IsRecordLocked( Tabela: TTable ):Boolean;
Var
   Locked: BOOL;
   hCur:   hDBICur;
   rslt:   DBIResult;
Begin
   Tabela.UpdateCursorPos;

   Check( DbiIsRecordLocked( Tabela.Handle, Locked ) );
   Result:= Locked;

   IF Not Result Then
   Begin
      Check( DbiCloneCursor( Tabela.Handle, False, False, hCur ));
      Try
         rslt:= DbiGetRecord( hCur, dbiWRITELOCK, nil, nil );
         if rslt <> DBIERR_NONE Then
         Begin
            IF HiByte(rslt) = ERRCAT_LOCKCONFLICT Then
               Result:= True
            Else
               Check(rslt);
         End
         Else
            Check(DbiRelRecordLock( hCur, False ) );
      Finally
         Check( DbiCloseCursor(hCur) );
      End;
   End;
End;


{**************************************************************************
 ***** Finalidade: Retorna, em segundos, a diferença entre duas horas.*****
 **************************************************************************}
//Function DifHora(Inicio,Fim : String):Integer;
Function DifHora(Inicio,Fim : String):String;
Var
  FIni,FFim : TDateTime;
  cDif: String;
Begin
   Fini := StrTotime(Inicio);
   FFim := StrToTime(Fim);
   If (Inicio > Fim) then
   begin
      cDif := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
   end
   else
   begin
      cDif := TimeToStr(FFim-Fini);
   end;
   //Result:= StrToInt( Copy( cDif, 1, 2 ) ) * 3600 + //Consersão de Horas p/ Segundos
   //         StrToInt( Copy( cDif, 4, 2 ) ) *   60 + //Consersão de Minutos p/ Segundos
   //         StrToInt( Copy( cDif, 7, 2 ) );         //Segundos
   Result := cDif;
end;

{**************************************************************************
 ***** Finalidade: Retorna o próximo dia útil caso a data informada   *****
 *****             caia em um fim de semana.                          *****
 **************************************************************************}
Function ProximoDiaUtil(dData : TDateTime) : TDateTime;
Begin
   IF DayOfWeek(dData) = 7 Then
      dData := dData + 2
   Else IF DayOfWeek(dData) = 1 Then
      dData := dData + 1;

   Result := dData;
end;

{**************************************************************************
 ***** Finalidade: Retorna o último dia do mês de uma determinada data*****
 **************************************************************************}
Function UltDiaDoMes(Data: TDateTime): Word;
Var
   d,m,a: Word;
   dt: TDateTime;
Begin
   DecodeDate(Data, a,m,d);
   Inc(m);
   if m = 13 then
      m := 1;

   dt := EncodeDate(a,m,1);
   dt := dt - 1;
   DecodeDate(dt, a,m,d);
   Result := d;
End;


{**************************************************************************}
{***** Finalidade: Retorna o último dia do mês de uma determinada data*****}
{**************************************************************************}
Function CovDataBanco(Data:TDateTime):string;
Var
   d,m,a: Word;
Begin
   DecodeDate(Data, a,m,d);
   Result := IntToStr(m) + '/' + IntToStr(d) + '/' + IntToStr(a);
End;

{**************************************************************************}
{***** Finalidade: Retornar o mes por extenso de uma data             *****}
{**************************************************************************}
Function Mes(Data:TDateTime):string;
Var
   d,m,a: Word;
Begin
   DecodeDate(Data, a,m,d);

   Result := MesExtenso(m);
End;







{**************************************************************************
 ***** Finalidade: Incrementa um determinado número de mes em uma     *****
 *****             data.                                              *****
 **************************************************************************}
Function IncrementaMes(dData : TDateTime; nQtdMes: Integer):TDateTime;
Var
   nDia, nMes, nAno, nUltDiaMes: Word;
   nAux: Integer;
Begin
   DecodeDate( dData, nAno, nMes, nDia );

   For nAux:= 1 To nQtdMes Do
   Begin
      Inc(nMes);
      IF nMes = 13 Then
      Begin
         nMes:= 1;
         Inc(nAno);
      End;
   End;

   nUltDiaMes:= UltDiaDoMes( EncodeDate(nAno,nMes,1) );
   IF nDia > nUltDiaMes Then
      nDia:= nUltDiaMes;

   Result:= EncodeDate( nAno,nMes,nDia );
End;

{**************************************************************************
 ***** Finalidade: Atribui à força um dia a uma data                  *****
 **************************************************************************}
Function AtribuiDia(dData : TDateTime; nDiaAtr: Word ):TDateTime;
Var
   nDia, nMes, nAno, nUltDiaMes: Word;
Begin
   DecodeDate( dData, nAno, nMes, nDia );

   nUltDiaMes:= UltDiaDoMes( EncodeDate(nAno,nMes,1) );
   IF nDiaAtr > nUltDiaMes Then
      nDia:= nUltDiaMes
   Else
      nDia:= nDiaAtr;

   Result:= EncodeDate( nAno,nMes,nDia );
End;

{**************************************************************************
 ***** Finalidade: Emula a tecla TAB para que seja utilizado a tecla  *****
 *****             ENTER para mudar de campo                          *****
 **************************************************************************}
procedure TeclaEnter( Formulario: Tform; Var Key: Char );
begin
   IF key = #13 then
    begin
       key:= #0;
       SendMessage( Formulario.Handle, wm_nextdlgctl, 0, 0);
     End;
end;

{**************************************************************************}
{***** Finalidade: Receber um valor em real e devolver em string      *****}
{**************************************************************************}
Function FormataRealString(rValor : Real): string;
var
   ValorReal   : Real;
   ValorString : String;
Begin

   //ValorReal   := rValor;
   //ValorString := floattostrf(ValorReal,ffFixed,18,2);
   ValorReal   := rValor;
   ValorString := FormatFloat('#,###,###,##0.00',ValorReal);
   Result:= ValorString;
end;

{**************************************************************************}
{***** Finalidade: Centraliza uma string em um espaço determinado     *****}
{**************************************************************************}
function PadC(S:string;Len:byte):string;
var
 Str:String;
 L:byte;
begin
   str :='';
   if len < Length(s) then
     begin
        Result := '';
        Exit;
     end;
   l:=(Len-Length(S)) div 2;
   while l > 0 do
     begin
       str:=str+' ';
        dec(l);
     end;
   for l:=1 to length(S) do
     begin
      str := str+s[L];
     end;
   Result := str;
end;


{**************************************************************************}
{***** Finalidade: Converte uma variavel numérica em string           *****}
{**************************************************************************}
Function Strs(I:longint):string ;
Var
 X : string[16] ;
begin
  STR (I,X) ;
  Strs := X ;
end ;

{**************************************************************************}
{***** Finalidade: Insere Zeros à frente de uma string                *****}
{**************************************************************************}
function StrZero(Zeros:string;Quant:integer):String;
var
   I,Tamanho:integer;
   aux: string;
begin
   aux := zeros;
   Tamanho := length(ZEROS);
   ZEROS:='';
   for I:=1 to quant-tamanho do
      ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

{**************************************************************************}
{***** Finalidade: Insere Zeros à frente de uma string                *****}
{**************************************************************************}
function StrCaracter(Zeros,caracter:string;Quant:integer):String;
var
   I,Tamanho:integer;
   aux: string;
begin
   aux := zeros;
   Tamanho := length(ZEROS);
   ZEROS:='';
   for I:=1 to quant-tamanho do
      ZEROS:=ZEROS + caracter;
  aux := zeros + aux;
  StrCaracter := aux;
end;




{**************************************************************************}
{***** Finalidade: Devolcer a diferença entre duas horas              *****}
{**************************************************************************}
Function DiferencaEntraHoras(strHora1, strHora2 : String):String;
var
   hora1: TDateTime;
   hora2: TDateTime;
   total: TDateTime;
begin
   hora1 := StrToTime(strHora1);
   hora2 := StrToTime(strHora2);
   total := Hora2 - Hora1;
   Result:= FormatDateTime('hh:nn:ss',total);
end;

{**************************************************************************}
{***** Finalidade: Função para impressão de linhas em um relatório    *****}
{*****             Parecido com o Clipper                             *****}
{**************************************************************************}
{***** Modelo de como trabalhar                                       *****}
{**************************************************************************}
{*****      procedure TForm1.Button1Click(Sender: TObject);           *****}
{*****      var                                                       *****}
{*****      ArqPrn: TextFile;                                         *****}
{*****      LinhaAtual: Integer;                                      *****}
{*****      begin                                                     *****}
{*****      LinhaAtual:=0;                                            *****}
{*****      AssignFile(ArqPrn,'LPT1');                                *****}
{*****      ReWrite(ArqPrn);                                          *****}
{*****      Say(00,00,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(01,01,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(02,00,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(03,03,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(04,00,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(05,03,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(06,00,LinhaAtual,ArqPrn,'Wincomp Informática Ltda');  *****}
{*****      Say(07,04,LinhaAtual,ArqPrn,123456789);                   *****}
{*****      Say(08,00,LinhaAtual,ArqPrn,123456789);                   *****}
{*****      Say(09,00,LinhaAtual,ArqPrn,123456789);                   *****}
{*****      CloseFile(ArqPrn);                                        *****}
{*****      end;                                                      *****}
{**************************************************************************}
procedure Say(Nlin,Ncol: Integer;Var LinhaAtual: Integer; Var Arquivo: Text;Texto: Variant);
var
   X: Integer;
begin
   //Write(Arquivo,#13);
   If Nlin<>LinhaAtual then
      begin
         for X :=LinhaAtual to (Nlin-1) do
            begin
               WriteLn(Arquivo,'');
               LinhaAtual:=LinhaAtual+1;
            end;
      end;

   If Ncol>0 then
      begin
         For X:=0 to Ncol do
           begin
              Write(Arquivo,' ');
         end;
      end;
   Write(Arquivo,Texto);
end;

{**************************************************************************}
{***** Finalidade: Iniciar a impressão do Sistema                     *****}
{**************************************************************************}
function IniciaImpressao():Boolean;
begin
   Result:= True;
   Try
   	//AssignFile(ArqPrn,'LPT1');
		AssignFile(ArqPrn,sPortaImp);
    ReWrite(ArqPrn);
   except
      Result:= False;
   end;
end;

{**************************************************************************}
{***** Finalidade: Iniciar a impressão do Sistema                     *****}
{**************************************************************************}
procedure FimImpressao();
begin
	CloseFile(ArqPrn);
end;

{**************************************************************************}
{***** Finalidade: Esconder a Barra de Tarefas do Windows e ativar    *****}
{**************************************************************************}
procedure EscondeTaskBar(Visible: Boolean);
var
	wndHandle : THandle;
	wndClass : array[0..50] of Char;
begin
	StrPCopy(@wndClass[0],'Shell_TrayWnd');
	wndHandle := FindWindow(@wndClass[0], nil);
	If Visible=True Then
   	Begin
			ShowWindow(wndHandle, SW_RESTORE); {Mostra a barra de tarefas}
		End
   Else
   	Begin
			ShowWindow(wndHandle, SW_HIDE); {Esconde a barra de tarefas}
		End;
end;


{**************************************************************************}
{***** Finalidade: Chamar o formulario de mensagem                    *****}
{**************************************************************************}
{
Function Confirmar(Mensagem: string; Botao: Byte): Boolean;
begin
   Result:= TfrmConfirmar.Confirmar(Mensagem,Botao);
end;
}


{**************************************************************************}
{***** Finalidade: Chamar o formulario de Senha                       *****}
{**************************************************************************}
//Function Senha(lTipo:Boolean): Boolean;
//begin
//   Result:= TfrmSenha.Senha(lTipo);
//end;


{**************************************************************************}
{***** Finalidade: Mudar a Cor do Objeto Selecionado                  *****}
{**************************************************************************}
procedure MudaCor(var Sender: TObject; Tipo: Char);
Var
   CorEntrada: TColor;
begin
   CorEntrada:= clInfoBk;

   IF Sender.ClassType = TDBEdit Then
   Begin
      With Sender As TDBEdit Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
   Else IF Sender.ClassType = TEdit Then
   Begin
      With Sender As TEdit Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
   //Else IF Sender.ClassType = TComboEdit Then
   //Begin
   //   With Sender As TComboEdit Do
   //   Begin
   //      IF Tipo = 'E' Then
   //         Begin
   //            Color:= CorEntrada;
   //         End
   //      Else
   //         Begin
   //            Color:= clWindow;
   //         End
   //   End;
   //End
   //Else IF Sender.ClassType = TDateEdit Then
   //Begin
   //   With Sender As TDateEdit Do
   //   Begin
   //     IF Tipo = 'E' Then
   //         Begin
   //            Color:= CorEntrada;
   //         End
   //      Else
   //         Begin
   //            Color:= clWindow;
   //         End
   //   End;
   //End
   //Else IF Sender.ClassType = TCurrencyEdit Then
   //Begin
   //   With Sender As TCurrencyEdit Do
   //  Begin
   //      IF Tipo = 'E' Then
   //        Begin
   //            Color:= CorEntrada;
   //         End
   //      Else
   //         Begin
   //            Color:= clWindow;
   //         End
   //   End;
   //End
   Else IF Sender.ClassType = TComboBox Then
   Begin
      With Sender As TComboBox Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
   Else IF Sender.ClassType = TMemo Then
   Begin
      With Sender As TMemo Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
   Else IF Sender.ClassType = TDBLookupComboBox Then
   Begin
      With Sender As TDBLookupComboBox Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End;
         Refresh;
         rEPAINT;
      End;
   End
//   Else IF Sender.ClassType = TRxDBComboEdit Then
//   Begin
//      With Sender As TRxDBComboEdit Do
//     Begin
//         IF Tipo = 'E' Then
//            Begin
//               Color:= CorEntrada;
//            End
//         Else
//            Begin
//               Color:= clWindow;
//            End;
//         Refresh;
//         rEPAINT;
//      End;
//   End
   Else IF Sender.ClassType = TMaskEdit Then
   Begin
      With Sender As TMaskEdit Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End

   Else IF Sender.ClassType = TJvValidateEdit Then
   Begin
      With Sender As TJvValidateEdit Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
//   Else IF Sender.ClassType = TRxSpinEdit Then
//   Begin
//      With Sender As TRxSpinEdit Do
//      Begin
//        IF Tipo = 'E' Then
//            Begin
//               Color:= CorEntrada;
//            End
//         Else
//            Begin
//               Color:= clWindow;
//            End
//      End;
//   End
//   Else IF Sender.ClassType = TDirectoryEdit Then
//   Begin
//      With Sender As TDirectoryEdit Do
//      Begin
//         IF Tipo = 'E' Then
//            Begin
//               Color:= CorEntrada;
//            End
//         Else
//            Begin
//               Color:= clWindow;
//            End
//      End;
//   End
   Else IF Sender.ClassType = TLabeledEdit Then
   Begin
      With Sender As TLabeledEdit Do
      Begin
         IF Tipo = 'E' Then
            Begin
               Color:= CorEntrada;
            End
         Else
            Begin
               Color:= clWindow;
            End
      End;
   End
//   Else IF Sender.ClassType = TRxCalcEdit Then
//   Begin
//      With Sender As TRxCalcEdit Do
//      Begin
//         IF Tipo = 'E' Then
//            Begin
//               Color:= CorEntrada;
//            End
//         Else
//            Begin
//               Color:= clWindow;
//            End
//      End;
//   End
end;


{**************************************************************************}
{***** Finalidade: Crio o Formulario de Aguarde                       *****}
{**************************************************************************}
//procedure CarregaAguarde(sMensagem:string);
//begin
//  If frmAguarde = Nil Then
//    Application.CreateForm(TfrmAguarde,frmAguarde);
//
//  frmAguarde.lblMensagem.Caption := sMensagem;
//  frmAguarde.Show;
//  frmAguarde.pnlAguarde.Refresh;
//end;
{**************************************************************************}
{***** Finalidade: Atualiza Percentual                                *****}
{**************************************************************************}
//Procedure AtualizaAguarde(nPercentual:Integer);
//Begin
//  //frmAguarde.lblMensagem.Refresh;
//  //frmAguarde.Label1.Refresh;
//  frmAguarde.tgProgesso.Progress := nPercentual;
//  frmAguarde.tgProgesso.Refresh;
//End;
{**************************************************************************}
{***** Finalidade: Fechar a Mensagem Aguarde                          *****}
{**************************************************************************}
//Procedure FechaAguarde;
//Begin
//  FreeAndNil(frmAguarde);
//End;

{**************************************************************************}
{***** Finalidade: Ajustar texto para a Impressão Correta             *****}
{**************************************************************************}
Function AjustaStr ( str: String; tam: Integer ): String;
Begin
  while Length ( str ) < tam do
    str := str + ' ';
    if Length ( str ) > tam then
      str := Copy ( str, 1, tam );
  Result := str;
end;

{**************************************************************************}
{***** Finalidade: Ajustar texto a esquerda                           *****}
{**************************************************************************}
Function Padl(s:string;n:integer):string; // Alinhamento pela esquerda
{alinha uma string à esquerda}
begin
  Result:=Format('%-'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;

{**************************************************************************}
{***** Finalidade: Ajustar texto a direita                            *****}
{**************************************************************************}
Function Padr(s:string;n:integer):string;{alinha uma string à direita}
begin
  Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;



{**************************************************************************}
{***** Finalidade: Cliptografar uma String                            *****}
{***** Parametros: mStr -> String a Cliptografar                      *****}
{*****             mChave -> Chave utilizada para Cliptografar        *****}
{**************************************************************************}
function Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
    begin
      pos := (i mod TamanhoChave);
      if pos = 0 then
         pos := TamanhoChave;
      posLetra := ord(Result[i]) xor ord(mChave[pos]);
      if posLetra = 0 then
        posLetra := ord(Result[i]);
      Result[i] := chr(posLetra);
  end;
end;

{**************************************************************************}
{***** Finalidade: Contar o Numero de Caracteres de uma String        *****}
{**************************************************************************}
Function ContaCaracs(Edit:String): integer;
{Retorna quantos caracteres tem um Edit especificado}
Begin
  Result := Length(Edit);
End;


{**************************************************************************}
{***** Finalidade: Contar o Numero de Caracteres de uma String        *****}
{**************************************************************************}
//procedure gravaArquivoTexto ( nomeDoArquivo: String; tabela: TTable );
//var
//  arq: TextFile;
//  linha: String;
//begin
//  AssignFile ( arq, nomeDoArquivo );
//  Rewrite ( arq );
//  tabela.First;
//  while not tabela.Eof do
//    begin
//      Write ( arq, AjustaStr ( tabela.FieldByName ( 'Nome' ).AsString, 30 ) );
//      Write ( arq, FormatFloat ( '00000000.00', tabela.FieldByName ( 'Salario' ).AsFloat ) );
//      WriteLn ( arq );
//      tabela.Next;
//    end;
//  CloseFile ( arq );
//end;

{**************************************************************************}
{***** Finalidade: Converter hora para minutos                        *****}
{***** Parametros: Hora -> No Parametro String                        *****}
{**************************************************************************}
Function HoraToMin(Hora: String): Integer;
begin
  Result := (StrToInt(Copy(Hora,1,2))*60) + StrToInt(Copy(Hora,4,2));
end;

{**************************************************************************}
{***** Finalidade: Subtração de Datas                                 *****}
{***** Retorno...: Numero de Dias decorido                            *****}
{**************************************************************************}
Function SubData(DataInicio,DataFim:TDate):String;
begin
  Result := FloatToStr(DataFim - DataInicio);
end;


{**************************************************************************}
{***** Finalidade: Retorna a diferença entre duas horas               *****}
{**************************************************************************}
Function Permanencia(DataInicio,DataFim:TDate;HoraInicio,HoraFim:string):TStringList;
var

  tsRetorno : TStringList;

  nMin1 : Integer;
  nMin2 : Integer;
  nDias : Integer;
  sDias : String;
  nMinu : Integer;

  sAux1 : string;
  sAux2 : string;
  nHoras: Integer;
  nMinutos : Integer;

  nDiAcerto : Integer;
  sTExto : String;
Begin

 nHoras     := 0;
 nDiAcerto  := 0;

 //Criar mensagem que avisa que a data do computador esta errada
 IF ( DataFim < DataInicio ) Then
   Begin
     MessageDlg( 'VERIFIQUE A DATA DO COMPUTADOR.', mtWarning, [mbOk], 0 );
     Application.Terminate;
   End;

 tsRetorno  := TStringList.Create; { Criação do Objeto }

 nMin1 := StrToInt(Copy(HoraInicio,1,2)) * 60 + StrToInt(Copy(HoraInicio,4,2)); //Hora de Entrada
 nMin2 := StrToInt(Copy(HoraFim,1,2))    * 60 + StrToInt(Copy(HoraFim,4,2));    //Hora de Saida
 sDias := SubData(DataInicio,DataFim);                                          //Numero de Dias Decorrido
 nDias := StrToInt(sDias);                                                      //Converto os Dias para Inteiro
 nMinu := 1440 * nDias + nMin2 - nMin1;                                         //Totalizo os dias e os minutos

 //Acerto para Calculos
 nMinutos := nMinu;

 //Realizo o calculo para saber quantas horas tem no total de minutos
 while nMinutos >= 60 do
    Begin
      nMinutos := nMinutos - 60;
      nHoras   := nHoras + 1;
    End;

 //Total de dias tem nas horas
 while nHoras >= 24 do
   begin
      nHoras := nHoras - 24;
      nDiAcerto := nDiAcerto + 1;
   end;

 //Dados para Retorno
 sTexto := DateToStr(DataInicio) + ' ' + Copy(HoraInicio,1,5);
 tsRetorno.Add(sTexto);                                          { Data e hora da entrada }
 sTexto := DateToStr(DataFim) + ' ' + Copy(HoraFim,1,5);
 tsRetorno.Add(sTexto);                                          { Data e hora da saida }
 tsRetorno.Add(IntToStr(nDiAcerto));                             { Total de Dias  }
 tsRetorno.Add(IntToStr(nHoras));                                { Total de Horas }
 tsRetorno.add(IntToStr(nMinutos));                              { Minutos Restantes das Horas }
 tsRetorno.Add(IntToStr(nMinu));                                 { Minutos Totalizados }

 {=====================================================================
 REALIZAR TESTES UTILIZANDO OS SEGUINTES PARAMETROS
 ======================================================================
 LOCAL NDIAS := 1440 * (DATAS - DATAE)
 LOCAL NMIN1 := VAL(SUBSTR(HORAE, 1, 2)) * 60 + VAL(SUBSTR(HORAE, 3,2))
 LOCAL NMIN2 := VAL(SUBSTR(HORAS, 1, 2)) * 60 + VAL(SUBSTR(HORAS, 3,2))
 LOCAL NMIN := NDIAS + NMIN2 - NMIN1
 ======================================================================}

 Result := tsRetorno;

End;


{**************************************************************************}
{***** Finalidade: Manipular mensagems de erro do sistema             *****}
{***** deve ser usado no --> OnCreate do FormPrincipal                *****}
{***** Para usar -> Application.OnException:= ManipulaErro;           *****}
{**************************************************************************}
Procedure ManipulaErro (Sender: TObject; E: Exception);
Begin
MessageDlg(E.Message + #13#13+
           'Suporte ao sistema ligue para: (014) 9771-2684',
            mtError, [mbOk], 0);
end;

{**************************************************************************}
{***** Finalidade: Somente aceita caracteres como Numeros e Virgula   *****}
{**************************************************************************}
procedure NumEvirg(Sender: TObject; var Key: Char);
begin

    if not(Key in ['0'..'9', ',', #8]) then
        begin
        // Nao fazendo parte da lista acima, verifique estas
        if Key = #13 then Exit;
        if Key = '.' then Key := ','
        else
        // Nao fazendo parte da lista acima anule a tecla
        Key := #0;
        end;
end;

{**************************************************************************}
{***** Finalidade: Somente aceita caracteres como Numeros e Ponto.   *****}
{**************************************************************************}
procedure NumEPonto(Sender: TObject; var Key: Char);
begin

    if not(Key in ['0'..'9', '.', #8]) then
        begin
        // Nao fazendo parte da lista acima, verifique estas
        if Key = #13 then Exit;
        if Key = ',' then Key := '.'
        else
        // Nao fazendo parte da lista acima anule a tecla
        Key := #0;
    end;
end;


{**************************************************************************}
{***** Finalidade: Mover o PNL em diversas Regioes da Tela            *****}
{***** Exemplo -> MovePainel(pnlMove,3,3);                            *****}
{**************************************************************************}
Procedure MovePainel(sNome : TPanel; Lado, Topo : Integer);
var
  acertoTopo, acertoLado : Integer;
  nAux : Integer;
Begin

  acertoTopo := sNome.Top;
  acertoLado := sNome.Left;

  //Principal
  IF ( acertoTopo < Topo ) Then
  Begin
    While acertoTopo <= Topo do
    Begin
      sNome.Top := acertoTopo;
      Inc(acertoTopo,15);
    End;
  End;

  IF ( acertoLado < Lado ) Then
  Begin
    While acertoLado <= Lado do
    Begin
      sNome.Left := acertoLado;
      Inc(acertoLado,15);
    End;
  End;

  //Secundario
  IF ( acertoTopo > Topo ) Then
  Begin
    While acertoTopo >= Topo  do
    Begin
      sNome.Top := acertoTopo;
      acertoTopo := acertoTopo - 15
    End;
  End;

  IF ( acertoLado > Lado ) Then
  Begin
    While acertoLado >= Lado do
    Begin
      sNome.Left := acertoLado;
      acertoLado := acertoLado - 15
    End;
  End;

End;

{*******************************************************************************}
{***** Finalidade: Remove os espaços em branco de ambos os lados da string *****}
{*******************************************************************************}
Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
end;

{*******************************************************************************}
{***** Finalidade: Retorna o número de linhas que um arquivo possui        *****}
{*******************************************************************************}
Function NumLinhasArq(Arqtexto:String): integer; { Retorna o número de linhas que um arquivo possui }
Var
  f: Textfile;
  linha, cont:integer;
Begin
  linha := 0;
  cont := 0;
  AssignFile(f,Arqtexto);
  Reset(f);
  While not eof(f) Do
    begin
    ReadLn(f);
    Cont := Cont + 1;
    end;
  Closefile(f);
  result := cont;
end;


{*******************************************************************************}
{***** Finalidade: Gerar caixa de aguarde com percentual -> Inicio         *****}
{*******************************************************************************}
Procedure DialogoProgressoInicio(nMaximo :Integer; sCabecalho :string );
begin

  Progresso                := TJvProgressDialog.Create(Progresso);
  Progresso.Caption        := sCabecalho;
  Progresso.ShowCancel     := False;
  Progresso.Max            := nMaximo;
  Progresso.ScreenPosition := poDesktopCenter;
  Progresso.Show;

end;

{*******************************************************************************}
{***** Finalidade: Atualizar o progresso da caixa -> Meio                  *****}
{*******************************************************************************}
Procedure DialogoProgressoAtualiza(nNumero : Integer);
begin

  Progresso.Position := nNumero;
  Progresso.Text     := 'Progresso.: ' + IntToStr(nNumero) + ' %';
  Sleep(30);
  IF nNumero >= Progresso.Max  Then
     Progresso.Hide;

end;

{*******************************************************************************}
{***** Finalidade: Mostrar mensagem e pegar retorno                        *****}
{*******************************************************************************}
//Procedure MostraMensagem(sMensagem:string);
//begin
//  If frmMensagem = Nil Then
//    Application.CreateForm(TfrmMensagem,frmMensagem);
//    frmMensagem.ShowModal;
//
//    //frmMensagem.lblMensagem.Caption := sMensagem
//
//end;

{*******************************************************************************}
{***** Finalidade: Retornar o percentual de um determinado valor           *****}
{*******************************************************************************}
Function Gerapercentual(valor:real;Percent:Real):real;
begin
  percent := percent / 100;
  try
    valor := valor * Percent;
  finally
    result := valor;
  end;
end;



{*******************************************************************************}
{***** Finalidade: Justificar um determinado texto                         *****}
{*******************************************************************************}
function Justifica(mCad:string;mMAx:integer):string;
var
  mPos,mPont,mTam,mNr,mCont:integer;
  mStr:string;
begin
  mTam:=Length(mCad);
  if mTam>=mMax then
    Result:=copy(mCad,1,mMax)
  else
    mStr:='';

  mCont:=0;
  mPont:=1;
  mNr:=mMax-mTam;
  while mCont<mNr do
    begin
      mPos:=pos(mStr,copy(mCad,mPont,100));
      if mPos=0 then
        begin
          mStr:=mStr+' ';
          mPont:=1;
          continue;
        end
      else
        begin
          mCont:=mCont+1;
          Insert(' ',mCad,mPos+mPont);
          mPont:=mPont+mPos+length(mStr);
        end;
      Result:=mCad;
  end;
end;


{*******************************************************************************}
{***** Finalidade: Centralizar um determinado texto                        *****}
{*******************************************************************************}
Function Centraliza( vTexto : String; vTam : Real) : String;
begin
  vTam   := Round(vTam - Length(vTexto)) / 2;
  Result := Replicate( ' ', Round(vTam) ) + vTexto;
end;


{*******************************************************************************}
{***** Finalidade: Atualiza Banco de Dados                                 *****}
{*******************************************************************************}
Procedure AtualizaDados ( nomeDoArquivo: String ); 
var arq: TextFile; 
    linha: String;
    sSql : string;
begin


  sSql := '';
  AssignFile ( arq, nomeDoArquivo );
  Reset ( arq );
  ReadLn ( arq, linha );
  while not Eof ( arq ) do
  begin

    sSql := sSql + linha; 

    { Processe a linha lida aqui. }
    { Para particionar a linha lida em pedaços, use a função Copy. }

    ReadLn ( arq, linha );
  end;
  CloseFile ( arq );

  Dm.ibqGeral.Close;
  Dm.ibqGeral.SQL.Clear;
  Dm.ibqGeral.SQL.Text := sSql;
  Dm.ibqGeral.Open;

end;

{**************************************************************************}
{***** Finalidade: Limpar a Variavel do Relatorio                     *****}
{**************************************************************************}
procedure InicializaRelatorio(sNome:string);
begin
  TsRelatorio := TStringList.Create; { Criação do Objeto }
  TsRelatorio.Clear;

  //Crio o cabecalho do Relatorio
  AddRelatorio(PadC(sEmpNome,48));
  AddRelatorio(PadC(sEmpEnde,48));
  AddRelatorio(Replicate('-',48));
  AddRelatorio(PadC(sNome   ,48));
  AddRelatorio(Replicate('-',48));

end;

{**************************************************************************}
{***** Finalidade: Configuração de Empresas                           *****}
{**************************************************************************}
procedure AddRelatorio(sTexto:string);
begin
  TsRelatorio.Add(sTexto);
end;

{**************************************************************************}
{***** Finalidade: Criar Tela de Consulta do Relatorio                *****}
{**************************************************************************}
procedure FinalizaRelatorio(Hora: TDateTime);
begin

  AddRelatorio('');
  AddRelatorio('');
  AddRelatorio(Replicate('-',48));
  AddRelatorio(Padr(DateToStr(Date) + ', ' + TimeToStr(Hora),47) );
  AddRelatorio(Replicate('-',48));
  frmMostraRelatorio.Relatorio;

end;

{**************************************************************************}
{***** Finalidade: Devolver o mes por extenso                         *****}
{**************************************************************************}
function MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
  result := meses[mes-1];
End;

{**************************************************************************}
{***** Finalidade: Verificar se um usuario tem permissão              *****}
{**************************************************************************}
Function VerPermissaoUsuario(idUsuario,idModulo:Integer):Boolean;
var
  sSql : string;
  nAux : Integer;
begin

  sSql := 'SELECT * FROM USUARIOS_MODULOS WHERE ID_USUARIO = ' + QuotedStr(IntToStr(idUsuario)) + ' AND ID_MODULO = ' + QuotedStr(IntToStr(idModulo));
  Dm.ibqGeral.Close;
  Dm.ibqGeral.SQL.Clear;
  Dm.ibqGeral.SQL.Text := sSql;
  Dm.ibqGeral.Open;

  nAux := Dm.ibqGeral.FieldByName('ID_USUARIO').AsInteger;

  IF nAux > 0 Then
    Begin
      nAux := dm.ibqGeral.FieldByName('MOD_PERMISSAO').AsInteger;
      IF nAux = 0 Then
        Result := True
      Else
        Result := False;
    End
  Else
    Result := False;


end;


function SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
{Permite que você altere a data e a hora do sistema}
var
   tSetDate: TDateTime;
   vDateBias: Variant;
   tSetTime: TDateTime;
   vTimeBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
  GetTimeZoneInformation(tTZI);
  vDateBias := tTZI.Bias / 1440;
  tSetDate := tDate + vDateBias;
  vTimeBias := tTZI.Bias / 1440;
  tSetTime := tTime + vTimeBias;
  with tST do
  begin
    wYear := StrToInt(FormatDateTime('yyyy', tSetDate));
    wMonth := StrToInt(FormatDateTime('mm', tSetDate));
    wDay := StrToInt(FormatDateTime('dd', tSetDate));
    wHour := StrToInt(FormatDateTime('HH', tSettime));
    wMinute := StrToInt(FormatDateTime('nn', tSettime));
    wSecond := StrToInt(FormatDateTime('ss', tSettime));
    wMilliseconds := 0;
  end;
  SystemDateTime := SetSystemTime(tST);
end;


{**************************************************************************}
{***** Finalidade: Executar um Determinado Formulario                 *****}
{**************************************************************************}
procedure ExecutaForm(FormClass: TFormClass; var Reference);
begin
  Screen.Cursors[crHourGlass];
  Application.CreateForm(FormClass, TForm(Reference));
  try
    TForm(Reference).ShowModal;
  finally
    TForm(Reference).Release;
    TForm(Reference) := nil;
    Screen.Cursors[crDefault];
  end;
end;



function DifTempo(hora_i, hora_f: TTime): String;
var
  totsegdia, hora1, hora2, final: Integer;
  resultado: String;

  function Segundos(tempo,inicio: String): Integer;
  var
    Horas, Minutos, s1, s2, Segs, Final: Integer;
  begin
    if inicio <> '' then
    begin
      Horas:=StrToInt(Copy(Tempo,01,2))-StrToInt(Copy(Inicio,1,2));
      Minutos:=StrToInt(Copy(Tempo,4,2))-StrToInt(Copy(Inicio,4,2));
      s1:=StrToInt(Copy(Tempo,7,2));
      s2:=StrToInt(Copy(Inicio,7,2));
      if s2<=s1 then
        segs:=S1-S2
      else
        segs :=S1+(60-S2);
      tempo:=FormatFloat('00',horas) + ':' + FormatFloat('00',minutos) + ':' + FormatFloat('00',segs);
    end;
    final:= StrToInt(Copy(tempo,01,2))*3600 + StrToInt(Copy(tempo,4,2))*60 +
    StrToInt(Copy(tempo,7,2));
    Segundos := final;
  end;

begin
  totsegdia:=86400; // total de segundos de 1 dia
  hora1:=segundos(TimeToStr(hora_i),'');
  hora2:=segundos(TimeToStr(hora_f),'');
  if hora2<hora1 then // mudou de dia
     hora2:=hora2+totsegdia;
  final:=hora2-hora1;
  Resultado := FormatFloat('00',Int((final div 3600) mod 24)) + ':' +
  FormatFloat('00',Int((final div 60) mod 60)) +':' +
  FormatFloat('00',Int(final mod 60));
  DifTempo := Resultado;
end;

{**************************************************************************}
{***** Finalidade: Validar um determinada data                        *****}
{**************************************************************************}
function ValidaData(sData:string):Boolean;
begin
  Result := True;
  if not Empty(sData) then
    begin
      try
        StrToDate(sData);
      except
        on EConvertError do
        begin
          Application.MessageBox('Data Invalida.', 'Atenção', MB_OK +
          MB_ICONINFORMATION);
          Result := False;
        end;
      end;
    end
  Else
    Result := False;

end;


{******************************************************************************}
{ Finalidade.: Verificar se a senha dia e Valida                               }
{******************************************************************************}
Function SenhaDia(sSenhaEntrada,hora:string):Boolean;
var
  v1,v2,v3: Real;
  d1,d2,d3: String;
  h1      : Real;
  sSenhaSaida : string;
begin

  Result := True;

  //Trabalhando com Data - Atual do Sistema
  d1:= formatdatetime('dd', date);
  d2:= formatdatetime('mm', date);
  d3:= formatdatetime('YYYY', date);
  v1:= strtofloat(d1);
  v2:= strtofloat(d2);
  v3:= strtofloat(d3);
  h1:= strtofloat(Copy(hora,0,2));
  sSenhaSaida := floattostr(v1+v2+v3+h1);

  if sSenhaEntrada <> sSenhaSaida then
     Begin
       Application.MessageBox('SENHA INVALIDA.', 'ATENÇÃO', MB_OK + MB_ICONSTOP);
       Result := False;
     End;

end;

{******************************************************************************}
{ Finalidade.: Verifica se o ano esta pronto para trabalhar com 4 digitos      }
{******************************************************************************}
function Is4DigitYear: Boolean;
begin
  //result:=(Pos('yyyy', ShortDateFormat)>0);
end;

{******************************************************************************}
{***** Finalidade:Codificar uma determinada String                        *****}
{******************************************************************************}
function Codifica(const Str1: String): String;
var
 CharIndex: Integer;
 ReturnValue: string;
begin
 ReturnValue := '';
 for CharIndex := 1 to Length(Str1) do
 begin
   ReturnValue := ReturnValue + chr(NOT(ord(Str1[CharIndex])));
 end;
 Result := ReturnValue;
end;


{**************************************************************************
 ***** Finalidade: IIF identido ao clipper                            *****
 **************************************************************************}
Function iif(Condicao:Boolean; retornaTrue, retornaFalse:Variant):Variant;
begin
   if Condicao = True then
      Result := RetornaTrue
   else
      Result := RetornaFalse;
end;


{******************************************************************************}
{***** Finalidade:Percorrer um arquivo texto                              *****}
{******************************************************************************}
procedure PercorreArquivoTexto(nomeDoArquivo:String;lCodificado:Boolean);
var
  arq: TextFile;
  linha: String;
begin

  //Guardo os dados em memoria
  TsRelatorio := TStringList.Create; { Criação do Objeto }
  TsRelatorio.Clear;

  AssignFile ( arq, nomeDoArquivo );
  Reset ( arq );
  ReadLn ( arq, linha );
  while not Eof ( arq ) do
  begin

    if lCodificado then
       AddRelatorio(Codifica(linha))
    else
       AddRelatorio(linha);

    ReadLn ( arq, linha );
  end;
  CloseFile ( arq );
end;

{******************************************************************************}
{***** Finalidade: Gravar um determinado arquivo texto                    *****}
{******************************************************************************}
procedure GravaArquivoTexto(nomeDoArquivo:String;lCodificado:Boolean);
var
  arq  : TextFile;
  linha: String;
  nAux : Integer;
begin

  AssignFile ( arq, nomeDoArquivo );
  Rewrite ( arq );
  for nAux := 0  to TsRelatorio.Count-1 do
  begin
    if lCodificado then
       WriteLn( arq, Codifica(TsRelatorio.Strings[nAux]))
    else
       WriteLn( arq, TsRelatorio.Strings[nAux]);

  end;
  CloseFile ( arq );
end;

{******************************************************************************}
{***** Finalidade: Verificar se uma determinada versão do sistema trial foi expirado *}
{******************************************************************************}
Procedure VerSistemaTrial;
begin

  IF FileExists( 'c:\windows\cwin32.dll' ) Then
    Begin
      Application.MessageBox('Esta versão expirou. Favor contactar o' + #13#10
        + 'desenvolvedor para atualizar a versão!', 'ATENÇÃO', MB_OK +
        MB_ICONWARNING);
      Halt;
    End;

end;

{******************************************************************************}
{***** Finalidade: Gravar o sistema como trial                                *}
{******************************************************************************}
Procedure GravaVersaoTrial;
var
  arq  : TextFile;
begin

  AssignFile ( arq, 'c:\windows\cwin32.dll' );
  Rewrite ( arq );
  WriteLn( arq, 'XXXXXX0123456789');
  CloseFile ( arq );

end;

End.


