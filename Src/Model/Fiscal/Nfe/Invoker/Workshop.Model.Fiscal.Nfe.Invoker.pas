unit Workshop.Model.Fiscal.Nfe.Invoker;

interface

uses
  System.Generics.Collections,
  Workshop.Model.GOF.Command.Interfaces;

type
  TFiscalNFeInvoker = class(TInterfacedObject, IInvoker)
  private
    FList: TList<ICommand>;
    constructor Create;
  public
    class function New: IInvoker;
    destructor Destroy; override;
    function Add(Value: ICommand): IInvoker;
    function Execute: IInvoker;
  end;

implementation

uses
  System.SysUtils;

function TFiscalNFeInvoker.Add(Value: ICommand): IInvoker;
begin
  Result := Self;
  FList.Add(Value);
end;

constructor TFiscalNFeInvoker.Create;
begin
  FList := TList<ICommand>.Create;
end;

destructor TFiscalNFeInvoker.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TFiscalNFeInvoker.Execute: IInvoker;
begin
  for var Command in FList do
    Command.Execute;
end;

class function TFiscalNFeInvoker.New: IInvoker;
begin
  result := Self.Create;
end;

end.
