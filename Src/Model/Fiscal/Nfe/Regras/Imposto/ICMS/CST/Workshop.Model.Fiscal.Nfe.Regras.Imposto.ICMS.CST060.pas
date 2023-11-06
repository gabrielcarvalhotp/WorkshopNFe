unit Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST060;

interface

uses
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces;

type
  TModelFiscalNFeRegrasImpostoICMSCST060 = class(TInterfacedObject, IModelFiscalNfeRegrasImposto)
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

function TModelFiscalNFeRegrasImpostoICMSCST060.CalculoImpostoProduto: IModelFiscalNfeRegrasImposto;
begin
  Result := Self;
  FParent.Component.Produto.Imposto.ICMS.vBC := 0;
  FParent.Component.Produto.Imposto.ICMS.pICMS := 0;
  FParent.Component.Produto.Imposto.ICMS.vICMS := 0;
  FParent.Component.Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
  FParent.Component.Produto.Imposto.ICMS.pMVAST := 0;
  FParent.Component.Produto.Imposto.ICMS.pRedBCST := 0;
  FParent.Component.Produto.Imposto.ICMS.vBCST := 0;
  FParent.Component.Produto.Imposto.ICMS.pICMSST := 0;
  FParent.Component.Produto.Imposto.ICMS.vICMSST := 0;
  FParent.Component.Produto.Imposto.ICMS.pRedBC := 0;
end;

constructor TModelFiscalNFeRegrasImpostoICMSCST060.Create;
begin

end;

destructor TModelFiscalNFeRegrasImpostoICMSCST060.Destroy;
begin

  inherited;
end;

class function TModelFiscalNFeRegrasImpostoICMSCST060.New: IModelFiscalNfeRegrasImposto;
begin
  Result := Self.Create;
end;

function TModelFiscalNFeRegrasImpostoICMSCST060.Visit(AValue: IModelFiscalNfe): IModelFiscalNfeRegrasImposto;
begin
  Result := Self;
  FParent := AValue;
end;

end.
