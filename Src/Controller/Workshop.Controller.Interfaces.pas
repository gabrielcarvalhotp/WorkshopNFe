unit Workshop.Controller.Interfaces;

interface

uses
  Workshop.Controller.Fiscal.Factory.Interfaces;

type
  IController = interface
    ['{C14F0A16-87C9-48BF-B1D7-3F13E6CBB40D}']
    function Fiscal: IControllerFiscalFactory;
  end;

implementation

end.
