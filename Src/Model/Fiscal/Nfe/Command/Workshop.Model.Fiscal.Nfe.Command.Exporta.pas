unit Workshop.Model.Fiscal.Nfe.Command.Exporta;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandExporta = class(TInterfacedObject, ICommand)
  private
    FParent: iModelFiscalNfe;
  public
    constructor Create(Parent: iModelFiscalNfe);
    destructor Destroy; override;
    class function New(Parent: iModelFiscalNfe): ICommand;
    function Execute: ICommand;
  end;

implementation

uses
  pcnConversaoNFe,
  pcnConversao;

{ TModelFiscalNfeCommandExporta }

constructor TModelFiscalNfeCommandExporta.Create(Parent: iModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandExporta.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandExporta.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.NotaFiscal.Nfe.Exporta.UFembarq := '';;
  FParent.Component.NotaFiscal.Nfe.Exporta.xLocEmbarq := '';
end;

class function TModelFiscalNfeCommandExporta.New(Parent: iModelFiscalNfe)
  : ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
