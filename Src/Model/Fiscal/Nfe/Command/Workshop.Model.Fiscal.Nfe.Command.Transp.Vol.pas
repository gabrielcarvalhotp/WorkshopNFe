unit Workshop.Model.Fiscal.Nfe.Command.Transp.Vol;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandTranspVol = class(TInterfacedObject, ICommand)
  private
    FParent: IModelFiscalNfe;
  public
    constructor Create(Parent: IModelFiscalNfe);
    destructor Destroy; override;
    class function New(Parent: IModelFiscalNfe): ICommand;
    function Execute: ICommand;
  end;

implementation

uses
  pcnConversaoNFe,
  pcnConversao;

{ TFiscalNfeCommandTranspVol }

constructor TModelFiscalNfeCommandTranspVol.Create(Parent: IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandTranspVol.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandTranspVol.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.AddTranspVol;
  FParent.Component.TranspVol.qVol := 1;
  FParent.Component.TranspVol.esp := 'Especie';
  FParent.Component.TranspVol.marca := 'Marca';
  FParent.Component.TranspVol.nVol := 'Numero';
  FParent.Component.TranspVol.pesoL := 100;
  FParent.Component.TranspVol.pesoB := 110;
end;

class function TModelFiscalNfeCommandTranspVol.New(Parent: IModelFiscalNfe): ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
