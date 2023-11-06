unit Workshop.Controller.Fiscal.Factory.Interfaces;

interface

uses
  Workshop.Controller.Fiscal.NFe.Interfaces;

type
  IControllerFiscalFactory = interface
    ['{CAA0BF16-9EA0-4582-BCC7-35C7ABF4BAFE}']
    function NFe: IControllerFiscalNFe;
  end;

implementation

end.
