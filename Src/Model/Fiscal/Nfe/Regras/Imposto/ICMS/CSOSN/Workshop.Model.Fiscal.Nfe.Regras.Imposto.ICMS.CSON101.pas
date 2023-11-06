unit Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CSON101;

interface

uses
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces;

type
  TModelFiscalNFeRegrasImpostoICMSCSON101 = class(TInterfacedObject, IModelFiscalNfeRegrasImposto)
  private
    FParent: IModelFiscalNfe;
    constructor Create;
  public
    class function New: IModelFiscalNfeRegrasImposto;
    destructor Destroy; override;
    function CalculoImpostoProduto: IModelFiscalNfeRegrasImposto;
    function Visit(AValue: IModelFiscalNfe): IModelFiscalNfeRegrasImposto;
  end;

implementation

uses
  pcnConversao;

function TModelFiscalNFeRegrasImpostoICMSCSON101.CalculoImpostoProduto: IModelFiscalNfeRegrasImposto;
begin
  Result := Self;
  FParent.Component.Produto.Imposto.ICMS.vBC := 100;
  FParent.Component.Produto.Imposto.ICMS.pICMS := 18;
  FParent.Component.Produto.Imposto.ICMS.vICMS := 18;
  FParent.Component.Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
  FParent.Component.Produto.Imposto.ICMS.pMVAST := 0;
  FParent.Component.Produto.Imposto.ICMS.pRedBCST := 0;
  FParent.Component.Produto.Imposto.ICMS.vBCST := 0;
  FParent.Component.Produto.Imposto.ICMS.pICMSST := 0;
  FParent.Component.Produto.Imposto.ICMS.vICMSST := 0;
  FParent.Component.Produto.Imposto.ICMS.pRedBC := 0;
end;

constructor TModelFiscalNFeRegrasImpostoICMSCSON101.Create;
begin

end;

destructor TModelFiscalNFeRegrasImpostoICMSCSON101.Destroy;
begin

  inherited;
end;

class function TModelFiscalNFeRegrasImpostoICMSCSON101.New: IModelFiscalNfeRegrasImposto;
begin
  Result := Self.Create;
end;

function TModelFiscalNFeRegrasImpostoICMSCSON101.Visit(AValue: IModelFiscalNfe): IModelFiscalNfeRegrasImposto;
begin
  Result := Self;
  FParent := AValue;
end;

end.
