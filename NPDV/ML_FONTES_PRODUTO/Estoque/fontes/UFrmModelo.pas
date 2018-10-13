unit UFrmModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmModelo = class(TForm)
    SB: TStatusBar;
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
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsMot: TSpeedButton;
    BtnAddMot: TSpeedButton;
    Label22: TLabel;
    Label3: TLabel;
    BtnConsLocal: TSpeedButton;
    BtnAddLocal: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    EdtData: TDateTimePicker;
    EdtNomeMot: TEdit;
    MemoOBS: TMemo;
    EdtNomeLocal: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModelo: TFrmModelo;

implementation

{$R *.dfm}

end.
