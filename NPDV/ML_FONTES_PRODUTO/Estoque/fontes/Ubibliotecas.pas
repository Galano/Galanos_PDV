unit Ubibliotecas;
interface

uses SysUtils, Forms, StdCtrls, Dialogs, Controls, IBX.IB, IBX.IBDatabase, Data.DB, IBX.IBQuery,
     IBX.IBSQL, Mask, Windows, ComCtrls, ExtCtrls, Grids, ExtDlgs, rxCurrEdit,
     DateUtils, DBGrids, iniFiles, Udm, Printers, vcl.Graphics;

type
  TConsisteInscricaoEstadual = function (const Insc, UF: String): Integer; stdcall;
  const Caractere : array[1..106] of Char = (
  'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S',
  'T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','!','#',
  '$','%','&','/','(',')','=','?','>','^','@','£','§','{','[',']','}','´','<',
  '~','+','*','`','''','ª','º','¢','-','_',',','.',';',':','|','\','¹','²','³'
  ,'¬','°','¨',' ','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
  'p','q','r','s','t','u','v','w','x','y','z' );

  const Subst : array[1..106] of string = (
  '!9@8','@7!7','#4$5','$5%4','%8$8','^1%1','&3^5','*7&6','(6*6',')3(3','-2)8','=1-7','+0-9','/0@1','\9$7',
  '!3@2','@3&6','#1*4','$2#4','%6(8','^9!5','&4=4','*3@4','(8*4',')4!7','-0^5','=1@9','+2!0','/8%2','\7@5',
  '!3@7','@4!8','#7&4','$6$3','%2&7','^1*3','&1@0','*3$9','#3^1','!4-2','&6(5','!5@8',')7!8','4&1-','a2$1',
  '*9z6','@7c3','1%^5','0&*6','$5^6','!18)','(38)','@30&','#69]','[70]','{26}','-93#','l52h','h71i','w80&',
  '%50%','#401','@87-','b46x','r55^','!2*2','o08y','&89)','%03%','\59q','t85*','^29-','@02%','#99)','#255',
  '@23~','~91t','6%4n','~5a1','0=+0','Za*a','%yB-','Xc#C','wl#d','V*@e','&UF)','!tG$','-sh@','%rij','%QJ)',
  '%pk&','@oL*','!nm=','!MN*','@lO-','$kpy','Ojq;',':Ir-','h:;s','Gx%T','f}{U','E#tv','d1W+','&cxk','pby$',
  'aZ');

function InverteValor(Text: string) : string;
function RetiraCaracter(Text : string) : string;
function FormataStringFloat(Text : string) : string;
function cnpj(s:string): boolean;
function cpf(num: string): boolean;
function Prxcod(tabela : String; campo : string; transaction : Tibtransaction; ibsqlCod: Tibsql) : integer;
function Consulta(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TIBTransaction; Qry : TIBQuery) : String;
function BuscaEmpresaRelatorio(transaction : TIBTransaction; ibsql : TIBSQL) : string;
function AnoBiSexto(Ayear: Integer): Boolean;
function UltimoDiaMes (const mes : word; const ano : word) : TDateTime;
function FormataStringD(Valor,Tamanho,Complemento : String):String;
function FormataStringE(Valor,Tamanho,Complemento : String):String;
function CalculaDigitoEAN13(Cod:String):String;
function PrimeiraLetraMaiuscula(sTexto : string):string;
function RetiraCR(Text : string) :string;

function Criptografa (Palavra : string) : string;
function DesCriptografa (Palavra : String) : string;

function EliminaCaracter(stext : string) : string;
function FormataCNPJ(cnpj : string) : string;
function FormataCPF(CPF: string): string;
function VerificaInscricao(insc, uf : string) : boolean;
function RetornaMes(const mes : integer) : string;
function VerificaCST (sCST : string) : boolean;
function Substitui(substituida : string; substituirpor : string; texto : string) : string;
function StrToChar(Texto : String) : Char;
function EhNumero(s: string): Boolean;
function FormataDataECF(const sString : string) : string;
function FormataHoraECF(const sString : string) : string;
function ExatoCurrency(Value: Currency; Decimal: Integer): Currency;
function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
function Excluir(Tabela, campo_tabela, campo_excluir : String) : Boolean;

procedure Limpaedit(form: Tform);
procedure EDedit(form: Tform; estado: boolean);
procedure Excluir_(form : Tform; Tabela : string; campo : TEdit; ibsql: Tibsql; transaction : Tibtransaction);
procedure BuscaNoCombo (Combo : TComboBox; Valor : Integer);

procedure GravaIniCrypt(Diretorio, Colchete, Parametro, Texto, Arquivo: String);
Function LeIniCrypt(Diretorio, Colchete, Parametro : String; Var Texto, Arquivo: String): String;
Function Codifica(const Str1: String): String;

procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);


implementation

procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
const
  TabelaA: array[0..9] of string[7] = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TabelaB: array[0..9] of string[7] = ('0100111', '0110011', '0011011', '0011011', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TabelaC: array[0..9] of string[7] = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');
  TabAux: array[0..9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
begin
  Formato := '';
  Codigo := CodBarras;
  DecimoTerceiroDig := StrToIntDef(CodBarras[1], 0);
  {----------------------------------------------------------------------------}
  { Tendo o 13º dígito definido, posso definir o padrão de impressão das barras}
  { no primeiro conjunto de 6 dígitos baseado na tabela Auxiliar. }
  {----------------------------------------------------------------------------}
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A': Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B': Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C': Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; //--> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Direita'

  //------ Desenha o código alfa-numérico na imagem
  Imagem.Font.Size := 10;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(CodBarras, 01, 01));
  Imagem.TextOut(13, 51, Copy(CodBarras, 02, 06));
  Imagem.TextOut(60, 51, Copy(CodBarras, 08, 06));
  //------ Desenha as barras na imagem
  DesenhaBarras(Formato, Imagem);
end;

procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  I: Boolean;
begin

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  x := 10;
  i := True;
  for y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    h := 1;
    a.x := x;
    a.y := 0;
    b.x := x;
    b.y := 50;
    c.x := x + h - 1;
    c.y := 50;
    d.x := x + h - 1;
    d.y := 0;
    case Y of
      1..3, 46..50, 93..95:
        begin
          b.y := 55;
          c.y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not (i);
    x := x + h;
  end;

end;

function FormataStringD(Valor,Tamanho,Complemento : String):String;
var X, Y : Integer;
begin
   Y := Length(Valor);
   For X := Y to StrToInt(Tamanho) do
     begin
        If (x<>StrToInt(Tamanho)) then
           Valor := Complemento + Valor
        else
           Valor := '' + Valor ;
     end;
   Result := Valor;
end;

function FormataStringE(Valor,Tamanho,Complemento : String):String;
var X, Y : Integer;
begin
   Y := Length(Valor);
   For X := Y to StrToInt(Tamanho) do
     begin
        If (x <> StrToInt(Tamanho)) then
           Valor := Valor + Complemento
        else
           Valor := Valor + '';
     end;
   Result := Valor;
end;

function InverteValor(Text: string) : string;
var n : integer;
begin
   for n := 1 to length(Text) do
      begin
         if Copy(Text, n, 1) = '.' then
            begin
               Delete(Text, n, 1);
               Insert(',', Text, n);
            end
         else
            if Copy(Text, n, 1) = ',' then
               begin
                  Delete(Text, n, 1);
                  Insert('.', Text, n);
               end;
      end;
   Result := Text;
end;

function RetiraCaracter(Text: string) : string;
var n : integer;
begin
   for n:= 1 to length(Text) do
     begin
        if (Copy(Text,n,1) = '.') or (Copy(Text,n,1) = '-') or (copy(text,n,1) = ',') or (copy(text,n,1) = '/') or (copy(text,n,1) = ':') then
           Delete(Text,n,1);
     end;
   Result:= Text;
end;

function FormataStringFloat(Text : string) : string;
var n : integer;
begin
   for n := 1 to length(Text) do
      begin
         if Copy(Text, n, 1) = '.' then
            Delete(Text, n, 1)
      end;
   Result := Text;
end;

function cpf(num: string): boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
   d1,d2: integer;
   digitado, calculado: string;
begin
   if trim(num) = '' then
      begin
         result:= false;
         exit;
      end;

   n1:=StrToInt(num[1]);
   n2:=StrToInt(num[2]);
   n3:=StrToInt(num[3]);
   n4:=StrToInt(num[4]);
   n5:=StrToInt(num[5]);
   n6:=StrToInt(num[6]);
   n7:=StrToInt(num[7]);
   n8:=StrToInt(num[8]);
   n9:=StrToInt(num[9]);
   d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
   d1:=11-(d1 mod 11);
   if d1>=10 then
      d1:=0;
   d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
   d2:=11-(d2 mod 11);
   if d2>=10 then
      d2:=0;
   calculado:=inttostr(d1)+inttostr(d2);
   digitado:=num[10]+num[11];
   if calculado=digitado then
      result:= true
   else
      result:= false;
end;

function cnpj(s:string): boolean;
var soma, dg1, dg2: integer;
    x: shortint;
    aux: string[1];
    aux_cnpj:string[14];
begin
   if (s = '') or (s = '  .   .   /    -  ') then
      begin
         result:= true;
         exit;
      end;
   x:= 1;
   aux_cnpj:= '';
   while x < 19 do
      begin
         aux:= copy(s, x, 1);
         if ((aux <> '.') and (aux <> '/') and (aux <> '-')) then
            aux_cnpj:= aux_cnpj + aux;
         x:= x + 1;
      end;
   s:= aux_cnpj;
   soma:= 0;
   inc(soma, (strtointdef(s[1], 0) * 5));
   inc(soma, (strtointdef(s[2], 0) * 4));
   inc(soma, (strtointdef(s[3], 0) * 3));
   inc(soma, (strtointdef(s[4], 0) * 2));
   inc(soma, (strtointdef(s[5], 0) * 9));
   inc(soma, (strtointdef(s[6], 0) * 8));
   inc(soma, (strtointdef(s[7], 0) * 7));
   inc(soma, (strtointdef(s[8], 0) * 6));
   inc(soma, (strtointdef(s[9], 0) * 5));
   inc(soma, (strtointdef(s[10], 0) * 4));
   inc(soma, (strtointdef(s[11], 0) * 3));
   inc(soma, (strtointdef(s[12], 0) * 2));

   dg1:= soma - ((soma div 11) * 11);

   if dg1 <= 1 then
      dg1:= 0
   else
      dg1:= 11 - dg1;

   soma:= 0;
   soma:= soma + strtointdef(s[1], 0) * 6;
   soma:= soma + strtointdef(s[2], 0) * 5;
   soma:= soma + strtointdef(s[3], 0) * 4;
   soma:= soma + strtointdef(s[4], 0) * 3;
   soma:= soma + strtointdef(s[5], 0) * 2;
   soma:= soma + strtointdef(s[6], 0) * 9;
   soma:= soma + strtointdef(s[7], 0) * 8;
   soma:= soma + strtointdef(s[8], 0) * 7;
   soma:= soma + strtointdef(s[9], 0) * 6;
   soma:= soma + strtointdef(s[10], 0) * 5;
   soma:= soma + strtointdef(s[11], 0) * 4;
   soma:= soma + strtointdef(s[12], 0) * 3;
   soma:= soma + 2 * dg1;

   dg2:= soma - ((soma div 11) * 11);

   if dg2 <= 1 then
      dg2:= 0
   else
      dg2:= 11 - dg2;

   if (inttostr(dg1) = s[13]) and (inttostr(dg2) = s[14]) then
      result:= true
   else
      result:= false;
end;

function Prxcod(tabela : string; campo : string; transaction : Tibtransaction; ibsqlCod: Tibsql) : integer;
begin
   with ibsqlCod do
      begin
         if transaction.Active then
            transaction.Commit;
         Transaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'SELECT MAX(' + campo + ')' + ' as prxcod ' + ' from ' + tabela;
         execquery;
         result:= Fieldbyname('prxcod').AsInteger + 1;
         Transaction.Commit;
         ibsqlCod.Close;
      end;
end;

function Consulta(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TIBTransaction; Qry : TIBQuery) : String;
begin
   try
     try
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       with Qry do
          begin
             close;
             sql.clear;
             sql.Add(' SELECT ' + sCampoPK + ', '  + SCampoPesquisa +
                     ' FROM   ' + sTabela          +
                     ' WHERE  ' + sCampoPK + ' = ' +  #39 + NomeEdit.Text + #39);
             Open;
             if not fieldbyname(sCampoPK).IsNull then
                result:= Fieldbyname(SCampoPesquisa).AsString
             else
                result:= '';
          end;
       Transaction.Commit;
     except
       Transaction.Rollback;
       showmessage('Erro ao Selecionar o(a) ' + sTabela);
     end;
   finally
     Qry.Close;
   end;
end;

function BuscaEmpresaRelatorio(transaction : TIBTransaction; ibsql : TIBSQL) : string;
begin
   if transaction.Active then
      transaction.Commit;
   transaction.StartTransaction;
   try
     try
       with ibsql do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT RAZAO_EMP FROM EMPRESA');
             ExecQuery;
             Result:= fieldbyname('razao_emp').AsString;
          end;
       transaction.Commit;
     except
       transaction.Rollback;
       showmessage('Erro ao Buscar a Empresa');
     end;
   finally
     ibsql.Close;
   end;
end;

function AnoBiSexto(Ayear: Integer): Boolean;
begin
   Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function UltimoDiaMes (const mes : word; const ano : word) : TDateTime;
var  sDia : word;
var  SData : TdateTime;
begin
   Sdata:= encodedate(ano, mes, 01);
   sdia:= DaysInMonth(sdata);
   result:= encodedate(ano, mes, sdia);
end;

Procedure LimpaEdit(form: Tform);
var i : Integer;
begin
   for i := 0 to Form.ComponentCount -1 do
       begin
          if form.Components[i] is TEdit then
             TEdit(form.Components[i]).Clear
          else
             if Form.Components[i] is TEdit then
                TEdit(Form.Components[i]).Clear
             else
                if Form.Components[i] is Tmaskedit then
                   Tmaskedit(form.Components[i]).Clear
                else
                   if form.Components[i] is Tcombobox then
                      begin
                         if Tcombobox(form.Components[i]).Style = csDropDown then
                            Tcombobox(form.Components[i]).Text:= ''
                         else
                            Tcombobox(form.Components[i]).ItemIndex:= -1;
                      end
                   else
                      if form.Components[i] is Tcheckbox then
                         Tcheckbox(form.Components[i]).Checked:= false
                      else
                         if form.Components[i] is Tmemo then
                            Tmemo(form.Components[i]).Clear
                         else
                            if form.Components[i] is TOpenPictureDialog then
                               TOpenPictureDialog(form.Components[i]).FileName:= ''
                            else
                               if form.Components[i] is TCurrencyEdit then
                                  TCurrencyEdit(form.Components[i]).Text:= '0,00'
                               else
                                  if form.Components[i] is TListBox then
                                     Tlistbox(form.Components[i]).Clear
                                  else
                                     if form.Components[i] is TRichEdit then
                                        TRichEdit(form.Components[i]).Clear;
       end;
end;

Procedure EDEdit(form: Tform; estado :boolean);
var
i : Integer;
begin
   for i := 0 to Form.ComponentCount -1 do
      if Form.Components[i] is TEdit then
            TEdit(Form.Components[i]).Enabled:= estado
      else
         if form.Components[I] is Tmaskedit then
            Tmaskedit(form.Components[i]).Enabled:= estado
         else
            if form.Components[i] is Tcombobox then
               Tcombobox(form.Components[i]).Enabled:= estado
            else
               if form.Components[i] is Tcheckbox then
                  Tcheckbox(form.Components[i]).Enabled:= estado
               else
                  if form.Components[i] is Tmemo then
                     Tmemo(form.Components[i]).Enabled:= estado
                  else
                     if form.Components[i] is TDateTimePicker then
                        Tdatetimepicker(form.Components[i]).Enabled:= estado
                     else
                        if form.Components[i] is TCurrencyEdit then
                           TCurrencyEdit(form.Components[i]).Enabled:= estado
                        else
                           if form.Components[i] is TRadioGroup then
                              TRadioGroup(form.Components[i]).Enabled := estado;

end;

function Excluir(Tabela, campo_tabela, campo_excluir : String) : Boolean;
begin
   if application.MessageBox('Confirma a Exclusão?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
      begin
         try
           try
             with DmDados.Q_executa do
                begin
                   Close;
                   sql.Clear;
                   sql.Add('DELETE FROM ' + tabela + ' WHERE ' + campo_tabela + ' = ' + #39 + campo_excluir + #39);
                   ExecSQL;
                   {limpaedit(form);
                   ededit(form, false);}
                end;

             Result := true;
             //DmDados.IBTransaction1.CommitRetaining;

           except
             //DmDados.IBTransaction1.RollbackRetaining;
             Result := false;
             //showmessage('Erro ao Excluir');
           end;
         finally
            DmDados.Q_executa.Close;
         end;
      end;
end;

procedure Excluir_(form : Tform; Tabela : string; campo : TEdit; ibsql: Tibsql; transaction : Tibtransaction);
begin
   if application.MessageBox('Confirma a Exclusão?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
      begin
         try
           try
             if transaction.Active then
                transaction.Commit;
             transaction.StartTransaction;
             with ibsql do
                begin
                   sql.Clear;
                   sql.Add('DELETE FROM ' + tabela + ' WHERE ' + campo.Name + ' = ' + #39 + campo.Text + #39);
                   ExecQuery;
                   limpaedit(form);
                   ededit(form, false);
                end;
             transaction.Commit;
           except
             transaction.Rollback;
             showmessage('Erro ao Excluir');
           end;
         finally
           ibsql.Close;
         end;
      end;
end;

function StrToChar(Texto : String):Char;
{-------------------------------------------------------------------------
  Função para transformar uma String em Char
--------------------------------------------------------------------------}
begin
     if Texto = 'A' then
     begin
          Result:= 'A';
     end
     else
     if Texto = 'B' then
     begin
          Result:= 'B';
     end
     else
     if Texto = 'C' then
     begin
          Result:= 'C';
     end
     else
     if Texto = 'D' then
     begin
          Result:= 'D';
     end
     else
     if Texto = 'E' then
     begin
          Result:= 'E';
     end
     else
     if Texto = 'F' then
     begin
          Result:= 'F';
     end
     else
     if Texto = 'G' then
     begin
          Result:= 'G';
     end
     else
     if Texto = 'H' then
     begin
          Result:= 'H';
     end
     else
     if Texto = 'I' then
     begin
          Result:= 'I';
     end
     else
     if Texto = 'J' then
     begin
          Result:= 'J';
     end
     else
     if Texto = 'L' then
     begin
          Result:= 'L';
     end
     else
     if Texto = 'M' then
     begin
          Result:= 'M';
     end
     else
     if Texto = 'N' then
     begin
          Result:= 'N';
     end
     else
     if Texto = 'O' then
     begin
          Result:= 'O';
     end
     else
     if Texto = 'P' then
     begin
          Result:= 'P';
     end
     else
     if Texto = 'Q' then
     begin
          Result:= 'Q';
     end
     else
     if Texto = 'R' then
     begin
          Result:= 'R';
     end
     else
     if Texto = 'S' then
     begin
          Result:= 'S';
     end
     else
     if Texto = 'T' then
     begin
          Result:= 'T';
     end
     else
     if Texto = 'U' then
     begin
          Result:= 'U';
     end
     else
     if Texto = 'V' then
     begin
          Result:= 'V';
     end
     else
     if Texto = 'X' then
     begin
          Result:= 'X';
     end
     else
     if Texto = 'Z' then
     begin
          Result:= 'Z';
     end
     else
     begin
          Result:= 'A';
     end;
end;

procedure BuscaNoCombo(Combo : TComboBox; Valor : Integer);
var i : integer;
begin
   for i:= 0 to Combo.Items.Count - 1 do
     begin
        if strtoint(copy(Combo.Items[i],1,3)) = valor then
           Combo.ItemIndex:= i;
     end;
end;

function CalculaDigitoEAN13(Cod:String):String;
function Par(Cod:Integer):Boolean;
  begin
     Result:= Cod Mod 2 = 0 ;
  end;
var i, SomaPar, SomaImpar:Integer;
begin
   SomaPar:=0;
   SomaImpar:=0;
for i:=1 to 12 do
if Par(i) then
   SomaPar:=SomaPar+StrToInt(Cod[i])
else
   SomaImpar:=SomaImpar+StrToInt(Cod[i]);
SomaPar:=SomaPar*3;
i:=0;
while i < (SomaPar+SomaImpar) do
   Inc(i,10);
Result:=IntToStr(i-(SomaPar+SomaImpar));
end;

function PrimeiraLetraMaiuscula (sTexto : string):string;
var i :integer;
begin
   for i:= 1 to length(sTexto) do
      begin
         if i = 1 then
            Result:= UpperCase(sTexto[1])
         else
            if sTexto[i - 1] = ' ' then
               Result:= result + UpperCase(sTexto[i])
            else
               Result:= Result + sTexto[i];
      end;
end;

function RetiraCR(text:string):string;
begin
   result:= stringReplace(Text, #13#10, ' ', [rfReplaceAll]);
end;

function Criptografa (Palavra : string) : string;
Var
  vet : integer; //vetor
  ct : integer;  //vetor da constante
  aux : string;  //variável auxiliar
begin
  result := '';
  ct := 0;
  vet := 0;
  aux := '';
  //palavra := uppercase(palavra);
  for vet := 1 to length(Palavra) do
      begin
         for ct:= 1 to 106 do
         begin
            if (palavra[vet] = Caractere[ct]) then
               begin
                  aux := aux + subst[ct];
               end;
         end;
      end;
  result := aux;
end;

function DesCriptografa (Palavra : String) : string;
Var iVetor    : integer;
    iContador : integer;
    iContAux  : integer;
    sAuxiliar : string;
begin
  result    := '';
  iContador := 0;
  iContAux  := 0;
  iVetor    := 0;
  sAuxiliar := '';
  for iVetor:= 1 to length(Palavra) do
      begin
         for iContador:= 1 to 106 do
            begin
               if (copy(palavra, iContAux + 1, 4) = subst[iContador]) then
                  begin
                     sAuxiliar:= sAuxiliar + caractere[iContador];
                  end;
            end;
         inc(iContAux, 4);
      end;
  result:= sAuxiliar;
end;

function EliminaCaracter(stext : string) : string;
var npos: integer;
begin
   result:= '';
   npos:= 1;
   while npos <= Length(sText) do
      begin
         if (stext[npos] = '.') or (stext[npos] = '-') or (stext[npos] = '/') or
            (stext[npos] = ')') or (stext[npos] = '(') or (stext[npos] = ',') then
            begin
               inc(npos);
            end
         else
            begin
               result:= result + stext[npos];
               inc(npos);
            end;
      end;
end;

function FormataCNPJ(cnpj : string) : string;
var sAux, sCNPJ  : string;
begin
   sAux:= EliminaCaracter(cnpj);
   case Length(sAux) of
    11: begin
           sCNPJ:= copy(sAux, 1, 3) + '.' +
                   copy(sAux, 4, 3) + '.' +
                   copy(sAux, 7, 3) + '-' +
                   copy(sAux, 10, 2);
           Result:= sCNPJ;
        end;
    14: begin
           sCNPJ:= copy(sAux, 1, 2) + '.' +
                   copy(sAux, 3, 3) + '.' +
                   copy(sAux, 6, 3) + '/' +
                   copy(sAux, 9, 4) + '-' +
                   copy(sAux, 13, 2);
           Result:= sCNPJ;
        end;
   else
      result:= '';
   end;
end;

//Esta funcao informa Cpf neste formato: 999.999.999-99
function FormataCPF(CPF: string): string;
var sAux, sCPF  : string;
begin
   sAux:= EliminaCaracter(CPF);
   case Length(sAux) of
    11: begin
           sCPF:= copy(sAux, 1, 3) + '.' +
                   copy(sAux, 4, 3) + '.' +
                   copy(sAux, 7, 3) + '-' +
                   copy(sAux, 10, 2);
           Result:= sCPF;
        end;
   else
      result:= '';
   end;
end;

function VerificaInscricao(insc, uf : string) : boolean;
var LibHandle : THandle;
    ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
    iRetInsc : Integer;
begin
   try
     LibHandle:= LoadLibrary(PChar(Trim('DllInscE32.Dll')));
     if LibHandle <= HINSTANCE_ERROR then
        raise Exception.Create ('Dll não carregada');

     @ConsisteInscricaoEstadual:= GetProcAddress (LibHandle, 'ConsisteInscricaoEstadual');
     if @ConsisteInscricaoEstadual = nil then
        raise Exception.Create('Entrypoint Download não encontrado na Dll');

    iRetInsc:= ConsisteInscricaoEstadual(EliminaCaracter(insc), uf);
    if iRetInsc = 0 then
       result:= true
    else
       result:= false;

   finally
     FreeLibrary(LibHandle);
   end;
end;

function RetornaMes(const mes : integer) : string;
begin
   case mes of
      1: result:= 'Janeiro';
      2: result:= 'Fevereiro';
      3: result:= 'Março';
      4: result:= 'Abril';
      5: result:= 'Maio';
      6: result:= 'Junho';
      7: result:= 'Julho';
      8: result:= 'Agosto';
      9: result:= 'Setembro';
     10: result:= 'Outubro';
     11: result:= 'Novembro';
     12: result:= 'Dezembro';
   end;
end;


function VerificaCST (sCST : string) : boolean;
begin
   if (copy(sCST, 1, 1) <> '0') and
      (copy(sCST, 1, 1) <> '1') and
      (copy(sCST, 1, 1) <> '2') then
      result:= false
   else
      begin
         if (copy(sCST, 2,2) <> '00') and
            (copy(sCST, 2,2) <> '10') and
            (copy(sCST, 2,2) <> '20') and
            (copy(sCST, 2,2) <> '30') and
            (copy(sCST, 2,2) <> '40') and
            (copy(sCST, 2,2) <> '41') and
            (copy(sCST, 2,2) <> '50') and
            (copy(sCST, 2,2) <> '51') and
            (copy(sCST, 2,2) <> '60') and
            (copy(sCST, 2,2) <> '70') and
            (copy(sCST, 2,2) <> '90') then
               result:= false
         else
            Result:= true;
      end;
end;

function Substitui(substituida : string; substituirpor : string; texto : string) : string;
var sAux : string;
    i : integer;
begin
   sAux:= '';
   for i:= 1  to length(texto) do
      begin
         if copy(texto, i, 1) = substituida then
            sAux:= sAux + substituirpor
         else
            sAux:= sAux + copy(texto, i, 1);
      end;
   result:= sAux;
end;

function EhNumero(s: string): Boolean;
var i: Integer;
begin
  Result:= True;
  for i:= 1 to Length(s) do
     begin
        if not (s[i] in ['0'..'9']) then
           begin
              Result:= False;
              Break;
           end;
     end;
end;

function FormataDataECF(const sString : string) : string;
var sDia, sMes, sAno : string;
    sAuxData : string;
begin
   if Length(trim(sString)) = 12 then
      begin
         sDia:= copy(sString, 1, 2);
         sMes:= copy(sString, 3, 2);
         sAno:= copy(sString, 5, 2);
         sAuxData:= sDia + '/' + sMes + '/' + sAno;
         result:= sAuxData;
      end
   else
      result:= datetostr(date);
end;

function FormataHoraECF(const sString : string) : String ;
var sHor, sMin, sSeg : string;
    sAuxHora : string;
begin
   if Length(trim(sString)) = 12 then
      begin
         sHor:= copy(sString, 7, 2);
         sMin:= copy(sString, 9, 2);
         sSeg:= copy(sString, 11, 2);
         sAuxHora:= sHor + ':' + sMin + ':' + sSeg;
         result:= sAuxHora;
      end
   else
      result:= TimeToStr(time);
end;

function ExatoCurrency(Value: Currency; Decimal: Integer): Currency;
const arrDecimal: array[0..3] of Integer = (1, 10, 100, 1000);
begin
   if (Abs(Decimal) > 3) then
      raise ERangeError.Create('TruncExato: O decimal deve está no intervalo de: 0..3');
   Result := Trunc(Value * arrDecimal[Decimal]) / arrDecimal[Decimal];
end;

function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
begin
   {Não deixa inserir registros no DBGrid caso:
    1- estiver em modo de edição: E
    1.1- se clicar na tecla "Insert"; OU
    1.2- se clicar na tecla "Seta para baixo" E estiver no último registro; OU
    1.2- se clicar na tecla "Tab" E estiver no último registro E estiver na
         última coluna visível. }
   Result:= Key;

   if dgEditing in DBGrid.Options then
      begin
         if (Key = VK_INSERT) or ((Key = VK_DOWN) and (DataSet.RecNo = DataSet.RecordCount)) then
            Result := 0
         else
            if (Key = VK_TAB) and (DataSet.RecNo = DataSet.RecordCount) then
               begin
                  if (DBGrid.SelectedIndex = RetIdxUltimaColVisivel(DBGrid)) then
                     Result := 0
               end;
      end;
end;

function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
var x: integer;
begin
  Result:= -1;

  for x:= DBGrid.Columns.Count-1 downto 0 do
     begin
        if DBGrid.Columns.Items[x].Visible then
           begin
              Result:= x;
              Break;
           end;
     end;
end;

function LeIniCrypt(Diretorio, Colchete, Parametro : String; Var Texto, Arquivo: String): String;
var
    ArqIni : TIniFile;
begin
    ArqIni := TIniFile.Create(Diretorio+Arquivo);
    Try
    Texto:= Codifica(ArqIni.ReadString((Colchete),(Parametro),Codifica(Texto)));
    Result:= Texto;
    Finally
    ArqIni.Free;
    end;
end;


procedure GravaIniCrypt(Diretorio,Colchete, Parametro, Texto, Arquivo: String);
var
    ArqIni : TIniFile;
begin
    ArqIni := TIniFile.Create(Diretorio+Arquivo);
    try
    ArqIni.WriteString((Colchete),(Parametro),Codifica(Texto));
    finally
    ArqIni.Free;
    end;

end;
Function Codifica(const Str1: String): String;
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


end.
