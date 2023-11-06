unit Workshop.Model.Fiscal.Nfe.Command.Ide;

interface

uses
  Workshop.Model.GOF.Command.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces;

type
  TModelFiscalNFeCommandIde = class(TInterfacedObject, ICommand)
  private
    FParent: IModelFiscalNfe;
    constructor Create(Parent: IModelFiscalNfe);
  public
    class function New(Parent: IModelFiscalNfe): ICommand;
    destructor Destroy; override;
    function Execute: ICommand;
  end;

implementation

uses
  System.SysUtils, pcnConversao, pcnConversaoNFe;

constructor TModelFiscalNFeCommandIde.Create(Parent: IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNFeCommandIde.Destroy;
begin

  inherited;
end;

function TModelFiscalNFeCommandIde.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.AddNotaFiscal;
  FParent.Component.NotaFiscal.NFe.Ide.cNF     := 0; //StrToInt(NumNFe); //Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
  FParent.Component.NotaFiscal.NFe.Ide.natOp   := 'VENDA PRODUCAO DO ESTAB.';
  FParent.Component.NotaFiscal.NFe.Ide.indPag  := ipVista;
  FParent.Component.NotaFiscal.NFe.Ide.modelo  := 55;
  FParent.Component.NotaFiscal.NFe.Ide.serie   := 1;
  FParent.Component.NotaFiscal.NFe.Ide.nNF     := 0; //StrToInt(NumNFe);
  FParent.Component.NotaFiscal.NFe.Ide.dEmi    := Date;
  FParent.Component.NotaFiscal.NFe.Ide.dSaiEnt := Date;
  FParent.Component.NotaFiscal.NFe.Ide.hSaiEnt := Now;
  FParent.Component.NotaFiscal.NFe.Ide.tpNF    := tnSaida;
  FParent.Component.NotaFiscal.NFe.Ide.tpEmis  := teNormal; //TpcnTipoEmissao(cbFormaEmissao.ItemIndex); ;
  FParent.Component.NotaFiscal.NFe.Ide.tpAmb   := taHomologacao;  //Lembre-se de trocar esta vari�vel quando for para ambiente de produ��o
  FParent.Component.NotaFiscal.NFe.Ide.verProc := '1.0.0.0'; //Vers�o do seu sistema
  FParent.Component.NotaFiscal.NFe.Ide.cUF     := UFtoCUF('MG');
  FParent.Component.NotaFiscal.NFe.Ide.cMunFG  := 0; //StrToInt(edtEmitCodCidade.Text);
  FParent.Component.NotaFiscal.NFe.Ide.finNFe  := fnNormal;

  if Assigned(FParent.Component.This.DANFE) then
    FParent.Component.NotaFiscal.NFe.Ide.tpImp := FParent.Component.This.DANFE.TipoDANFE;
end;

class function TModelFiscalNFeCommandIde.New(Parent: IModelFiscalNfe): ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
