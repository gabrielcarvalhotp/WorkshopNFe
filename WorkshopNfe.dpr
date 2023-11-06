program WorkshopNfe;

uses
  Vcl.Forms,
  Workshop.View.Principal in 'Src\View\Workshop.View.Principal.pas' {ViewPrincipal},
  Workshop.Model.Fiscal.Nfe.Componentes.ACBr in 'Src\Model\Fiscal\Nfe\Componentes\ACBr\Workshop.Model.Fiscal.Nfe.Componentes.ACBr.pas' {DtmACBrNfe: TDataModule},
  Workshop.Model.Fiscal.Nfe.Componentes.Interfaces in 'Src\Model\Fiscal\Nfe\Componentes\Workshop.Model.Fiscal.Nfe.Componentes.Interfaces.pas',
  Workshop.Model.Fiscal.Nfe.Componentes.Factory in 'Src\Model\Fiscal\Nfe\Componentes\Workshop.Model.Fiscal.Nfe.Componentes.Factory.pas',
  Workshop.Model.Fiscal.Nfe.Interfaces in 'Src\Model\Fiscal\Nfe\Workshop.Model.Fiscal.Nfe.Interfaces.pas',
  Workshop.Model.Fiscal.Nfe in 'Src\Model\Fiscal\Nfe\Workshop.Model.Fiscal.Nfe.pas',
  Workshop.Model.Fiscal.Nfe.Invoker in 'Src\Model\Fiscal\Nfe\Invoker\Workshop.Model.Fiscal.Nfe.Invoker.pas',
  Workshop.Model.Fiscal.Nfe.Command.Cobr.Fat in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Cobr.Fat.pas',
  Workshop.Model.Fiscal.Nfe.Command.Compra in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Compra.pas',
  Workshop.Model.Fiscal.Nfe.Command.Dest in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Dest.pas',
  Workshop.Model.Fiscal.Nfe.Command.Emit in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Emit.pas',
  Workshop.Model.Fiscal.Nfe.Command.EnviarNFe in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.EnviarNFe.pas',
  Workshop.Model.Fiscal.Nfe.Command.Exporta in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Exporta.pas',
  Workshop.Model.Fiscal.Nfe.Command.Factory in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Factory.pas',
  Workshop.Model.Fiscal.Nfe.Command.Geral in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Geral.pas',
  Workshop.Model.Fiscal.Nfe.Command.GerarNFe in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.GerarNFe.pas',
  Workshop.Model.Fiscal.Nfe.Command.Ide in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Ide.pas',
  Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsComp in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsComp.pas',
  Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsFisco in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsFisco.pas',
  Workshop.Model.Fiscal.Nfe.Command.InfAdic in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.InfAdic.pas',
  Workshop.Model.Fiscal.Nfe.Command.Interfaces in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Interfaces.pas',
  Workshop.Model.Fiscal.Nfe.Command.Pagamento in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Pagamento.pas',
  Workshop.Model.Fiscal.Nfe.Command.Prod in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Prod.pas',
  Workshop.Model.Fiscal.Nfe.Command.Total in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Total.pas',
  Workshop.Model.Fiscal.Nfe.Command.Transp in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Transp.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces in 'Src\Model\Fiscal\Nfe\Regras\Workshop.Model.Fiscal.Nfe.Regras.Interfaces.pas',
  Workshop.Model.Fiscal.Nfe.Command.Transp.Vol in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Transp.Vol.pas',
  Workshop.Model.Fiscal.Nfe.Command.Cobr.Dup in 'Src\Model\Fiscal\Nfe\Command\Workshop.Model.Fiscal.Nfe.Command.Cobr.Dup.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Helper in 'Src\Model\Fiscal\Nfe\Regras\Workshop.Model.Fiscal.Nfe.Regras.Helper.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.RegimeNormal in 'Src\Model\Fiscal\Nfe\Regras\Imposto\ICMS\Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.RegimeNormal.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.SimplesNacional in 'Src\Model\Fiscal\Nfe\Regras\Imposto\ICMS\Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.SimplesNacional.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CSON101 in 'Src\Model\Fiscal\Nfe\Regras\Imposto\ICMS\CSOSN\Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CSON101.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST000 in 'Src\Model\Fiscal\Nfe\Regras\Imposto\ICMS\CST\Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST000.pas',
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST060 in 'Src\Model\Fiscal\Nfe\Regras\Imposto\ICMS\CST\Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST060.pas',
  Workshop.Model.GOF.Command.Interfaces in 'Src\Model\GOF\Workshop.Model.GOF.Command.Interfaces.pas',
  Workshop.Model.GOF.Observer.Interfaces in 'Src\Model\GOF\Workshop.Model.GOF.Observer.Interfaces.pas',
  Workshop.Model.GOF.Visitor.Interfaces in 'Src\Model\GOF\Workshop.Model.GOF.Visitor.Interfaces.pas',
  Workshop.Controller.Fiscal.NFe.Subject in 'Src\Controller\Fiscal\NFe\Workshop.Controller.Fiscal.NFe.Subject.pas',
  Workshop.Utils.Types in 'Src\Utils\Workshop.Utils.Types.pas',
  Workshop.Controller.Fiscal.NFe.Observer in 'Src\Controller\Fiscal\NFe\Workshop.Controller.Fiscal.NFe.Observer.pas',
  Workshop.Controller.Fiscal.NFe.Interfaces in 'Src\Controller\Fiscal\NFe\Workshop.Controller.Fiscal.NFe.Interfaces.pas',
  Workshop.Controller.Fiscal.NFe in 'Src\Controller\Fiscal\NFe\Workshop.Controller.Fiscal.NFe.pas',
  Workshop.Controller.Fiscal.Factory.Interfaces in 'Src\Controller\Fiscal\Workshop.Controller.Fiscal.Factory.Interfaces.pas',
  Workshop.Controller.Fiscal.Factory in 'Src\Controller\Fiscal\Workshop.Controller.Fiscal.Factory.pas',
  Workshop.Controller.Interfaces in 'Src\Controller\Workshop.Controller.Interfaces.pas',
  Workshop.Controller in 'Src\Controller\Workshop.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.