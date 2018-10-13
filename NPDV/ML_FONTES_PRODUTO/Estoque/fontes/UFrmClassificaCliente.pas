unit UFrmClassificaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmClassificaCliente = class(TForm)
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
    SB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Edit1: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure BtnNovoClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClassificaCliente: TFrmClassificaCliente;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsClassifica;

procedure TFrmClassificaCliente.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmClassificaCliente, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmClassificaCliente);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmClassificaCliente);
         EDedit(FrmClassificaCliente, false);
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

procedure TFrmClassificaCliente.BtnAlterarClick(Sender: TObject);
begin
  FrmClassificaCliente.tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmClassificaCliente.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmClassificaCliente.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClassifica,FrmConsClassifica);
  FrmConsClassifica.Tag := 0;
  DmDados.tb_classifica_cliente.Open;
  FrmConsClassifica.Showmodal;
  FrmConsClassifica.Hide;
  FrmConsClassifica.Free;
end;

procedure TFrmClassificaCliente.BtnExcluirClick(Sender: TObject);
begin
if (excluir('CLASSIF_CLIENTE', 'COD_CLA', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmClassificaCliente.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome a Razão Social do Fornecedor!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmClassificaCliente.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO CLASSIF_CLIENTE(NOME_CLA) VALUES(:2)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   CLASSIF_CLIENTE');
                 sql.Add(' SET');
                 sql.Add('   NOME_CLA  = :2');
                 sql.Add(' WHERE');
                 sql.Add('   CLASSIF_CLIENTE.COD_CLA = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;

           ExecSQL;
        end;
      DmDados.IBTransaction1.CommitRetaining;
      Botoes('G');

      if (FrmClassificaCliente.tag = 0) then // Grava um novo reristro
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

procedure TFrmClassificaCliente.BtnNovoClick(Sender: TObject);
begin
  FrmClassificaCliente.tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmClassificaCliente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmClassificaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_Escape) then Close;
end;

procedure TFrmClassificaCliente.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
