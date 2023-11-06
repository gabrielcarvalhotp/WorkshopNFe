unit Workshop.Model.Fiscal.Nfe.Interfaces;

interface

uses
  Workshop.Model.Fiscal.Nfe.Componentes.Interfaces,
  ACBrNFe,
  Workshop.Model.GOF.Observer.Interfaces;

type
  IModelFiscalNfe = interface
    ['{9E57D0F2-BC59-4F10-B453-7295723BB3BF}']
    function Clear: IModelFiscalNfe;
    function GerarNFe: IModelFiscalNfe;
    function Component: IModelFiscalNFeComponentes<TACBrNFe>;
    function Observer(ASubject: ISubject<string>): IModelFiscalNfe; overload;
    function Observer: ISubject<string>; overload;
    function PrepararNota: IModelFiscalNfe;
    function CRT(AValue: Integer): IModelFiscalNfe;
  end;

implementation

end.
