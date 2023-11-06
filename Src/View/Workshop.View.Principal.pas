unit Workshop.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Workshop.Controller.Interfaces;

type
  TViewPrincipal = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: IController;
  public
    procedure Nofify(AValue: string);
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  Workshop.Controller;

{$R *.dfm}
{ TViewPrincipal }

procedure TViewPrincipal.Button1Click(Sender: TObject);
begin
  FController
    .Fiscal
      .NFe
        .Model
          .PrepararNota
          .CRT(ComboBox1.ItemIndex)
          .GerarNFe;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.Fiscal.NFe.Notify(Nofify);
end;

procedure TViewPrincipal.Nofify(AValue: string);
begin
  Memo1.Lines.Add(AValue);
end;

end.