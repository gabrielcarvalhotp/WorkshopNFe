unit Workshop.Model.Fiscal.Nfe.Command.Emit;

interface

uses
  Workshop.Model.GOF.Command.Interfaces,
  Workshop.Model.Fiscal.Nfe.Interfaces;

type
  TModelFiscalNFeCommandEmit = class(TInterfacedObject, ICommand)
  private
    FParent: IModelFiscalNfe;
    constructor Create(Parent: IModelFiscalNfe);
  public
    class function New(Parent: IModelFiscalNfe): ICommand;
    destructor Destroy; override;
    function Execute: ICommand;
  end;

implementation

uses
  System.SysUtils, pcnConversao, pcnConversaoNFe;

constructor TModelFiscalNFeCommandEmit.Create(Parent: IModelFiscalNfe);
begin
  FParent := Parent;
end;

destructor TModelFiscalNFeCommandEmit.Destroy;
begin

  inherited;
end;

function TModelFiscalNFeCommandEmit.Execute: ICommand;
begin
  Result := Self;
  FParent.Component.NotaFiscal.NFe.Emit.CNPJCPF           := ''; //edtEmitCNPJ.Text;
  FParent.Component.NotaFiscal.NFe.Emit.IE                := ''; //edtEmitIE.Text;
  FParent.Component.NotaFiscal.NFe.Emit.xNome             := ''; //edtEmitRazao.Text;
  FParent.Component.NotaFiscal.NFe.Emit.xFant             := ''; //edtEmitFantasia.Text;

  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.fone    := ''; //edtEmitFone.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.CEP     := 0; //StrToInt(edtEmitCEP.Text);
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.xLgr    := ''; //edtEmitLogradouro.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.nro     := ''; //edtEmitNumero.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.xCpl    := ''; //edtEmitComp.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.xBairro := ''; //edtEmitBairro.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.cMun    := 0; //StrToInt(edtEmitCodCidade.Text);
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.xMun    := ''; //edtEmitCidade.Text;
  FParent.Component.NotaFiscal.NFe.Emit.EnderEmit.UF      := ''; //edtEmitUF.Text;
  FParent.Component.NotaFiscal.NFe.Emit.enderEmit.cPais   := 1058;
  FParent.Component.NotaFiscal.NFe.Emit.enderEmit.xPais   := 'BRASIL';

  FParent.Component.NotaFiscal.NFe.Emit.IEST              := '';
  FParent.Component.NotaFiscal.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir servi�os na nota
  FParent.Component.NotaFiscal.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se � permitido
                                // a inclus�o de servi�os na NFe
  FParent.Observer.Notify('Emitente Preenchido com Sucesso');

end;

class function TModelFiscalNFeCommandEmit.New(Parent: IModelFiscalNfe): ICommand;
begin
  Result := Self.Create(Parent);
end;

end.
