unit untMainForm;

interface

uses
  Classes, SysUtils, Windows, Dialogs,
  Forms, Controls, StdCtrls;

type
  //It is important to parameterize the methods with "stdcall".
  //Attention to the GUID is the same interface in C#.

  IObserver = interface
  ['{C611C7C3-7B89-43E1-AB45-760F3681FD15}']
    procedure Notify; stdcall;
  end;

  IObservable = interface
  ['{015A4C95-DC62-433E-BCBA-68670E12B9B2}']  
    procedure Attach(observer: IObserver); stdcall;
    procedure Deatach(observer: IObserver); stdcall;
    procedure NofityAll; stdcall;
  end;

  TMainForm = class(TForm, IObserver)
    lblResult: TLabel;  
    TestButton: TButton;
    procedure TestButtonClick(Sender: TObject);
  private
    procedure Notify; stdcall;  
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

// Function to get Instance of Observable from DLL
// ----------------------------------------------------------------------------
function CreateObservable: IObservable;
type
  // It's important to add this procedure "stdcall"
  TProc = procedure(out instance: IObservable); stdcall;
var
  dllHandle: THandle;
  proc: TProc;
begin
  result := nil;
  dllHandle := LoadLibrary('CSharpLibrary.dll');
  if dllHandle < HINSTANCE_ERROR then
    raise Exception.Create('CSharpLibrary.dll library can not be loaded or not found. ' +
      SysErrorMessage(GetLastError));
  try
    @proc := GetProcAddress(dllHandle, 'CreateObservable');
    if Assigned(@proc) then
    begin
      proc(result);
    end;
  finally
    FreeLibrary(dllHandle);
  end;
end;

procedure TMainForm.TestButtonClick(Sender: TObject);
var
  observable: IObservable;
begin
  observable := CreateObservable;
  if observable <> nil then
  begin
    observable.Attach(self);
    observable.NofityAll;
  end
  else
  begin
    ShowMessage('Cannot load exported function!');
  end;
end;

// This method will be called from within the dll in C# (the callback)
// ----------------------------------------------------------------------------
procedure TMainForm.Notify;
begin
  lblResult.Caption := 'Work!';
  ShowMessage('Congratulations!' +#13+ 'This method was called from C# dll.');
end;

end.
