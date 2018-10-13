unit untImpressao;

interface
  Uses Windows, Messages, Sysutils, Classes, FMX.Graphics, FMX.Dialogs, IniFiles,
     FMX.Forms, FMX.StdCtrls, Udm, UVendas, System.UITypes,
     IBX.IBDatabase, Data.DB, IBX.IBQuery, IBX.IBCustomDataSet,
     IBX.IBTable;

  Function  Cabecalho48Col(sEmpNome, sTel, sEmpCNPJ, sEmpEnde, sControle : String):Boolean;
  Function  ImpRecibo48(dData, sCliente, sFPGTO, sHora, sCodVenda : string; Hora: TDateTime; nValor:Currency;sTransfere:string):Boolean;
  Procedure Rodape48Col( nLinha : Integer; lRodape: Boolean );
  Function  ImpCupomSaida(dDataE, sPlaca, sVeiculo, sHoraE, sHoraS, sPermanencia, sVlrPago, sControle : string; Hora: TDateTime ):Boolean;
  Function  ImpReciboMensalista(sControle,sNome,sValor,sMes, sData : string;idmensalista:Integer ):Boolean;
  Procedure AutenticaReciboSaida(sPlaca,sDataSaida,sHoraSaida,sValor:string);
  Procedure Say(Nlin,Ncol: Integer;Var LinhaAtual: Integer; Var Arquivo: Text;Texto: Variant);
  Function  PadC(S:string;Len:byte):string;

  { Trabalhar com impressoes }
   Function  IniciaImpressao(sPortaImp : String):Boolean;
   Procedure FimImpressao();

   {Strings}
   Function  Replicate( Const cTexto: String; Const nQtd: Integer ):String;
   Function  Empty( Const cTexto: String ):Boolean;
   Function  Right( Const cTexto: String; Const nQtde: Integer ):String;
   Function  ParteTexto(Frase: string; Parte: string): string;
   Function  BuscaTroca(Text,Busca,Troca : string) : string;
   Function  AjustaStr ( str: String; tam: Integer ): String;
   Function  Padl(s:string;n:integer):string;{alinha uma string à esquerda}
   Function  Padr(s:string;n:integer):string;{alinha uma string à direita}

   function FormataRealString(rValor : Real): string;
   Function  StrZero(Zeros:string;Quant:integer):String;
   Function  StrCaracter(Zeros,caracter:string;Quant:integer):String;
   function FormataCNPJ(num: string): String;

   function ImprimeCupom(ndeColunas : Integer; sEmpNome, sTel, sEmpCNPJ, sEmpEnde, sCodVenda, sCliente, sFPGTO, subTotal, Desconto, Total, Troco : String):Boolean;

implementation

var
  ArqPrn: TextFile;
  LinhaAtual: Integer;

const
  QuebraLinha = #13#10;

{**************************************************************************}
{***** Finalidade: Imprimir o cupom no formato 48 colunas             *****}
{**************************************************************************}
function ImprimeCupom(ndeColunas : Integer; sEmpNome, sTel, sEmpCNPJ, sEmpEnde, sCodVenda, sCliente, sFPGTO, subTotal, Desconto, Total, Troco : String):Boolean;
var
  sTextoAux : string;
  sData     : string;
  sHoran    : string;

  linhaCupom, linhaRodape, nAux : Integer;
  Total_Item : Currency;

