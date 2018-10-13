unit UFrmSecaoGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmSecaoGrupo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Edit1: TEdit;
    PG: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label30: TLabel;
    DBGrid1: TDBGrid;
    EdtNomeGrupo: TEdit;
    BtnGravaGrupo: TButton;
    BtnExcluiGrupo: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    EdtNomeSubGrupo: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Bevel1: TBevel;
    ImageList: TImageList;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    Q_Consulta_cod: TIBQuery;
    Q_Consulta_filtro: TIBQuery;
    Q_Consulta_filtroCOD_SEC: TIntegerField;
    Q_Consulta_filtroNOME_SEC: TIBStringField;
    Q_Consulta_codCOD_SEC: TIntegerField;
    Q_Consulta_codNOME_SEC: TIBStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    edtCod: TEdit;
    BtnFiltro: TButton;
    QOrdem: TIBQuery;
    QGrupo: TIBQuery;
    QGrupoCOD_SEC: TIntegerField;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESCRICAO: TIBStringField;
    DSGrupo: TDataSource;
    QSub: TIBQuery;
    QSubCOD_SEC: TIntegerField;
    QSubCOD_GRUPO: TIntegerField;
    QSubCOD_SUBGRUPO: TIntegerField;
    QSubDESCRICAO: TIBStringField;
    DSSub: TDataSource;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Habilita_Grupos;
    procedure Desabilita_Grupos;
    procedure BtnFiltroClick(Sender: TObject);
    function  OrdemGrupo : integer;
    function  OrdemSubGrupo : integer;
    procedure BuscaGrupo;
    procedure BuscaSubGrupo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravaGrupoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnExcluiGrupoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSecaoGrupo: TFrmSecaoGrupo;
  bGravaGrupo, bGravaSubGrupo : Integer;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsSecao;

procedure TFrmSecaoGrupo.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmSecaoGrupo, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmSecaoGrupo);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmSecaoGrupo);
         EDedit(FrmSecaoGrupo, false);
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

procedure TFrmSecaoGrupo.BtnAlterarClick(Sender: TObject);
begin
  FrmSecaoGrupo.tag := 1;
  Botoes('A');
  edtnome.SetFocus;
  Habilita_Grupos;
end;

procedure TFrmSecaoGrupo.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
  Desabilita_Grupos;
end;

procedure TFrmSecaoGrupo.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSecao,FrmConsSecao);
  FrmConsSecao.Tag := 0;
  FrmConsSecao.Showmodal;
  FrmConsSecao.Hide;
  FrmConsSecao.Free;
end;

procedure TFrmSecaoGrupo.BtnExcluiGrupoClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a Exclusão do Grupo?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         try
           try
             with DmDados.Q_executa do
                begin
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM SECAO_GRUPO ' +
                           'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
                   Parambyname('codsec').AsInteger   := QGrupoCOD_SEC.AsInteger;
                   Parambyname('codgrupo').AsInteger := QGrupoCOD_GRUPO.AsInteger;
                   ExecSQL;
                end;
             DmDados.IBTransaction1.CommitRetaining;
           except
             DmDados.IBTransaction1.Rollback;
             showmessage('Erro ao excluir o grupo');
           end;
         finally
           DmDados.Q_executa.Close;
           BuscaGrupo;
           BuscaSubGrupo;
         end;
      end;

end;

procedure TFrmSecaoGrupo.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('COD_SEC', 'SECAO', Edit1.Text)) then
  begin
    Botoes('E');
  end;
  Desabilita_Grupos;
end;

procedure TFrmSecaoGrupo.BtnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_secao do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_SEC = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
    BuscaGrupo;
    BuscaSubGrupo;
  end
  else
  begin
    DmDados.tb_secao.Close;
  end;
end;

