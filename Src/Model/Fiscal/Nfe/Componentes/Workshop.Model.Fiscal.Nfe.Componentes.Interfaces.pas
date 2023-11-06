unit Workshop.Model.Fiscal.Nfe.Componentes.Interfaces;

interface

uses
  System.Generics.Collections,
  ACBrNFe,
  ACBrNFeNotasFiscais,
  pcnNFe;

type
  IModelFiscalNFeComponentes<T> = interface
    ['{5BCDDC90-02F8-4A34-8B96-37628725634D}']
    function This: T;
    function AddNotaFiscal: NotaFiscal;
    function NotaFiscal: NotaFiscal;
    function AddProduto: TDetCollectionItem;
    function Produto: TDetCollectionItem;
    function AddDuplicata: TDupCollectionItem;
    function Duplicata: TDupCollectionItem;
    function AddObsComp: TobsContCollectionItem;
    function ObsComp: TobsContCollectionItem;
    function AddObsFisco: TobsFiscoCollectionItem;
    function ObsFisco: TobsFiscoCollectionItem;
    function AddPagamento: TpagCollectionItem;
    function Pagamento: TpagCollectionItem;
    function AddTranspVol: TVolCollectionItem;
    function TranspVol: TVolCollectionItem;
  end;

  IModelFiscalNFeComponentesFactory = interface
    ['{A834DDEF-9EDD-49AD-8001-AD75713AD0E5}']
    function ACBr: IModelFiscalNFeComponentes<TACBrNFe>;
  end;

implementation

end.
