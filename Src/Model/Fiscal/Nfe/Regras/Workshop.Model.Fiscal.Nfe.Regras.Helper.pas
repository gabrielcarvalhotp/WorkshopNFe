unit Workshop.Model.Fiscal.Nfe.Regras.Helper;

interface

uses
  pcnConversao,
  Workshop.Model.Fiscal.Nfe.Regras.Interfaces;

type
  TpcnCRTHelper = record Helper for TpcnCRT
    function Regras: IModelFiscalNfeRegras;
  end;

  TpcnCSTIcmsHelper = record Helper for TpcnCSTIcms
    function Regras: IModelFiscalNfeRegrasImposto;
  end;

  TpcnCSOSNIcmsHelper = record Helper for TpcnCSOSNIcms
    function Regras: IModelFiscalNfeRegrasImposto;
  end;

implementation

uses
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.RegimeNormal,
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.SimplesNacional,
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST000,
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CST060,
  Workshop.Model.Fiscal.Nfe.Regras.Imposto.ICMS.CSON101;

function TpcnCRTHelper.Regras: IModelFiscalNfeRegras;
begin
  case Self of
    crtSimplesNacional: Result := TModelFiscalNFeRegrasImpostoICMSSimplesNacional.New;
    crtSimplesExcessoReceita: Result := nil;
    crtRegimeNormal: Result := TModelFiscalNFeRegrasImpostoICMSRegimeNormal.New;
  end;
end;

{ TpcnCSTIcmsHelper }

function TpcnCSTIcmsHelper.Regras: IModelFiscalNfeRegrasImposto;
begin
  case Self of
    cst00: Result :=TModelFiscalNFeRegrasImpostoICMSCST000.New;
    cst10: ;
    cst20: ;
    cst30: ;
    cst40: ;
    cst41: ;
    cst45: ;
    cst50: ;
    cst51: ;
    cst60: Result := TModelFiscalNFeRegrasImpostoICMSCST060.New;
    cst70: ;
    cst80: ;
    cst81: ;
    cst90: ;
    cstPart10: ;
    cstPart90: ;
    cstRep41: ;
    cstVazio: ;
    cstICMSOutraUF: ;
    cstICMSSN: ;
    cstRep60: ;
    cst02: ;
    cst15: ;
    cst53: ;
    cst61: ;
  end;
end;

{ TpcnCSOSNIcmsHelper }

function TpcnCSOSNIcmsHelper.Regras: IModelFiscalNfeRegrasImposto;
begin
  case Self of
    csosnVazio: ;
    csosn101: Result := TModelFiscalNFeRegrasImpostoICMSCSON101.New;
    csosn102: ;
    csosn103: ;
    csosn201: ;
    csosn202: ;
    csosn203: ;
    csosn300: ;
    csosn400: ;
    csosn500: ;
    csosn900: ;
  end;
end;

end.
