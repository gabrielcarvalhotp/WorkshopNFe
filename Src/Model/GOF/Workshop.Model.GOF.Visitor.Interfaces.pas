unit Workshop.Model.GOF.Visitor.Interfaces;

interface

uses
  System.Generics.Collections,
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces;
type

  IVisitable<T> = interface
    ['{C0BB3F72-24DC-400C-9E13-EBDBC7C53988}']
    function Accept(AValue: T): T;
  end;

implementation

end.
