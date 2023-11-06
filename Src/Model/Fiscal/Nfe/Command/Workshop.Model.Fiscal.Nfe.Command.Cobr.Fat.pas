unit Workshop.Model.Fiscal.Nfe.Command.Cobr.Fat;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandCobrFat = class(TInterfacedObject, ICommand)
    private
      FParent : IModelFiscalNfe;
    public
      constructor Create(Parent : IModelFiscalNfe);
      destructor Destroy; override;
      class function New(Parent : IModelFiscalNfe) : ICommand;
      function Execute : ICommand;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao;

{ TFiscalNfeCommandCobrFat }

constructor TModelFiscalNfeCommandCobrFat.Create(Parent : IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandCobrFat.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandCobrFat.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.NotaFiscal.NFe.Cobr.Fat.nFat  := 'Numero da Fatura';
  FParent.Component.NotaFiscal.NFe.Cobr.Fat.vOrig := 100;
  FParent.Component.NotaFiscal.NFe.Cobr.Fat.vDesc := 0;
  FParent.Component.NotaFiscal.NFe.Cobr.Fat.vLiq  := 100;
  FParent.Observer.Notify('Cobr.Fat');
end;

class function TModelFiscalNfeCommandCobrFat.New(Parent : IModelFiscalNfe) : ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
