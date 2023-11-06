unit Workshop.Controller.Fiscal.NFe;

interface

uses
  Workshop.Utils.Types,
  Workshop.Controller.Fiscal.NFe.Interfaces,
  Workshop.Controller.Fiscal.NFe.Observer,
  Workshop.Model.GOF.Observer.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.Fiscal.Nfe;

type
  TControllerFiscalNFe = class(TInterfacedObject, IControllerFiscalNFe)
  private
    FObserver: IObserver<string>;
    FNFe: IModelFiscalNfe;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerFiscalNFe;
    function Model: IModelFiscalNfe;
    function Notify(AEvent: TEvNotify): IControllerFiscalNFe;
  end;

implementation

uses
  Workshop.Controller.Fiscal.NFe.Subject;

constructor TControllerFiscalNFe.Create;
begin
  FObserver := TControllerFiscalNFeObserver.New;
  FNFe := TModelFiscalNFe.New.Observer(TControllerFiscalNFeSubject.New.Add(FObserver));
end;

destructor TControllerFiscalNFe.Destroy;
begin

  inherited;
end;

class function TControllerFiscalNFe.New: IControllerFiscalNFe;
begin
  Result := Self.Create;
end;

function TControllerFiscalNFe.Model: IModelFiscalNfe;
begin
  Result := FNFe;
end;

function TControllerFiscalNFe.Notify(AEvent: TEvNotify): IControllerFiscalNFe;
begin
  Result := Self;
  FObserver.EvNotify(AEvent);
end;

end.
