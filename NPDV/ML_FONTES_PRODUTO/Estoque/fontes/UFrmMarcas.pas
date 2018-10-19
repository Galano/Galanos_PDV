unit UFrmMarcas;

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
  TfrmMarcas = class(TForm)
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
    edtCod: TEdit;
    btnFiltro: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Q_Consulta_filtro: TFDQuery;
    Q_Consulta_filtroCODIGO: TIntegerField;
    Q_Consulta_filtroDESCRICAO: TStringField;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCODIGO: TIntegerField;
    Q_Consulta_codDESCRICAO: TStringField;
    procedure Botoes(acao: string);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcas: TfrmMarcas;

implementation

{$R *.dfm}

Uses Udm, UBibliotecas, UConsFrmMarcas;

{ TfrmMarcas }

procedure TfrmMarcas.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(frmMarcas, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(frmMarcas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(frmMarcas);
         EDedit(frmMarcas, false);
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

procedure TfrmMarcas.BtnAlterarClick(Sender: TObject);
begin
  frmMarcas.Tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TfrmMarcas.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TfrmMarcas.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsMarcas,FrmConsMarcas);
  FrmConsMarcas.Tag := 0;
  FrmConsMarcas.Showmodal;
  FrmConsMarcas.Hide;
  FrmConsMarcas.Free;
end;

procedure TfrmMarcas.BtnExcluirClick(Sender: TObject);
begin
  if (excluir('MARCAS', 'CODIGO', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TfrmMarcas.btnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_marcas do
    begin
      Open;
      Filtered := false;
      Filter := 'CODIGO = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_marcas.Close;
  end;
end;

procedure TfrmMarcas.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        Application.MessageBox('Digite o Nome da Marca a ser cadastrada!','Informação', mb_OK+MB_ICONERROR);
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (frmMarcas.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO MARCAS (DESCRICAO) VALUES(:2)');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   MARCAS');
                 sql.Add(' SET');
                 sql.Add('   DESCRICAO  = :2');
                 sql.Add(' WHERE');
                 sql.Add('   MARCAS.CODIGO = :1');
                         Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString   := EdtNome.Text;

           ExecSQL;
        end;
      //DmDados.IBTransaction1.CommitRetaining;
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

      if (frmMarcas.tag = 0) then // Grava um novo reristro
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
        //DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a Classificação!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    {DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;}
  end;
end;

procedure TfrmMarcas.BtnNovoClick(Sender: TObject);
begin
  frmMarcas.Tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TfrmMarcas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMarcas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = vk_Escape) then Close;
end;

procedure TfrmMarcas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TfrmMarcas.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.