begin
    Try
      AssignFile(ArqPrn,'LPT1'); // padrão 'LPT1'
      //AssignFile(ArqPrn,'d:\cupom.txt');
      ReWrite(ArqPrn);

      LinhaAtual:=0;

      sData  := DateToStr(Date);
      sHoran := TimeToStr(Now());

      sTextoAux := sData + ', ' + sHoran + '                  ' + 'DOC.' + StrZero(sCodVenda,6);

      Say(00,00,LinhaAtual,ArqPrn,Padc(sEmpNome,ndeColunas));
      Say(01,00,LinhaAtual,ArqPrn,Padc('Tel: '+sTel,ndeColunas));
      Say(02,00,LinhaAtual,ArqPrn,Padc('CNPJ: '+FormataCNPJ(sEmpCNPJ),ndeColunas));
      Say(03,00,LinhaAtual,ArqPrn,Padc(sEmpEnde,ndeColunas));
      Say(04,00,LinhaAtual,ArqPrn,sTextoAux);
      Say(05,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      Say(06,00,LinhaAtual,ArqPrn,PadC('COMPROVANTE SEM VALOR FISCAL',ndeColunas));
      Say(07,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      Say(08,00,LinhaAtual,ArqPrn,'');
      Say(09,00,LinhaAtual,ArqPrn,'CLIENTE: '+ sCliente          );
      Say(10,00,LinhaAtual,ArqPrn,'FORMA DE PGTO: '+ sFPGTO          );
      Say(11,00,LinhaAtual,ArqPrn,'');
      Say(12,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      Say(13,00,LinhaAtual,ArqPrn,'PRODUTO	    QTD  X  VL.UNIT  TOTAL');
      Say(14,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));


      {Carrego os itens da Venda}
      linhaCupom := 14;
      FrmVendas.cdsitensVendas.First;

      while not FrmVendas.cdsitensVendas.Eof do
      begin
        inc(linhaCupom);
        Say(linhaCupom,00,LinhaAtual,ArqPrn,Copy(FrmVendas.cdsitensVendasdescricao.AsString,1, ndeColunas));
        inc(linhaCupom);
        Total_Item := (FrmVendas.cdsitensVendasqtd.Value) * (FrmVendas.cdsitensVendasvl_item.Value);
        Say(linhaCupom,00,LinhaAtual,ArqPrn,Padr(FormatFloat('#,###,###,##0.000', FrmVendas.cdsitensVendasqtd.Value) + '  X  ' + FormatFloat('#,###,###,##0.00', FrmVendas.cdsitensVendasvl_item.Value) + '   ' + FormatFloat('#,###,###,##0.00', Total_Item),ndeColunas));
        FrmVendas.cdsitensVendas.Next;
      end;


      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Padr('SUB-TOTAL: R$ ' + FrmVendas.edtTotalCom.Text,ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Padr('DESCONTO: R$ ' + formatfloat('##,###,##0.00', StrToFloat(FrmVendas.EdtDesconto.Text)),ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Padr('TOTAL CUPOM: R$ ' + FrmVendas.EdtTotal.Text,ndeColunas));

      if (FrmVendas.EDT_CondPagto.Text = '4') then
      begin
        inc(linhaCupom);
        Say(linhaCupom,00,LinhaAtual,ArqPrn,'SALDO (CREDITO): R$ ' + formatfloat('##,###,##0.00', FrmVendas.EdtLimitCli.Text.ToDouble()));
      end;

      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Padc('OBRIGADO PELA PREFERENCIA',ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,Replicate('-',ndeColunas));
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,'');
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,'');
      inc(linhaCupom);
      Say(linhaCupom,00,LinhaAtual,ArqPrn,'');


      CloseFile(ArqPrn);

      // Impresso com sucesso!
      Result:= True;
    except
      Result:= False;
      //MessageDlg('IMPRESSORA NÃO ESTA ATIVA', mtWarning, [mbOk], 0 );
      MessageDlg('IMPRESSORA NÃO ESTA ATIVA',
          System.UITypes.TMsgDlgType.mtWarning,
          [System.UITypes.TMsgDlgBtn.mbOK], 0,
          procedure(const AResult: System.UITypes.TModalResult)
          begin
            case AResult of
              mrOk:
{$IFDEF WIN32}
                Exit;
{$ENDIF}
            end;
          end);
    end;
end;


function FormataCNPJ(num: string): String;
var
  CNPJ : String;
begin
  if (num <> '')  Then
   begin
      CNPJ := Copy(num, 1,2)

      + '.' + Copy(num, 3,3)

      +'.' + Copy(num, 6,3)

      + '/' +Copy(num, 9,4)

      + '-' + Copy(num, 13,2);

      Result := CNPJ;
   end
   else
   begin
      Result := '';
   end;
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
{***** Finalidade: Criar o cabecalho para a impressão de cupons       *****}
{**************************************************************************}
function Cabecalho48Col(sEmpNome, sTel, sEmpCNPJ, sEmpEnde, sControle : String):Boolean;
var
  sTextoAux : string;
  sData     : string;
  sHoran    : string;
Begin
   Result:= True;
   LinhaAtual:=0;
	 {if not IniciaImpressao('LPT1') then
      begin
         MessageDlg('IMPRESSORA NÃO ESTA ATIVA', mtWarning, [mbOk], 0 );
         Result:= False;
         Exit;
      end; }

   sData  := DateToStr(Date);
   sHoran := TimeToStr(Now());
   
   sTextoAux := sData + ', ' + sHoran + '            ' + 'DOC.' + StrZero(sControle,6);

   Say(00,00,LinhaAtual,ArqPrn,Padc(sEmpNome,48));
   Say(01,00,LinhaAtual,ArqPrn,Padc('Tel: '+sTel,48));
   Say(02,00,LinhaAtual,ArqPrn,Padc('CNPJ: '+sEmpCNPJ,48));
   Say(03,00,LinhaAtual,ArqPrn,Padc(sEmpEnde,48));
   Say(04,00,LinhaAtual,ArqPrn,sTextoAux);
   Say(05,00,LinhaAtual,ArqPrn,Replicate('-',50));
   Say(05,00,LinhaAtual,ArqPrn,PadC('COMPROVANTE SEM VALOR FISCAL',48));
   Say(06,00,LinhaAtual,ArqPrn,Replicate('-',50));

End;

{**************************************************************************}
{***** Finalidade: Criar o cabecalho para a impressão de cupons       *****}
{**************************************************************************}
procedure Rodape48Col( nLinha : Integer; lRodape: Boolean );
var
	nQtde : Integer;
  nAux  : Integer;
  sAux  : String;
begin

   { Finalidade..: Mostar a mensagem de rodape }

    nAux := 1;
    IF lRodape Then
      Begin
        Say(nLinha+1,00,LinhaAtual,ArqPrn,Replicate('-',48));
        {IF ( not Empty(sMsg1) ) Then
           Begin
             Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg1,48));
             nAux := nAux + 1;
           End;
        IF ( not Empty(sMsg2) ) Then
           Begin
             Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg2,48));
             nAux := nAux + 1;
           End;
         IF ( not Empty(sMsg3) ) Then
           Begin
             Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg3,48));
             nAux := nAux + 1;
           End;
        IF ( not Empty(sMsg4) ) Then
           Begin
             Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg4,48));
             nAux := nAux + 1;
           End;
        IF ( not Empty(sMsg5) ) Then
           Begin
             Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg5,48));
             nAux := nAux + 1;
           End;
        IF ( not Empty(sMsg6) ) Then
           Begin
              Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg6,48));
              nAux := nAux + 1;
           End;
        IF ( not Empty(sMsg7) ) Then
           Begin
              Say(nLinha+nAux+1,00,LinhaAtual,ArqPrn,Justifica(sMsg7,48));
              nAux := nAux + 1;
           End;}
         nAux := nAux + 1;
      End;

   {Say(nLinha+nAux,00,LinhaAtual,ArqPrn,Replicate('-',48));
   nAux := nAux + 1;
   Say(nLinha+nAux,00,LinhaAtual,ArqPrn,Padc(sMsgRodape,48));
   nAux := nAux + 1;
   Say(nLinha+nAux,00,LinhaAtual,ArqPrn,Replicate('-',48));
   IF nAjuteBobina = 0 Then
      nAjuteBobina := 15;
   nAux := nAux + 1;
   for nQtde := 0 to nAjuteBobina do
     begin
       Say(nLinha+nAux+nQtde,00,LinhaAtual,ArqPrn,'');
     end; }
   FimImpressao();

