unit Workshop.Model.GOF.Command.Interfaces;

interface

type
  ICommand = interface
    ['{E5775426-BEAD-41A2-A14C-6655CCCC158A}']
    function Execute: ICommand;
  end;

  IInvoker = interface
    ['{8F9DBF72-545B-494B-8A97-03AF235A5B7B}']
    function Add(Value: ICommand): IInvoker;
    function Execute: IInvoker;
  end;

implementation

end.
