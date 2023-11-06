unit Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.SimplesNacional;

interface

uses
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces,
  Workshop.Model.GOF.Visitor.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces;

type
  TModelFiscalNFeRegrasImpostoICMSSimplesNacional = class(TInterfacedObject, IModelFiscalNfeRegras,
    IVisitable<IModelFiscalNfeRegrasImposto>)
  private
    FParent: IModelFiscalNfe;
    FRegraImposto: IModelFiscalNfeRegrasImposto;
  public
    constructor Create;
    class function New: IModelFiscalNfeRegras;
    destructor Destroy; override;
    function ProdutoImpostoICMS: IModelFiscalNfeRegras;
    function Visit(AValue: IModelFiscalNfe): IModelFiscalNfeRegras;
    function Accept(AValue: IModelFiscalNfeRegrasImposto): IModelFiscalNfeRegrasImposto;
  end;

implementation

uses
  pcnConversao,
  Workshop.Model.Fiscal.Nfe.Regras.Helper;

function TModelFiscalNFeRegrasImpostoICMSSimplesNacional.Accept(AValue: IModelFiscalNfeRegrasImposto): IModelFiscalNfeRegrasImposto;
begin
  FRegraImposto := AValue;
  Result := FRegraImposto.Visit(FParent);
end;

constructor TModelFiscalNFeRegrasImpostoICMSSimplesNacional.Create;
begin

end;

destructor TModelFiscalNFeRegrasImpostoICMSSimplesNacional.Destroy;
begin

  inherited;
end;

class function TModelFiscalNFeRegrasImpostoICMSSimplesNacional.New: IModelFiscalNfeRegras;
begin
  Result := Self.Create;
end;

function TModelFiscalNFeRegrasImpostoICMSSimplesNacional.ProdutoImpostoICMS: IModelFiscalNfeRegras;
begin
  Result := Self;
  FParent.Component.Produto.Imposto.vTotTrib := 0;
  FParent.Component.Produto.Imposto.ICMS.CSOSN := csosn101;
  FParent.Component.Produto.Imposto.ICMS.orig := oeNacional;
  FParent.Component.Produto.Imposto.ICMS.modBC := dbiValorOperacao;
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

  Accept(FParent.Component.Produto.Imposto.ICMS.CSOSN.Regras).CalculoImpostoProduto;
end;

function TModelFiscalNFeRegrasImpostoICMSSimplesNacional.Visit(AValue: IModelFiscalNfe): IModelFiscalNfeRegras;
begin
  Result := Self;
  FParent := AValue;
end;

end.