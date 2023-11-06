unit Workshop.Controller.Fiscal.NFe.Subject;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  Workshop.Model.GOF.Observer.Interfaces;

type
  TControllerFiscalNFeSubject = class(TInterfacedObject, ISubject<string>)
  private
    FList: TList<IObserver<string>>;
    constructor Create;
  public
    class function New: ISubject<string>;
    destructor Destroy; override;
    function Add(AObserver: IObserver<string>): ISubject<string>;
    function Remove(AObserver: IObserver<string>): ISubject<string>;
    function Notify(AValue: string): ISubject<string>;
  end;

implementation

function TControllerFiscalNFeSubject.Add(AObserver: IObserver<string>): ISubject<string>;
begin
  Result := Self;
  FList.Add(AObserver);
end;

constructor TControllerFiscalNFeSubject.Create;
begin
  FList := TList<IObserver<string>>.Create;
end;

destructor TControllerFiscalNFeSubject.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

class function TControllerFiscalNFeSubject.New: ISubject<string>;
begin
  Result := Self.Create;
end;

function TControllerFiscalNFeSubject.Notify(AValue: string): ISubject<string>;
begin
  Result := Self;
  for var Observer in FList do
    Observer.Update(AValue)
end;

function TControllerFiscalNFeSubject.Remove(AObserver: IObserver<string>)
  : ISubject<string>;
begin
  Result := Self;
  FList.Remove(AObserver);
end;

end.
