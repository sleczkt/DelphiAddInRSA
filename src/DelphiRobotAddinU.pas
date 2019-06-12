unit DelphiRobotAddinU;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, DelphiAddInLib_TLB, StdVcl, RobotOM_TLB, Dialogs, Forms,
  MainFormU;

type
  TDelphiRobotAddin = class(TAutoObject, IRobotAddIn)
  private
    robotApp: IRobotApplication;
  protected
    function Connect(const robot_app: IRobotApplication; add_in_id: Integer;
      first_time: WordBool; out ret: WordBool): HResult; stdcall;
    function Disconnect(out ret: WordBool): HResult; stdcall;
    function DoCommand(cmd_id: Integer): HResult; stdcall;
    function GetExpectedVersion(out ret: Double): HResult; stdcall;
    function InstallCommands(const cmd_list: IRobotCmdList;
      out ret: Integer): HResult; stdcall;

  end;

implementation

uses ComServ;

//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function TDelphiRobotAddin.Connect(const robot_app: IRobotApplication;
  add_in_id: Integer; first_time: WordBool; out ret: WordBool): HResult;
begin
  robotApp:=  robot_app;
  ret:=  true;
  Result:= S_OK;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function TDelphiRobotAddin.Disconnect(out ret: WordBool): HResult;
begin
  robotApp:= nil;
  ret:= true;
  Result:= S_OK;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function TDelphiRobotAddin.DoCommand(cmd_id: Integer): HResult;
var
  MainForm: TMainForm;
begin
  case cmd_id of
    1: ShowMessage( 'My new Command 1');
    2: ShowMessage( 'My new Command 2');
    3:begin

        MainForm:= TMainForm.Create( Application );
        With MainForm do
		  begin
		    SetRobotApplication( robotApp );
            ShowModal;
            Free;
		  end;
        MainForm:= nil;


      end;
  end;
  Result:= S_OK;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function TDelphiRobotAddin.GetExpectedVersion(out ret: Double): HResult;
begin
  ret:= 19.0;
  result:= S_OK;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function TDelphiRobotAddin.InstallCommands(const cmd_list: IRobotCmdList;
  out ret: Integer): HResult;
begin
  cmd_list.New(1, 'delphi My New Command 1');
  cmd_list.New(2, 'Delphi My New Command 2');
  cmd_list.New(3, 'Delphi My New Command 3');
  ret:= cmd_list.Count;
  Result:= S_OK;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//



initialization
  TAutoObjectFactory.Create(ComServer, TDelphiRobotAddin, Class_DelphiRobotAddin,
    ciSingleInstance, tmSingle);
end.
