unit Workshop.Model.Fiscal.Nfe.Componentes.Factory;

interface

uses
  ACBrNFe,
  Workshop.Model.Fiscal.Nfe.Componentes.Interfaces,
  Workshop.Model.Fiscal.Nfe.Componentes.ACBr;

type
  TModelFiscalNFeComponentesFactory = class(TInterfacedObject, IModelFiscalNFeComponentesFactory)
  private
    FACBr: TDtmACBrNfe;
    constructor Create;
  public
    class function New: IModelFiscalNFeComponentesFactory;
    destructor Destroy; override;
    function ACBr: IModelFiscalNFeComponentes<TACBrNFe>;
  end;

implementation

uses
  System.SysUtils;

function TModelFiscalNFeComponentesFactory.ACBr: IModelFiscalNFeComponentes<TACBrNFe>;
begin
  if not Assigned(FACBr) then
     FACBr := TDtmACBrNfe.Create(nil);
  Result := FACBr;
end;

constructor TModelFiscalNFeComponentesFactory.Create;
begin

end;

destructor TModelFiscalNFeComponentesFactory.Destroy;
begin
  inherited;
  if Assigned(FACBr) then
    FreeAndNil(FACBr);
end;

class function TModelFiscalNFeComponentesFactory.New
  : IModelFiscalNFeComponentesFactory;
begin
  Result := Self.Create;
end;

end.
