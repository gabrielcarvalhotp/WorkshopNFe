unit Workshop.Controller;

interface

uses
  Workshop.Controller.Interfaces,
  Workshop.Controller.Fiscal.Factory.Interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FControllerFiscal: IControllerFiscalFactory;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IController;
    function Fiscal: IControllerFiscalFactory;
  end;

implementation

uses
  Workshop.Controller.Fiscal.Factory;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Fiscal: IControllerFiscalFactory;
begin
  if not Assigned(FControllerFiscal) then
    FControllerFiscal := TControllerFiscalFactory.New;
  Result := FControllerFiscal;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

end.
