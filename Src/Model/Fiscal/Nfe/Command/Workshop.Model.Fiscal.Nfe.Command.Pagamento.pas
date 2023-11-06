unit Workshop.Model.Fiscal.Nfe.Command.Pagamento;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandPagamento = class(TInterfacedObject, iCommand)
    private
      FParent : IModelFiscalNfe;
    public
      constructor Create(Parent : IModelFiscalNfe);
      destructor Destroy; override;
      class function New(Parent : IModelFiscalNfe) : iCommand;
      function Execute : iCommand;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao;

{ TModelFiscalNfeCommandPagamento }

constructor TModelFiscalNfeCommandPagamento.Create(Parent : IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandPagamento.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandPagamento.Execute: iCommand;
begin
  Result := Self;
  FParent.Component.AddPagamento;
  FParent.Component.Pagamento.indPag := ipVista;
  FParent.Component.Pagamento.tPag   := fpDinheiro;
  FParent.Component.Pagamento.vPag   := 100;
end;

class function TModelFiscalNfeCommandPagamento.New(Parent : IModelFiscalNfe) : iCommand;
begin
  Result := Self.Create(Parent);
end;

end.