procedure TFrmSecaoGrupo.BtnGravaGrupoClick(Sender: TObject);
begin
   if trim(EdtNomeGrupo.Text) = '' then
      begin
         Application.MessageBox('Digite o nome do grupo','Informação', mb_OK+MB_ICONERROR);
         EdtNomeGrupo.SetFocus;
         exit;
      end;

   try
     try
       with DmDados.Q_executa do
          begin
             close;
             sql.Clear;
             if bGravaGrupo = 0 then
                begin
                   sql.Add('INSERT INTO SECAO_GRUPO(COD_SEC, DESCRICAO) ' +
                           'VALUES (:1, :3)');

                   {if trim(Edit2.Text) = '' then
                      Parambyname('2').AsInteger:= OrdemGrupo
                   else
                      Parambyname('2').AsInteger:= strtoint(Edit2.);}
                end
             else
                begin
                   sql.Add('UPDATE SECAO_GRUPO SET DESCRICAO = :3 ' +
                           'WHERE COD_SEC = :1 AND COD_GRUPO = :2');
                   Parambyname('2').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
                end;
             Parambyname('1').AsInteger:= strtoint(Edit1.Text);
             Parambyname('3').AsString:= trim(EdtNomeGrupo.Text);
             ExecSQL;
          end;

      if (bGravaGrupo = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro do grupo realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro do grupo realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;

       DmDados.IBTransaction1.CommitRetaining;
       bGravaSubGrupo := 0;

     except
       DmDados.IBTransaction1.RollbackRetaining;
       showmessage('Erro ao gravar o grupo');
     end;
   finally
     bGravaGrupo := 0;
     BuscaGrupo;
     BuscaSubGrupo;
     Edit2.Clear;
     EdtNomeGrupo.Clear;
     Edit2.ReadOnly:= false;
     EdtNomeGrupo.SetFocus;
   end;

end;

procedure TFrmSecaoGrupo.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome da Seçao a ser cadastrada!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmSecaoGrupo.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO SECAO (NOME_SEC) VALUES(:2)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   SECAO');
                 sql.Add(' SET');
                 sql.Add('   NOME_SEC  = :2');
                 sql.Add(' WHERE');
                 sql.Add('   SECAO.COD_SEC = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;

           ExecSQL;
        end;
      DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');
      edtCod.Enabled := true;

      with Q_Consulta_cod do
      begin
        Close;
        ParamByName('nm').Value := EdtNome.Text;
        Open;
      end;

      if (Q_Consulta_cod.RecordCount > 0) then
      begin
        Edit1.Text := Trim(Q_Consulta_codCOD_SEC.AsString);
      end;

      if (FrmSecaoGrupo.tag = 0) then // Grava um novo reristro
      begin
        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;

      Habilita_Grupos;
      bGravaGrupo := 0;
    except
      on e: exception do
      begin
        DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Classificação!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmSecaoGrupo.BtnNovoClick(Sender: TObject);
begin
  FrmSecaoGrupo.tag := 0;
  Botoes('N');
  edtnome.SetFocus;
  Desabilita_Grupos;
end;

procedure TFrmSecaoGrupo.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSecaoGrupo.BuscaGrupo;
begin
    with QGrupo do
    begin
       close;
       parambyname('codsec').AsInteger:= strtoint(Edit1.Text);
       open;
    end;
end;

procedure TFrmSecaoGrupo.BuscaSubGrupo;
begin
  with QSub do
  begin
     close;
     parambyname('codsec').AsInteger  := QGrupoCOD_SEC.AsInteger;
     parambyname('codgrupo').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
     open;
  end;
end;

procedure TFrmSecaoGrupo.Button1Click(Sender: TObject);
begin
   if trim(EdtNomeSubGrupo.Text) = '' then
      begin
         Application.MessageBox('Digite o nome do subgrupo','Informação', mb_OK+MB_ICONERROR);
         EdtNomeSubGrupo.SetFocus;
         exit;
      end;

   try
     try
       with DmDados.Q_executa do
          begin
             close;
             sql.Clear;
             if (bGravaSubGrupo = 0) then
                begin
                   sql.Add('INSERT INTO SECAO_GRUPO_SUBGRUPO(COD_SEC, COD_GRUPO, DESCRICAO) ' +
                           'VALUES (:1, :2, :4)');

                   {if trim(EdtCodSubGrupo.Text) = '' then
                      Parambyname('3').AsInteger:= OrdemSubGrupo
                   else
                      Parambyname('3').AsInteger:= strtoint(EdtCodSubGrupo.Text);}
                end
             else
                begin
                   sql.Add('UPDATE SECAO_GRUPO_SUBGRUPO SET DESCRICAO = :4 ' +
                           'WHERE COD_SEC = :1 AND COD_GRUPO = :2 AND COD_SUBGRUPO = :3');
                   Parambyname('3').AsInteger:= QSubCOD_SUBGRUPO.AsInteger;
                end;
             Parambyname('1').AsInteger:= QGrupoCOD_SEC.AsInteger;
             Parambyname('2').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
             Parambyname('4').AsString := trim(EdtNomeSubGrupo.Text);
             ExecSQL;
          end;
       DmDados.IBTransaction1.CommitRetaining;
     except
       DmDados.IBTransaction1.RollbackRetaining;
       showmessage('Erro ao gravar o SubGrupo');
     end;
   finally
     bGravaSubGrupo := 0;
     BuscaSubGrupo;
     Edit3.Clear;
     EdtNomeSubGrupo.Clear;
     Edit3.ReadOnly:= false;
     EdtNomeSubGrupo.SetFocus;
   end;

end;

procedure TFrmSecaoGrupo.Button2Click(Sender: TObject);
begin
   if Application.MessageBox('Confirma a Exclusão do SubGrupo?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         try
           try
             with DmDados.Q_executa do
                begin
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM SECAO_GRUPO_SUBGRUPO ' +
                           'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO AND COD_SUBGRUPO = :SUBGRUPO');
                   Parambyname('codsec').AsInteger   := QSubCOD_SEC.AsInteger;
                   Parambyname('codgrupo').AsInteger := QSubCOD_GRUPO.AsInteger;
                   Parambyname('subgrupo').AsInteger := QSubCOD_SUBGRUPO.AsInteger;
                   ExecSQL;
                end;
             DmDados.IBTransaction1.CommitRetaining;
           except
             DmDados.IBTransaction1.RollbackRetaining;
             showmessage('Erro ao excluir o SubGrupo');
           end;
         finally
           DmDados.Q_executa.Close;
           BuscaSubGrupo;
         end;
      end;
end;

procedure TFrmSecaoGrupo.DBGrid1CellClick(Column: TColumn);
begin
  BuscaSubGrupo;
end;

procedure TFrmSecaoGrupo.DBGrid1DblClick(Sender: TObject);
begin
   bGravaGrupo := 1;
   Habilita_Grupos;
   Edit2.ReadOnly := true;
   Edit2.Text     := QGrupoCOD_GRUPO.AsString;
   EdtNomeGrupo.Text    := QGrupoDESCRICAO.AsString;
   EdtNomeGrupo.SetFocus;
end;

procedure TFrmSecaoGrupo.DBGrid2DblClick(Sender: TObject);
begin
  bGravaSubGrupo := 1;
  Edit3.ReadOnly := true;
  Edit3.Text     := QSubCOD_SUBGRUPO.AsString;
  EdtNomeSubGrupo.Text    := QSubDESCRICAO.AsString;
  EdtNomeSubGrupo.SetFocus;
end;

procedure TFrmSecaoGrupo.Desabilita_Grupos;
begin
 //if (TabSheet1.Enabled = true) then
  //begin
    PG.Enabled := false;
    TabSheet1.Enabled := false;
    Panel2.Enabled := false;
    Panel3.Enabled := false;
    EdtNomeGrupo.Enabled := false;
    EdtNomeSubGrupo.Enabled := false;
    Edit2.Color := clBtnFace;
    EdtNomeGrupo.Color := clBtnFace;
    Edit3.Color := clBtnFace;
    EdtNomeSubGrupo.Color := clBtnFace;
  //end;
end;

procedure TFrmSecaoGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QGrupo.Close;
   QSub.Close;
   Action:= caFree;
end;

procedure TFrmSecaoGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmSecaoGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFrmSecaoGrupo.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
  if (Edit1.Text <> '') then
  begin
    BuscaGrupo;
    BuscaSubGrupo;
  end;
end;

procedure TFrmSecaoGrupo.Habilita_Grupos;
begin
 //if (TabSheet1.Enabled = false) then
  //begin
    PG.Enabled := true;
    TabSheet1.Enabled := true;
    Panel2.Enabled := true;
    Panel3.Enabled := true;
    EdtNomeGrupo.Enabled := true;
    EdtNomeSubGrupo.Enabled := true;
    Edit2.Color := clYellow;
    EdtNomeGrupo.Color := clWhite;
    Edit3.Color := clYellow;
    EdtNomeSubGrupo.Color := clWhite;
    EdtNomeGrupo.SetFocus;
  //end;
end;

function TFrmSecaoGrupo.OrdemGrupo: integer;
begin
   with QOrdem do
      begin
         close;
         sql.Clear;
         sql.add('SELECT MAX(COD_GRUPO) CODIGO ' +
                 'FROM SECAO_GRUPO ' +
                 'WHERE COD_SEC = :CODSEC');
         Parambyname('codsec').AsInteger:= strtoint(Edit1.Text);
         Open;
         result:= fieldbyname('codigo').AsInteger + 1;
      end;
   //DmDados.IBTransaction1.CommitRetaining;
   QOrdem.Close;
end;

function TFrmSecaoGrupo.OrdemSubGrupo: integer;
begin
  with QOrdem do
      begin
         close;
         sql.Clear;
         sql.add('SELECT MAX(COD_SUBGRUPO) CODIGO ' +
                 'FROM SECAO_GRUPO_SUBGRUPO ' +
                 'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
         Parambyname('codsec').AsInteger   := QGrupoCOD_SEC.AsInteger;;
         Parambyname('codgrupo').AsInteger := QGrupoCOD_GRUPO.AsInteger;;
         Open;
         result:= fieldbyname('codigo').AsInteger + 1;
      end;
   DmDados.IBTransaction1.CommitRetaining;
   QOrdem.Close;
end;

end.
