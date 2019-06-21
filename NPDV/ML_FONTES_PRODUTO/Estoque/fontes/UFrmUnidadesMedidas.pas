unit UFrmUnidadesMedidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmUnidadesMedidas = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Edit1: TEdit;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    edtCod: TEdit;
    btnFiltro: TButton;
    Panel3: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCODIGO: TIntegerField;
    Q_Consulta_codDESCRICAO: TStringField;
    Q_Consulta_filtro: TFDQuery;
    Q_Consulta_filtroCODIGO: TIntegerField;
    Q_Consulta_filtroDESCRICAO: TStringField;
    procedure Botoes(acao: string);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUnidadesMedidas: TFrmUnidadesMedidas;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UFrmConsUnidMedidas;

{ TFrmUnidadesMedidas }

procedure TFrmUnidadesMedidas.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmUnidadesMedidas, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmUnidadesMedidas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmUnidadesMedidas);
         EDedit(FrmUnidadesMedidas, false);
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

procedure TFrmUnidadesMedidas.BtnAlterarClick(Sender: TObject);
begin
  FrmUnidadesMedidas.Tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmUnidadesMedidas.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmUnidadesMedidas.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsUnidMedidas,FrmConsUnidMedidas);
  FrmConsUnidMedidas.Tag := 0;
  FrmConsUnidMedidas.Showmodal;
  FrmConsUnidMedidas.Hide;
  FrmConsUnidMedidas.Free;
end;

procedure TFrmUnidadesMedidas.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('UNIDADE_MEDIDA', 'CODIGO', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmUnidadesMedidas.btnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_UnidadesMedidas do
    begin
      Open;
      Filtered := false;
      Filter := 'CODIGO = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_UnidadesMedidas.Close;
  end;
end;

procedure TFrmUnidadesMedidas.BtnGravarClick(Sender: TObject);
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
           if (FrmUnidadesMedidas.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO UNIDADE_MEDIDA (DESCRICAO) VALUES(:2)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   UNIDADE_MEDIDA');
                 sql.Add(' SET');
                 sql.Add('   DESCRICAO  = :2');
                 sql.Add(' WHERE');
                 sql.Add('   UNIDADE_MEDIDA.CODIGO = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;

           ExecSQL;
        end;
      // DmDados.IBTransaction1.CommitRetaining;
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

      if (FrmUnidadesMedidas.tag = 0) then // Grava um novo reristro
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
        // DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Classificação!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TFrmUnidadesMedidas.BtnNovoClick(Sender: TObject);
begin
  FrmUnidadesMedidas.Tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmUnidadesMedidas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUnidadesMedidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmUnidadesMedidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmUnidadesMedidas.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
