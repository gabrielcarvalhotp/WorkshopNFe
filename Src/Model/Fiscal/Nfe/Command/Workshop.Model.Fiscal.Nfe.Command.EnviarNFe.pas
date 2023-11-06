unit Workshop.Model.Fiscal.Nfe.Command.EnviarNFe;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandEnviarNFe = class(TInterfacedObject, ICommand)
    private
      FParent : iModelFiscalNfe;
    public
      constructor Create(Parent : iModelFiscalNfe);
      destructor Destroy; override;
      class function New(Parent : iModelFiscalNfe) : ICommand;
      function Execute : ICommand;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao;

{ TModelFiscalNfeCommandEnviarNFe }

constructor TModelFiscalNfeCommandEnviarNFe.Create(Parent : iModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandEnviarNFe.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandEnviarNFe.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.This.Enviar(1, True);
end;

class function TModelFiscalNfeCommandEnviarNFe.New(Parent : iModelFiscalNfe) : ICommand;
begin
  Result := Self.Create(Parent);
end;

end.

