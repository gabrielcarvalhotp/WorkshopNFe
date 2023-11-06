unit Workshop.Model.Fiscal.Nfe.Command.Transp;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

Type
  TModelFiscalNfeCommandTransp = class(TInterfacedObject, ICommand)
    private
      FParent : IModelFiscalNfe;
    public
      constructor Create(Parent : IModelFiscalNfe);
      destructor Destroy; override;
      class function New(Parent : IModelFiscalNfe) : ICommand;
      function Execute : ICommand;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao;

{ TModelFiscalNfeCommandTransp }

constructor TModelFiscalNfeCommandTransp.Create(Parent : IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNfeCommandTransp.Destroy;
begin

  inherited;
end;

function TModelFiscalNfeCommandTransp.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.NotaFiscal.NFe.Transp.modFrete := mfContaEmitente;
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.CNPJCPF  := '';
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.xNome    := '';
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.IE       := '';
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.xEnder   := '';
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.xMun     := '';
  FParent.Component.NotaFiscal.NFe.Transp.Transporta.UF       := '';
  FParent.Component.NotaFiscal.NFe.Transp.veicTransp.placa := '';
  FParent.Component.NotaFiscal.NFe.Transp.veicTransp.UF    := '';
  FParent.Component.NotaFiscal.NFe.Transp.veicTransp.RNTC  := '';

  FParent.Observer.Notify('Transp Preenchido com Sucesso');
end;

class function TModelFiscalNfeCommandTransp.New(Parent : IModelFiscalNfe) : ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
