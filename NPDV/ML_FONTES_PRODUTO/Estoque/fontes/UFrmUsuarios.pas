unit UFrmUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmUsuarios = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    ImageList: TImageList;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtNome: TEdit;
    EdtSenha: TEdit;
    CheckOperador: TCheckBox;
    cod_usu: TEdit;
    SB: TStatusBar;
    DBGrid1: TDBGrid;
    edtCod: TEdit;
    btnFiltro: TButton;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCOD_USU: TIntegerField;
    Q_Consulta_codNOME_USU: TStringField;
    Q_Consulta_codSENHA_USU: TStringField;
    Q_Consulta_codCOD_EMPR: TIntegerField;
    Q_Consulta_codOPERADOR_CAIXA: TStringField;
    procedure Botoes(acao: string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas;

{ TFrmUsuarios }

procedure TFrmUsuarios.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmUsuarios, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmUsuarios);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmUsuarios);
         EDedit(FrmUsuarios, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmUsuarios.BtnAlterarClick(Sender: TObject);
begin
  FrmUsuarios.Tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmUsuarios.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmUsuarios.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('USUARIO', 'COD_USU', DmDados.tb_usuariosCOD_USU.AsString)) then
  begin
    Botoes('E');
  end;
  DmDados.tb_usuarios.Close;
  DmDados.tb_usuarios.Open;
end;

procedure TFrmUsuarios.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome do Usuário a ser cadastrada!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmUsuarios.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO USUARIO(NOME_USU,SENHA_USU,COD_EMPR,OPERADOR_CAIXA) VALUES(:2,:3,:4,:5)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   USUARIO');
                 sql.Add(' SET');
                 sql.Add('   NOME_USU  = :2,');
                 sql.Add('   SENHA_USU  = :3,');
                 sql.Add('   COD_EMPR  = :4,');
                 sql.Add('   OPERADOR_CAIXA  = :5');
                 sql.Add(' WHERE');
                 sql.Add('   USUARIO.COD_USU = :1');
                         Parambyname('1').AsInteger     := strtoint(cod_usu.Text);
              end;

           Parambyname('2').Value   := EdtNome.Text;
           Parambyname('3').Value   := EdtSenha.Text;
           Parambyname('4').Value   := 1;

           if (CheckOperador.Checked) then
           begin
            Parambyname('5').Value   := 'S';
           end
           else
           begin
            Parambyname('5').Value   := 'N';
           end;

           ExecSQL;
        end;

      //// DmDados.IBTransaction1.CommitRetaining;
      DmDados.tb_usuarios.Close;
      DmDados.tb_usuarios.Open;
      Botoes('G');

      with Q_Consulta_cod do
      begin
        Close;
        ParamByName('nm').Value := EdtNome.Text;
        Open;
      end;

      if (Q_Consulta_cod.RecordCount > 0) then
      begin
        cod_usu.Text := Trim(Q_Consulta_codCOD_USU.AsString);
      end;

      if (FrmUsuarios.tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;

    except
      on e: exception do
      begin
        //// DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Classificação!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;

end;

procedure TFrmUsuarios.BtnNovoClick(Sender: TObject);
begin
  FrmUsuarios.Tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmUsuarios.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  cod_usu.Text := DmDados.tb_usuariosCOD_USU.AsString;
  EdtNome.Text := DmDados.tb_usuariosNOME_USU.AsString;
  EdtSenha.Text := DmDados.tb_usuariosSENHA_USU.AsString;
  if (DmDados.tb_usuariosOPERADOR_CAIXA.Value = 'S') then
  begin
    CheckOperador.Checked := True;
  end
  else
  begin
    CheckOperador.Checked := False;
  end;

  BtnAlterarClick(Self);
end;

procedure TFrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_Escape) then Close;
end;

procedure TFrmUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
