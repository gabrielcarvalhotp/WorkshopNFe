unit Workshop.Model.Fiscal.Nfe.Command.Factory;

interface

uses
  Workshop.Model.Fiscal.Nfe.Command.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

type
  TModelFiscalNFeCommandFactory = class(TInterfacedObject,
    iModelFiscalNFeCommandFactory)
  private
    FParent: iModelFiscalNFe;
  public
    constructor Create(Parent: iModelFiscalNFe);
    destructor Destroy; override;
    class function New(Parent: iModelFiscalNFe): iModelFiscalNFeCommandFactory;
    function Geral: ICommand;
    function Emitente: ICommand;
    function Ide: ICommand;
    function Dest: ICommand;
    function Prod: ICommand;
    function Total: ICommand;
    function Transp: ICommand;
    function TranspVol: ICommand;
    function CobrFat: ICommand;
    function CobrDup: ICommand;
    function InfAdic: ICommand;
    function InfAdicObsFisco: ICommand;
    function InfAdicObsComp: ICommand;
    function Exporta: ICommand;
    function Pagamento: ICommand;
    function Compra: ICommand;
    function GerarNFe: ICommand;
    function EnviarNFe: ICommand;
  end;

implementation

uses
  Workshop.Model.Fiscal.Nfe.Command.Geral,
  Workshop.Model.Fiscal.Nfe.Command.Cobr.Fat,
  Workshop.Model.Fiscal.Nfe.Command.Cobr.Dup,
  Workshop.Model.Fiscal.Nfe.Command.Compra,
  Workshop.Model.Fiscal.Nfe.Command.Dest,
  Workshop.Model.Fiscal.Nfe.Command.Emit,
  Workshop.Model.Fiscal.Nfe.Command.Exporta,
  Workshop.Model.Fiscal.Nfe.Command.Ide,
  Workshop.Model.Fiscal.Nfe.Command.InfAdic,
  Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsComp,
  Workshop.Model.Fiscal.Nfe.Command.InfAdic.ObsFisco,
  Workshop.Model.Fiscal.Nfe.Command.Pagamento,
  Workshop.Model.Fiscal.Nfe.Command.Prod,
  Workshop.Model.Fiscal.Nfe.Command.Total,
  Workshop.Model.Fiscal.Nfe.Command.Transp,
  Workshop.Model.Fiscal.Nfe.Command.Transp.Vol,
  Workshop.Model.Fiscal.Nfe.Command.GerarNFe,
  Workshop.Model.Fiscal.Nfe.Command.EnviarNFe;

{ TModelFiscalNFeCommandFactory }

function TModelFiscalNFeCommandFactory.CobrDup: ICommand;
begin
  Result := TModelFiscalNfeCommandCobrDup.New(FParent);
end;

function TModelFiscalNFeCommandFactory.CobrFat: ICommand;
begin
  Result := TModelFiscalNfeCommandCobrFat.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Compra: ICommand;
begin
  Result := TModelFiscalNfeCommandCompra.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Geral: ICommand;
begin
  Result := TModelFiscalNfeCommandGeral.New(FParent);
end;

function TModelFiscalNFeCommandFactory.GerarNFe: ICommand;
begin
  Result := TModelFiscalNfeCommandGerarNFe.New(FParent);
end;

constructor TModelFiscalNFeCommandFactory.Create(Parent: iModelFiscalNFe);
begin
  FParent := Parent;
end;

function TModelFiscalNFeCommandFactory.Dest: ICommand;
begin
  Result := TModelFiscalNfeCommandDest.New(FParent);
end;

destructor TModelFiscalNFeCommandFactory.Destroy;
begin

  inherited;
end;

function TModelFiscalNFeCommandFactory.Emitente: ICommand;
begin
  Result := TModelFiscalNFeCommandEmit.New(FParent);
end;

function TModelFiscalNFeCommandFactory.EnviarNFe: ICommand;
begin
  Result := TModelFiscalNfeCommandEnviarNFe.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Exporta: ICommand;
begin
  Result := TModelFiscalNfeCommandExporta.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Ide: ICommand;
begin
  Result := TModelFiscalNfeCommandIde.New(FParent);
end;

function TModelFiscalNFeCommandFactory.InfAdic: ICommand;
begin
  Result := TModelFiscalNfeCommandInfAdic.New(FParent);
end;

function TModelFiscalNFeCommandFactory.InfAdicObsComp: ICommand;
begin
  Result := TModelFiscalNfeCommandInfAdicObsComp.New(FParent);
end;

function TModelFiscalNFeCommandFactory.InfAdicObsFisco: ICommand;
begin
  Result := TModelFiscalNfeCommandInfAdicObsFisco.New(FParent);
end;

class function TModelFiscalNFeCommandFactory.New(Parent: iModelFiscalNFe)
  : iModelFiscalNFeCommandFactory;
begin
  Result := Self.Create(Parent);
end;

function TModelFiscalNFeCommandFactory.Pagamento: ICommand;
begin
  Result := TModelFiscalNfeCommandPagamento.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Prod: ICommand;
begin
  Result := TModelFiscalNfeCommandProd.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Total: ICommand;
begin
  Result := TModelFiscalNfeCommandTotal.New(FParent);
end;

function TModelFiscalNFeCommandFactory.Transp: ICommand;
begin
  Result := TModelFiscalNfeCommandTranspVol.New(FParent);
end;

function TModelFiscalNFeCommandFactory.TranspVol: ICommand;
begin
  Result := TModelFiscalNfeCommandTranspVol.New(FParent);
end;

end.
