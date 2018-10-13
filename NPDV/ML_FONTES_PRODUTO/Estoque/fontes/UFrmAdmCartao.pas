unit UFrmAdmCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrmAdmCartao = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    EdtNome: TEdit;
    EdtCodTEF: TEdit;
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
    Edit3: TEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdmCartao: TFrmAdmCartao;

implementation

{$R *.dfm}

Uses UBibliotecas, Udm;

procedure TFrmAdmCartao.Botoes(acao: string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmAdmCartao, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmAdmCartao);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmAdmCartao);
         EDedit(FrmAdmCartao, false);
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

procedure TFrmAdmCartao.BtnAlterarClick(Sender: TObject);
begin
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmAdmCartao.BtnCancelarClick(Sender: TObject);
begin
  Botoes('C');
end;

procedure TFrmAdmCartao.BtnExcluirClick(Sender: TObject);
begin
  //excluir(FrmEmpresa, 'empresa', cod_emp, IBSQLEmp, IBTREmp);
  Botoes('E');
end;

procedure TFrmAdmCartao.BtnNovoClick(Sender: TObject);
begin
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmAdmCartao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAdmCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then Close;
end;

procedure TFrmAdmCartao.FormShow(Sender: TObject);
begin
  BtnNovoClick(Self);
end;

end.