End;


{**************************************************************************}
{***** Finalidade: Realizar a Impressão de Recibo                     *****}
{**************************************************************************}
Function ImpRecibo48(dData, sCliente, sFPGTO, sHora, sCodVenda : string; Hora: TDateTime; nValor:Currency;sTransfere:string):Boolean;
var
  sTextoAux : string;
  sData     : string;
  sHoran    : string;
  nLinha    : Integer;
Begin
	 IF Cabecalho48Col(DmDados.tb_empresaRAZAO_EMP.AsString,DmDados.tb_empresaTEL_EMP.AsString,DmDados.tb_empresaCNPJ_EMP.Value,DmDados.tb_empresaEND_EMP.AsString, sCodVenda) then
        Begin

           sData  := DateToStr(Date);
           sHoran := TimeToStr(Hora);

           Say(03,00,LinhaAtual,ArqPrn,PadC('CUPOM  SEM  VALOR FISCAL',48));
      	   Say(04,00,LinhaAtual,ArqPrn,Replicate('-',48)                );
     	     Say(05,00,LinhaAtual,ArqPrn,'DATA ENTRADA: '+ dData          );
           //Say(06,00,LinhaAtual,ArqPrn,'PLACA.......: '+ sPlaca         );
           //Say(07,00,LinhaAtual,ArqPrn,'AUTOMOVEL...: '+ sVeiculo       );

           nLinha := 9;

       	   Say(nLinha,00,LinhaAtual,ArqPrn,Replicate('-',48)                );
           nLinha := nLinha + 1;
     	     Say(nLinha,00,LinhaAtual,ArqPrn,'H. ENTRADA..: '+ sHora          );

           //Verifico se o valor a ser pago e no inicio
           if ( (sTransfere = 'N') and (nValor > 0) ) then
             begin
               nLinha := nLinha + 1;
           	   Say(nLinha,00,LinhaAtual,ArqPrn,Replicate('-',48)                );
               nLinha := nLinha + 1;
               Say(nLinha,00,LinhaAtual,ArqPrn,'VALOR PAGO..: '+ FormataRealString(nValor) );
             end
           Else if sTransfere = 'S' then
            begin
               nLinha := nLinha + 1;
           	   Say(nLinha,00,LinhaAtual,ArqPrn,Replicate('-',48)                );
               nLinha := nLinha + 1;
               Say(nLinha,00,LinhaAtual,ArqPrn,'VALOR TRANSFERIDO PARA A CONTA DO MENSALISTA.');
           end;

           Rodape48Col(nLinha,True);

           Result := True;
        End
     Else
        Result := False;

