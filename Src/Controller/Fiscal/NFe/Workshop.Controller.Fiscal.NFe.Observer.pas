unit Workshop.Controller.Fiscal.NFe.Observer;

interface

uses
  System.Classes,
  System.SysUtils,
  Workshop.Model.GOF.Observer.Interfaces, Workshop.Utils.Types;

type
  TControllerFiscalNFeObserver = class(TInterfacedObject, IObserver<string>)
  private
    FEvNotify: TEvNotify;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IObserver<string>;
    function Update(AValue: string): IObserver<string>;
    function EvNotify(AEvent: TEvNotify): IObserver<string>;
  end;

implementation

constructor TControllerFiscalNFeObserver.Create;
begin

end;

destructor TControllerFiscalNFeObserver.Destroy;
begin

  inherited;
end;

function TControllerFiscalNFeObserver.EvNotify(AEvent: TEvNotify): IObserver<string>;
begin
  Result := Self;
  FEvNotify := AEvent;
end;

class function TControllerFiscalNFeObserver.New: IObserver<string>;
begin
  Result := Self.Create;
end;

function TControllerFiscalNFeObserver.Update(AValue: string): IObserver<string>;
begin
  Result := Self;
  FEvNotify(AValue);
end;

end.
