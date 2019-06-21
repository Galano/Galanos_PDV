program EstoqueAll;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UFrmModelo in 'UFrmModelo.pas' {FrmModelo},
  UClientes in 'UClientes.pas' {FrmClientes},
  UEmpresa in 'UEmpresa.pas' {FrmEmpresa},
  UFuncoes in 'UFuncoes.pas',
  UFornecedor in 'UFornecedor.pas' {FrmFornecedor},
  UFrmVendedor in 'UFrmVendedor.pas' {FrmVendedor},
  UFrmProdutos in 'UFrmProdutos.pas' {FrmProdutos},
  UFrmSecaoGrupo in 'UFrmSecaoGrupo.pas' {FrmSecaoGrupo},
  UFrmFPagamentos in 'UFrmFPagamentos.pas' {FrmFPagamentos},
  UFrmAdmCartao in 'UFrmAdmCartao.pas' {FrmAdmCartao},
  Ubibliotecas in 'Ubibliotecas.pas',
  Udm in 'Udm.pas' {DmDados: TDataModule},
  UFrmClassificaCliente in 'UFrmClassificaCliente.pas' {FrmClassificaCliente},
  UFrmConsClassifica in 'UFrmConsClassifica.pas' {FrmConsClassifica},
  UFrmConsSecao in 'UFrmConsSecao.pas' {FrmConsSecao},
  UFrmConsfPagamentos in 'UFrmConsfPagamentos.pas' {FrmConsfPagamentos},
  UFrmUnidadesMedidas in 'UFrmUnidadesMedidas.pas' {FrmUnidadesMedidas},
  UFrmConsUnidMedidas in 'UFrmConsUnidMedidas.pas' {FrmConsUnidMedidas},
  UFrmConsFornecedor in 'UFrmConsFornecedor.pas' {FrmConsFornecedor},
  UFrmConsVendedor in 'UFrmConsVendedor.pas' {FrmConsVendedor},
  UFrmConsProduto in 'UFrmConsProduto.pas' {FrmConsProduto},
  UFrmMarcas in 'UFrmMarcas.pas' {frmMarcas},
  UConsFrmMarcas in 'UConsFrmMarcas.pas' {FrmConsMarcas},
  UFrmConsGrupo in 'UFrmConsGrupo.pas' {FrmConsGrupo},
  UFrmConsSubGrupo in 'UFrmConsSubGrupo.pas' {FrmConsSubGrupo},
  UFrmRelForn in 'UFrmRelForn.pas' {FrmRelForn},
  UQRelCadFor in 'UQRelCadFor.pas' {FrmQRelCadFor},
  UFrmRelClientes in 'UFrmRelClientes.pas' {FrmRelClientes},
  UFrmQRelCliGeral in 'UFrmQRelCliGeral.pas' {FrmQRelCliGeral},
  UFrmRelSecao in 'UFrmRelSecao.pas' {FrmRelSecao},
  UFrmRelProdutos in 'UFrmRelProdutos.pas' {FrmRelProdutos},
  UQRelEstoque in 'UQRelEstoque.pas' {FrmQRelEstoque},
  UFrmRelClientesG in 'UFrmRelClientesG.pas' {FrmRelClassifica},
  UFrmRelVendedores in 'UFrmRelVendedores.pas' {FrmRelVendedores},
  UQRelVendedores in 'UQRelVendedores.pas' {QRelVendedores},
  UFrmQRelCadClassif in 'UFrmQRelCadClassif.pas' {FrmQRelCadClassif},
  UFrmRelSecaoGrupo in 'UFrmRelSecaoGrupo.pas' {FrmRelSecaoGrupo},
  UFrmQRelSec in 'UFrmQRelSec.pas' {FrmQRelSec},
  UFrmRelMarcas in 'UFrmRelMarcas.pas' {FrmRelMarcas},
  UFrmQRelMarcas in 'UFrmQRelMarcas.pas' {FrmQRelMarcas},
  UFrmOutrasEntradas in 'UFrmOutrasEntradas.pas' {FrmOutrasEntradas},
  UFrmConsOutrasEntradas in 'UFrmConsOutrasEntradas.pas' {FrmConsOutrasEntradas},
  UFrmRelEiquetas in 'UFrmRelEiquetas.pas' {FrmRelEiquetas},
  UFrmConsClientes01 in 'UFrmConsClientes01.pas' {FrmConsClientes01},
  UFrmOutrasSaidas in 'UFrmOutrasSaidas.pas' {FrmOutrasSaidas},
  UFrmConsOutrasSaidas in 'UFrmConsOutrasSaidas.pas' {FrmConsOutrasSaidas},
  UFrmRelCodBarras in 'UFrmRelCodBarras.pas' {FrmRelCodBarras},
  UFrmConsultaEstoque in 'UFrmConsultaEstoque.pas' {FrmConsultaEstoque},
  UFrmQRelEstoquePrecoVenda in 'UFrmQRelEstoquePrecoVenda.pas' {FrmQRelEstoquePrecoVenda},
  UFrmQRelEstoqueMinimo in 'UFrmQRelEstoqueMinimo.pas' {FrmQRelEstoqueMinimo},
  UFrmRelVendas in 'UFrmRelVendas.pas' {FrmRelVendas},
  UFrmQRelVendas in 'UFrmQRelVendas.pas' {FrmQRelVendas},
  UFrmRelEntradas in 'UFrmRelEntradas.pas' {FrmRelEntradas},
  UFrmRelOutrasSaidas in 'UFrmRelOutrasSaidas.pas' {FrmRelOutrasSai},
  UFrmQRelEntradas in 'UFrmQRelEntradas.pas' {FrmQRelEntradas},
  UFrmUsuarios in 'UFrmUsuarios.pas' {FrmUsuarios},
  UFrmLogin in 'UFrmLogin.pas' {FrrmLogin},
  UFrmRelOutrasSaidas1 in 'UFrmRelOutrasSaidas1.pas' {FrmRelOutrasSaidas},
  UListaOutrasSaidas in 'UListaOutrasSaidas.pas' {FrmListaOutrasSaidas},
  untImpressao in 'untImpressao.pas',
  UProdutoComposicao in 'UProdutoComposicao.pas' {FrmProdutosComposicao},
  UFrmQRelEstoqueMinimo2 in 'UFrmQRelEstoqueMinimo2.pas' {FrmQRelEstoqueMinimo2},
  UFrmSelecionaItensEtiqueta in 'UFrmSelecionaItensEtiqueta.pas' {FrmSelecionaItensEtiqueta},
  URelEiquetas2 in 'URelEiquetas2.pas' {FrmRelEiquetas2},
  UFrmControleCredito in 'UFrmControleCredito.pas' {FrmControleCredito},
  UFrmQrVendasDia in 'UFrmQrVendasDia.pas' {FrmQrVendasDia},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmQRelCliGeral, FrmQRelCliGeral);
  Application.CreateForm(TFrmQRelEstoque, FrmQRelEstoque);
  Application.CreateForm(TQRelVendedores, QRelVendedores);
  Application.CreateForm(TFrmQRelCadClassif, FrmQRelCadClassif);
  {  Application.CreateForm(TFrmQRelSec, FrmQRelSec);
  Application.CreateForm(TFrmQRelMarcas, FrmQRelMarcas);
  Application.CreateForm(TFrmConsClientes01, FrmConsClientes01);
  Application.CreateForm(TFrmOutrasSaidas, FrmOutrasSaidas);
  Application.CreateForm(TFrmConsOutrasSaidas, FrmConsOutrasSaidas);
  Application.CreateForm(TFrmConsultaEstoque, FrmConsultaEstoque);
  Application.CreateForm(TFrmQRelEstoquePrecoVenda, FrmQRelEstoquePrecoVenda);
  Application.CreateForm(TFrmQRelEstoqueMinimo, FrmQRelEstoqueMinimo);
  Application.CreateForm(TFrmRelVendas, FrmRelVendas);
  Application.CreateForm(TFrmQRelVendas, FrmQRelVendas);
  Application.CreateForm(TFrmRelEntradas, FrmRelEntradas);
  Application.CreateForm(TFrmRelOutrasSai, FrmRelOutrasSai);
  Application.CreateForm(TFrmQRelEntradas, FrmQRelEntradas);
  Application.CreateForm(TFrrmLogin, FrrmLogin);
  Application.CreateForm(TFrmRelOutrasSaidas, FrmRelOutrasSaidas);
  Application.CreateForm(TFrmListaOutrasSaidas, FrmListaOutrasSaidas);
  Application.CreateForm(TFrmQRelEstoqueMinimo2, FrmQRelEstoqueMinimo2);
  Application.CreateForm(TFrmQrVendasDia, FrmQrVendasDia);
  }
  Application.Run;
end.
