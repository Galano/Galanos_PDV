unit UFrmVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmVendedor = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtNome: TEdit;
    ComboAtivo: TComboBox;
    EdtComissao: TCurrencyEdit;
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
    LinkPropertyToFieldValue: TLinkPropertyToField;
    LinkControlToField2: TLinkControlToField;
    edtCod: TEdit;
    BtnFiltro: TButton;
    Q_Consulta_cod: TFDQuery;
    Q_Consulta_codCOD_VEND: TIntegerField;
    Q_Consulta_codNOME_VEND: TStringField;
    Q_Consulta_codATIVO_VEND: TStringField;
    Q_Consulta_codCOMISSAO_VEND: TBCDField;
    Q_Consulta_filtro: TFDQuery;
    Q_Consulta_filtroCOD_VEND: TIntegerField;
    Q_Consulta_filtroNOME_VEND: TStringField;
    Q_Consulta_filtroATIVO_VEND: TStringField;
    Q_Consulta_filtroCOMISSAO_VEND: TBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFiltroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendedor: TFrmVendedor;
  Nome_ALtera : String;
  Cod_Altera : Integer;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm, UFrmConsVendedor;

procedure TFrmVendedor.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmVendedor, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmVendedor);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmVendedor);
         EDedit(FrmVendedor, false);
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

procedure TFrmVendedor.BtnAlterarClick(Sender: TObject);
begin
  FrmVendedor.tag := 1;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmVendedor.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmVendedor.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsVendedor,FrmConsVendedor);
  FrmConsVendedor.Tag := 0;
  FrmConsVendedor.Showmodal;
  FrmConsVendedor.Hide;
  FrmConsVendedor.Free;

  BtnAlterarClick(Self);
end;

procedure TFrmVendedor.BtnExcluirClick(Sender: TObject);
begin
if (excluir('VENDEDOR', 'COD_VEND', Edit1.Text)) then
  begin
    Botoes('E');
  end;
end;

procedure TFrmVendedor.BtnFiltroClick(Sender: TObject);
begin
  if (edtCod.Text <> '') then
  begin
    with DmDados.tb_vendedor do
    begin
      Open;
      Filtered := false;
      Filter := 'COD_VEND = ' + QuotedStr(trim(edtCod.Text)) ;
      Filtered := true;
    end;
  end
  else
  begin
    DmDados.tb_vendedor.Close;
  end;
end;

procedure TFrmVendedor.BtnGravarClick(Sender: TObject);
begin
    if trim(edtnome.Text) = '' then
     begin
        showmessage('Digite o Nome do vendedor');
        edtnome.SetFocus;
        exit;
     end;

  try
    try
      with DmDados.Q_executa do
        begin
           close;
           sql.Clear;
           if (FrmVendedor.tag = 0) then // Grava um novo reristro
              begin
                 sql.Add('INSERT INTO VENDEDOR(NOME_VEND,ATIVO_VEND,COMISSAO_VEND)' +
                         'VALUES(:2,:3,:4) ');
              end
           else
              begin
                 sql.Add('UPDATE');
                 sql.Add('   VENDEDOR');
                 sql.Add(' SET');
                 sql.Add('   NOME_VEND = :2,');
                 sql.Add('   ATIVO_VEND = :3,');
                 sql.Add('   COMISSAO_VEND = :4');
                 sql.Add(' WHERE');
                 sql.Add('   VENDEDOR.COD_VEND = :1');
                 Parambyname('1').AsInteger     := strtoint(Edit1.Text);
              end;

           Parambyname('2').AsString      := edtnome.Text;
           Parambyname('3').AsString      := copy(ComboAtivo.Text,1 ,1);
           Parambyname('4').AsString      := EdtComissao.Text;

           ExecSQL;
        end;

      if (FrmVendedor.tag = 0) then // Grava um novo reristro
      begin
        Nome_ALtera := edtnome.Text;
      end
      else
      begin
        Cod_Altera := StrToInt(Edit1.Text);
      end;
      // DmDados.IBTransaction1.CommitRetaining;
      DmDados.tb_vendedor.Open;
      DmDados.tb_vendedor.Refresh;

      Botoes('G');

      with Q_Consulta_cod do
      begin
        Close;
        ParamByName('nm').Value := EdtNome.Text;
        Open;
      end;

      if (Q_Consulta_cod.RecordCount > 0) then
      begin
        Edit1.Text := Trim(Q_Consulta_codCOD_VEND.AsString);
      end;

      if (FrmVendedor.tag = 0) then // Grava um novo reristro
      begin
        with DmDados.tb_vendedor do
        begin
          Filtered := false;
          Filter   := 'NOME_VEND = '+QuotedStr(Nome_ALtera);
          Filtered := true;
          Edit1.Text := DmDados.tb_vendedorCOD_VEND.AsString;
          Filtered := false;
        end;

        Application.MessageBox('Cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end
      else
      begin
        with DmDados.tb_vendedor do
        begin
          Filtered := false;
          Filter   := 'COD_VEND = '+QuotedStr(intToStr(Cod_Altera));
          Filtered := true;
          Edit1.Text := DmDados.tb_vendedorCOD_VEND.AsString;
          //Filtered := false;
        end;

        Application.MessageBox('Alteração no cadastro realizado com sucesso!','Informação', mb_OK+MB_ICONINFORMATION);
      end;


    except
      on e: exception do
      begin
        // DmDados.IBTransaction1.RollbackRetaining;
        Application.MessageBox(Pchar('Erro ao gravar a vendedor!'+#13+#13+e.Message),'Informação', mb_OK+MB_ICONERROR);
      end;
    end;
  finally
    DmDados.tb_empresa.Close;
    DmDados.tb_empresa.Open;
  end;
end;

procedure TFrmVendedor.BtnNovoClick(Sender: TObject);
begin
  FrmVendedor.tag := 0;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmVendedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendedor.Edit1Change(Sender: TObject);
begin
  if (Tag = 1) then
  begin
    with DmDados.tb_vendedor do
    begin
      Filtered := false;
      Filter   := 'COD_VEND = '+QuotedStr(Edit1.Text);
      Filtered := true;
    end;
  end;

  if (DmDados.tb_vendedorATIVO_VEND.Value = 'S') then
  begin
    ComboAtivo.ItemIndex := 0;
  end
  else
  begin
    ComboAtivo.ItemIndex := 1;
  end;

end;

procedure TFrmVendedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmVendedor.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
