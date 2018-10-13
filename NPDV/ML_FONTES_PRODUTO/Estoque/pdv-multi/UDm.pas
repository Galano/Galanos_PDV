unit UDm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  IBX.IBDatabase, Data.DB, IniFiles, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable;

type
  TDmDados = class(TDataModule)
    conexao: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tb_fpagamentos: TIBTable;
    tb_fpagamentosCODIGO: TIntegerField;
    tb_fpagamentosDESCRICAO: TIBStringField;
    Dts_fPagamentos: TDataSource;
    Dts_clientes: TDataSource;
    tb_clientes: TIBTable;
    tb_clientesCOD_CLI: TIntegerField;
    tb_clientesNOME_CLI: TIBStringField;
    tb_clientesCOD_CLA: TIntegerField;
    tb_clientesENDRES_CLI: TIBStringField;
    tb_clientesBAIRES_CLI: TIBStringField;
    tb_clientesCIDRES_CLI: TIBStringField;
    tb_clientesESTRES_CLI: TIBStringField;
    tb_clientesCEPRES_CLI: TIBStringField;
    tb_clientesTELRES_CLI: TIBStringField;
    tb_clientesCPF_CLI: TIBStringField;
    tb_clientesRG_CLI: TIBStringField;
    tb_clientesAPELIDO_CLI: TIBStringField;
    tb_clientesLIMITE_CLI: TIBBCDField;
    tb_clientesATIVO_CLI: TIBStringField;
    tb_clientesOBS_CLI: TIBStringField;
    tb_clientesNASCIMENTO_CLI: TDateField;
    tb_clientesDATACADASTRO_CLI: TDateField;
    tb_clientesATRAZO_MAXIMO_CLI: TIntegerField;
    tb_clientesCELULAR_CLI: TIBStringField;
    tb_clientesIMP_SALDO_PENDENTE_CLI: TIBStringField;
    tb_clientesLIMITE_CHEQUE: TIBBCDField;
    tb_clientesCONTATO_CLI: TIBStringField;
    tb_clientesCONTROLAR_LIMITE: TIBStringField;
    tb_clientesEMAIL_CLI: TIBStringField;
    Dts_vendedor: TDataSource;
    tb_vendedor: TIBTable;
    tb_vendedorCOD_VEND: TIntegerField;
    tb_vendedorNOME_VEND: TIBStringField;
    tb_vendedorATIVO_VEND: TIBStringField;
    tb_vendedorCOMISSAO_VEND: TIBBCDField;
    Dts_empresa: TDataSource;
    tb_empresa: TIBTable;
    tb_empresaCOD_EMP: TIntegerField;
    tb_empresaRAZAO_EMP: TIBStringField;
    tb_empresaEND_EMP: TIBStringField;
    tb_empresaBAI_EMP: TIBStringField;
    tb_empresaCID_EMP: TIBStringField;
    tb_empresaCEP_EMP: TIBStringField;
    tb_empresaEST_EMP: TIBStringField;
    tb_empresaINSC_EMP: TIBStringField;
    tb_empresaTEL_EMP: TIBStringField;
    tb_empresaFAX_EMP: TIBStringField;
    tb_empresaNUMERO_EMP: TIBStringField;
    tb_empresaRESP_EMP: TIBStringField;
    tb_empresaCAMINHO_FOTO_EMP: TIBStringField;
    tb_empresaFANTASIA_EMP: TIBStringField;
    tb_empresaCNPJ_EMP: TIBStringField;
    tb_empresaCAMINHO_VALIDADOR_SINTEGRA: TIBStringField;
    tb_empresaINSCRICAO_MUNICIPAL: TIBStringField;
    Q_Consulta: TIBQuery;
    Q_executa: TIBQuery;
    QLogin: TIBQuery;
    QLoginCOD_USU: TIntegerField;
    QLoginNOME_USU: TIBStringField;
    QLoginSENHA_USU: TIBStringField;
    QLoginCOD_EMPR: TIntegerField;
    QLoginOPERADOR_CAIXA: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;
  iniconf: Tinifile;
  iniConf2: TiniFile;
  arq: string;
  ini_arq, ini_configuracoes, vHost, vPatch: string;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDmDados.DataModuleCreate(Sender: TObject);
begin
    ini_arq := Copy(ExtractFileDir(ParamStr(0)), 1, LastDelimiter('\', ExtractFileDir(ParamStr(0)))) + 'config\' + 'dbconnections.ini';
    iniConf := TIniFile.Create(ini_arq);

    arq := ExtractFilePath(ParamStr(0)) + 'dbconnections.ini';

    Conexao.Connected := False;
    if (FileExists(ini_arq)) then
    begin
        try
            if (Iniconf.ReadString('Base', 'host', '') = '') then
            begin
                Conexao.Connected := False;
                Conexao.DatabaseName := '';
                Conexao.DatabaseName := 'localhost' + ':' + Iniconf.ReadString('Base', 'Caminho', '');
            end
            else
            begin
                Conexao.Connected := False;
                Conexao.DatabaseName := '';
                Conexao.DatabaseName := Iniconf.ReadString('Base', 'host', '') + ':' + Iniconf.ReadString('Base', 'Caminho', '');
            end;

            Conexao.Params.Values['user_name = SYSDBA'];
            Conexao.Params.Values['password = masterkey'];
            Conexao.Connected := True;
            //Showmessage('Conectado!!!!!!!');
            tb_empresa.Open;


          //doSaveLog('Conectou ao banco de dados!');
        except
            begin
                MessageDlg('ERRO #015' + #13 + #13 + 'Não foi possível se conectar ao banco de dados!', System.UITypes.TMsgDlgType.mtError,
                [
                  System.UITypes.TMsgDlgBtn.mbOK
                ], 0,
                procedure(const AResult: System.UITypes.TModalResult)
                begin
                  case AResult of
                    mrOk:
                      {$IFDEF WIN32}
                        Application.Terminate;
                      {$ENDIF}
                  end;
                end);
            end;
        end;
    end
    else
    begin
    MessageDlg('Arquivo de conexão não localizado.', System.UITypes.TMsgDlgType.mtError,
    [
      System.UITypes.TMsgDlgBtn.mbOK
    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
      case AResult of
        mrOk:
          {$IFDEF WIN32}
            Application.Terminate;
          {$ENDIF}
      end;
    end);
  end;
end;

end.
