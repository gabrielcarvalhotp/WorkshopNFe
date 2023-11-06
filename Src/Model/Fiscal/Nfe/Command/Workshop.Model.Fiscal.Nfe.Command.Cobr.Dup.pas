unit Workshop.Model.Fiscal.Nfe.Command.Cobr.Dup;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandCobrDup = class(TInterfacedObject, ICommand)
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
  pcnConversaoNFe, pcnConversao, System.SysUtils;

{ TModelFiscalNfeCommandCobrDup }

constructor TModelFiscalNfeCommandCobrDup.Create(Parent : iModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandCobrDup.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandCobrDup.Execute: ICommand;
var
  I: Integer;
begin
  Result := Self;
  for I := 1 to 2 do
  begin
    FParent.Component.AddDuplicata;
    FParent.Component.Duplicata.nDup  := '1234' + IntToStr(I);
    FParent.Component.Duplicata.dVenc := now+10;
    FParent.Component.Duplicata.vDup  := 50;
  end;
end;

class function TModelFiscalNfeCommandCobrDup.New(Parent : iModelFiscalNfe) : ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
