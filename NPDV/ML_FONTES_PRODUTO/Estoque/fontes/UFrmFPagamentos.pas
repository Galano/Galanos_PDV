unit UFrmFPagamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmFPagamentos = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
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
    Edit1: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    edtCod: TEdit;
    btnFiltro: TButton;
    Q_Consulta_cod: TIBQuery;
    Q_Consulta_filtro: TIBQuery;
    Q_Consulta_filtroCOD_SEC: TIntegerField;
    Q_Consulta_filtroNOME_SEC: TIBStringField;
    Q_Consulta_codCODIGO: TIntegerField;
    Q_Consulta_codDESCRICAO: TIBStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFPagamentos: TFrmFPagamentos;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsfPagamentos;

procedure TFrmFPagamentos.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmFPagamentos, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmFPagamentos);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmFPagamentos);
         EDedit(FrmFPagamentos, false);
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

procedure TFrmFPagamentos.BtnAlterarClick(Sender: TObject);
begin
  FrmFPagamentos.Tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmFPagamentos.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmFPagamentos.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsfPagamentos,FrmConsfPagamentos);
  FrmConsfPagamentos.Tag := 0;
  FrmConsfPagamentos.Showmodal;
  FrmConsfPagamentos.Hide;
  FrmConsfPagamentos.Free;
end;

procedure TFrmFPagamentos.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('FORMAS_PAGAMENTO', 'CODIGO', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmFPagamentos.btnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_fpagamentos do
    begin
      Open;
      Filtered := false;
      Filter := 'CODIGO = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_fpagamentos.Close;
  end;
end;

procedure TFrmFPagamentos.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome da Forma de Pagamento a ser cadastrada!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmFPagamentos.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO FORMAS_PAGAMENTO (DESCRICAO) VALUES(:2)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   FORMAS_PAGAMENTO');
                 sql.Add(' SET');
                 sql.Add('   DESCRICAO  = :2');
                 sql.Add(' WHERE');
                 sql.Add('   FORMAS_PAGAMENTO.CODIGO = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;

           ExecSQL;
        end;
      DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');

      with Q_Consulta_cod do
      begin
        Close;
        ParamByName('nm').Value := EdtNome.Text;
        Open;
      end;

      if (Q_Consulta_cod.RecordCount > 0) then
      begin
        Edit1.Text := Trim(Q_Consulta_codCODIGO.AsString);
      end;

      if (FrmFPagamentos.tag = 0) then // Grava um novo reristro
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
        DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Classificação!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmFPagamentos.BtnNovoClick(Sender: TObject);
begin
  FrmFPagamentos.Tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmFPagamentos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFPagamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmFPagamentos.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
