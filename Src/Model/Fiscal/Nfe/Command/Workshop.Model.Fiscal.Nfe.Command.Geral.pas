unit Workshop.Model.Fiscal.Nfe.Command.Geral;

interface

uses
  Workshop.Model.Fiscal.Nfe.Interfaces,
  Workshop.Model.GOF.Command.Interfaces;

type
  TModelFiscalNFeCommandGeral = class(TInterfacedObject, ICommand)
  private
    [weak]
    FParent: IModelFiscalNfe;
    constructor Create(Parent: IModelFiscalNfe);
  public
    class function New(Parent: IModelFiscalNfe): ICommand;
    destructor Destroy; override;
    function Execute: ICommand;
  end;

implementation

uses
  pcnConversaoNFe, ACBrDFeSSL;

constructor TModelFiscalNFeCommandGeral.Create(Parent: IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNFeCommandGeral.Destroy;
begin

  inherited;
end;

function TModelFiscalNFeCommandGeral.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.This.Configuracoes.Geral.SSLLib := libWinCrypt;
  FParent.Component.This.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
  FParent.Component.This.Configuracoes.Geral.SSLHttpLib := httpWinINet;
  FParent.Component.This.Configuracoes.Geral.ModeloDF := moNFe;
  FParent.Component.This.Configuracoes.Geral.VersaoDF := ve400;

  FParent.Observer.Notify('Geral Preenchido com Sucesso');
end;

class function TModelFiscalNFeCommandGeral.New(Parent: IModelFiscalNfe): ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