End;


{**************************************************************************}
{***** Finalidade: Realizar a Impressão de Recibo de Saida do veiculo *****}
{**************************************************************************}
Function ImpCupomSaida(dDataE, sPlaca, sVeiculo, sHoraE, sHoraS, sPermanencia, sVlrPago, sControle : string; Hora: TDateTime ):Boolean;
Var
  sTextoAux : string;
  sData     : string;
  sHoran    : string;
  nLinha    : Integer;
Begin

	{ IF Cabecalho48Col() then
        Begin

           sData  := DateToStr(Date);
           sHoran := TimeToStr(Hora);

           sTextoAux := sData + ', ' + sHoran + '                  ' + 'Doc.' + StrZero(sControle,6);
           Say(03,00,LinhaAtual,ArqPrn,sTextoAux                        );
           Say(04,00,LinhaAtual,ArqPrn,PadC('COMPROVANTE DE SAIDA DO ESTACIONAMENTO',48));
      	   Say(05,00,LinhaAtual,ArqPrn,Replicate('-',48)                );
     	     Say(06,00,LinhaAtual,ArqPrn,'DATA ENTRADA: '+ dDataE         );
     	     Say(07,00,LinhaAtual,ArqPrn,'DATA SAIDA..: '+ sData          );
     	     Say(08,00,LinhaAtual,ArqPrn,'HORA ENTRADA: '+ sHoraE         );
     	     Say(09,00,LinhaAtual,ArqPrn,'HORA SAIDA..: '+ sHoraS         );
           Say(10,00,LinhaAtual,ArqPrn,'PLACA.......: '+ sPlaca         );
           Say(11,00,LinhaAtual,ArqPrn,'AUTOMOVEL...: '+ sVeiculo       );
           Say(12,00,LinhaAtual,ArqPrn,'PERMANENCIA.: '+ sPermanencia   );

           nLinha := 13;

       	   Say(nLinha,00,LinhaAtual,ArqPrn,Replicate('-',48)            );
           nLinha := nLinha + 1;
     	     Say(nLinha,00,LinhaAtual,ArqPrn,'TOTAL PAGO..: '+ sVlrPago   );

           Rodape48Col(nLinha,True);

           Result := True;
        End
     Else
        Result := False;}

