unit Workshop.Model.Fiscal.Nfe;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.Fiscal.Nfe.Componentes.Interfaces,
  ACBrNFe,
  Workshop.Model.GOF.Observer.Interfaces;

type
  TModelFiscalNFe = class(TInterfacedObject, iModelFiscalNFe)
  private
    FComponentesFactory: IModelFiscalNFeComponentesFactory;
    FSubject: ISubject<string>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelFiscalNFe;
    function Clear: iModelFiscalNFe;
    function GerarNFe: iModelFiscalNFe;
    function Component: IModelFiscalNFeComponentes<TACBrNFe>;
    function Observer(ASubject: ISubject<string>): iModelFiscalNFe; overload;
    function Observer: ISubject<string>; overload;
    function PrepararNota: IModelFiscalNfe;
    function CRT(AValue: Integer): IModelFiscalNfe;
  end;

implementation

uses
  Workshop.Model.Fiscal.Nfe.Componentes.Factory,
  Workshop.Model.Fiscal.Nfe.Command.Factory,
  Workshop.Model.Fiscal.Nfe.Command.Interfaces,
  Workshop.Model.Fiscal.Nfe.Invoker, pcnConversao;

function TModelFiscalNFe.Clear: iModelFiscalNFe;
begin
  Result := Self;
  FComponentesFactory.ACBr.This.NotasFiscais.Clear;
end;

function TModelFiscalNFe.Component: IModelFiscalNFeComponentes<TACBrNFe>;
begin
  Result := FComponentesFactory.ACBr;
end;

constructor TModelFiscalNFe.Create;
begin
  FComponentesFactory := TModelFiscalNFeComponentesFactory.New;
end;

function TModelFiscalNFe.CRT(AValue: Integer): IModelFiscalNfe;
begin
  Result := Self;
  FComponentesFactory.ACBr.NotaFiscal.NFe.Emit.CRT := TpcnCRT(AValue);
end;

destructor TModelFiscalNFe.Destroy;
begin

  inherited;
end;

function TModelFiscalNFe.GerarNFe: iModelFiscalNFe;
begin
  Result := Self;
  TFiscalNFeInvoker.New
    .Add(TModelFiscalNFeCommandFactory.New(Self).Geral)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Ide)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Emitente)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Dest)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Prod)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Total)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Transp)
    .Add(TModelFiscalNFeCommandFactory.New(Self).TranspVol)
    .Add(TModelFiscalNFeCommandFactory.New(Self).CobrFat)
    .Add(TModelFiscalNFeCommandFactory.New(Self).CobrDup)
    .Add(TModelFiscalNFeCommandFactory.New(Self).InfAdic)
    .Add(TModelFiscalNFeCommandFactory.New(Self).InfAdicObsComp)
    .Add(TModelFiscalNFeCommandFactory.New(Self).InfAdicObsFisco)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Exporta)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Compra)
    .Add(TModelFiscalNFeCommandFactory.New(Self).Pagamento)
    .Add(TModelFiscalNFeCommandFactory.New(Self).GerarNFe)
    .Add(TModelFiscalNFeCommandFactory.New(Self).EnviarNFe)
    .Execute;

  FSubject.Notify('Nota foi Gerada com Sucesso');
  FComponentesFactory.ACBr.This.NotasFiscais.Clear;
end;

class function TModelFiscalNFe.New: iModelFiscalNFe;
begin
  Result := Self.Create;
end;

function TModelFiscalNFe.Observer: ISubject<string>;
begin
  Result := FSubject;
end;

function TModelFiscalNFe.PrepararNota: IModelFiscalNfe;
begin
  Result := Self;
  FComponentesFactory.ACBr.AddNotaFiscal;
end;

function TModelFiscalNFe.Observer(ASubject: ISubject<string>): iModelFiscalNFe;
begin
  Result := Self;
  FSubject := ASubject;
end;

end.
