unit Workshop.Model.Fiscal.Nfe.Componentes.ACBr;

interface

uses
  System.SysUtils,
  System.Classes,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  Workshop.Model.Fiscal.Nfe.Componentes.Interfaces,
  ACBrNFeNotasFiscais,
  pcnNFe;

type
  TDtmACBrNfe = class(TDataModule, iModelFiscalNFeComponentes<TACBrNFe>)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
  private
    { Private declarations }
    FNotaFiscal: NotaFiscal;
    FProduto: TDetCollectionItem;
    FDuplicata: TDupCollectionItem;
    FObsComp: TobsContCollectionItem;
    FObsFisco: TobsFiscoCollectionItem;
    FPagamento: TpagCollectionItem;
    FTranspVol: TVolCollectionItem;
  public
    { Public declarations }
    function This: TACBrNFe;
    class function New: iModelFiscalNFeComponentes<TACBrNFe>;
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

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDtmACBrNfe }

function TDtmACBrNfe.AddDuplicata: TDupCollectionItem;
begin
  FDuplicata := FNotaFiscal.Nfe.Cobr.Dup.New;
  Result := FDuplicata;
end;

function TDtmACBrNfe.AddNotaFiscal: NotaFiscal;
begin
  FNotaFiscal := ACBrNFe1.NotasFiscais.Add;
  Result := FNotaFiscal;
end;

function TDtmACBrNfe.AddObsComp: TobsContCollectionItem;
begin
  FObsComp := FNotaFiscal.Nfe.InfAdic.obsCont.New;
  Result := FObsComp;
end;

function TDtmACBrNfe.AddObsFisco: TobsFiscoCollectionItem;
begin
  FObsFisco := FNotaFiscal.Nfe.InfAdic.ObsFisco.New;
  Result := FObsFisco;
end;

function TDtmACBrNfe.AddPagamento: TpagCollectionItem;
begin
  FPagamento := FNotaFiscal.Nfe.pag.New;
  Result := FPagamento;
end;

function TDtmACBrNfe.AddProduto: TDetCollectionItem;
begin
  FProduto := FNotaFiscal.Nfe.Det.New;
  Result := FProduto;
end;

function TDtmACBrNfe.AddTranspVol: TVolCollectionItem;
begin
  FTranspVol := FNotaFiscal.Nfe.Transp.Vol.New;
  Result := FTranspVol;
end;

function TDtmACBrNfe.Duplicata: TDupCollectionItem;
begin
  Result := FDuplicata;
end;

class function TDtmACBrNfe.New: iModelFiscalNFeComponentes<TACBrNFe>;
begin
  Result := Self.Create(nil);
end;

function TDtmACBrNfe.NotaFiscal: NotaFiscal;
begin
  Result := FNotaFiscal;
end;

function TDtmACBrNfe.ObsComp: TobsContCollectionItem;
begin
  Result := FObsComp;
end;

function TDtmACBrNfe.ObsFisco: TobsFiscoCollectionItem;
begin
  Result := FObsFisco;
end;

function TDtmACBrNfe.Pagamento: TpagCollectionItem;
begin
  Result := FPagamento;
end;

function TDtmACBrNfe.Produto: TDetCollectionItem;
begin
  Result := FProduto;
end;

function TDtmACBrNfe.TranspVol: TVolCollectionItem;
begin
  Result := FTranspVol;
end;

function TDtmACBrNfe.This: TACBrNFe;
begin
  Result := ACBrNFe1;
end;

end.