End;


{**************************************************************************}
{***** Finalidade: Gerar impressão de recibo de pagamento do mensalista****}
{**************************************************************************}
Function ImpReciboMensalista(sControle,sNome,sValor,sMes, sData : string;idmensalista:Integer):Boolean;
var
  sTexto  : string;
  sQuebra : string;
  nQtde   : Integer;
  nLinha  : Integer;
  sSql    : string;
begin

   {Result := True;

	 IF Cabecalho48Col() then
        Begin

          sTexto :=          Replicate('-',48) + QuebraLinha;
          sTexto := sTexto + PadC('R E C I B O  D E  P A G A M E N T O',48) + QuebraLinha;
          sTexto := sTexto + Replicate('-',48) + QuebraLinha;

          sTexto := sTexto + 'Controle.: ' + sControle + QuebraLinha;
          sTexto := sTexto + Replicate('-',48) + QuebraLinha;

          sTexto := sTexto + 'Recebemos de ' + QuebraLinha;
          sTexto := sTexto + Justifica('Sr(a). ' + sNome,48 ) + QuebraLinha;
          sTexto := sTexto + Justifica('a importancia de R$ ' + sValor + ' referente ' ,48)+ QuebraLinha;
          sTexto := sTexto + Justifica('ao pagamento da locacao de uma vaga no ',48) + QuebraLinha;
          sTexto := sTexto + Justifica('estacionamento referente ao mes de ' + Mes( StrToDate(sMes)),48) + QuebraLinha;
          sTexto := sTexto + Justifica('para o(s) veiculo(s) abaixo relacionados. ',48) + QuebraLinha;
          sTexto := sTexto + Replicate('-',48) + QuebraLinha;

          sSql   :=
            'SELECT          ' +
            '  M.*, V.*      ' +
            'FROM            ' +
            '  VEICULOS_MENSALISTAS M, ' +
            '  VEICULOS V              ' +
            'WHERE                     ' +
            '  V.ID_VEICULO = M.ID_VEICULO AND ' +
            '  ID_MENSALISTA = ' + QuotedStr(IntToStr(idmensalista));

          ExecutaSql(dm.ibqRelatorio,sSql);

          IF dm.ibqRelatorio.RecordCount > 0 Then
            while not dm.ibqRelatorio.Eof do
            begin
              sTexto := sTexto + dm.ibqRelatorio.FieldByName('VEI_PLACA').AsString + ' ' + dm.ibqRelatorio.FieldByName('VEI_NOME').AsString + QuebraLinha;
              dm.ibqRelatorio.Next;
            end;


          sTexto := sTexto + Replicate('-',48) + QuebraLinha;

          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;

          sTexto := sTexto + '                Belem, ' + sData + QuebraLinha;

          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;

          sTexto := sTexto + PadC(Replicate('-',25),48) + QuebraLinha;
          sTexto := sTexto + PadC(sEmpNome,48);

          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;
          sTexto := sTexto + '' + QuebraLinha;

          Say(03,00,LinhaAtual,ArqPrn,sTexto);

          nLinha := 0;
          for nQtde := 0 to nAjuteBobina do
           begin
             Say(nLinha,00,LinhaAtual,ArqPrn,'');
             Inc(nLinha)
           end;

          FimImpressao();

        End
     Else
        Result := False;}

end;

{******************************************************************************}
{***** Finalidade: Realizar a impressão da chancela na saida do veiculo       *}
{******************************************************************************}
Procedure AutenticaReciboSaida(sPlaca,sDataSaida,sHoraSaida,sValor:string);
Var
  sTexto : string;
begin

   sTexto     := sPlaca + '*|*' + sDataSaida + '*|*' + sHoraSaida + '*|*' + sValor;
   LinhaAtual :=0;
	 IniciaImpressao('LPT1');
   Say(00,00,LinhaAtual,ArqPrn,sTexto);
   FimImpressao;

end;

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
function IniciaImpressao(sPortaImp : String):Boolean;
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

end.

