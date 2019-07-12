library DelphiAddInLib;

uses
  ComServ,
  DelphiAddInLib_TLB in 'DelphiAddInLib_TLB.pas',
  RobotOM_TLB in 'RobotOM_TLB.pas',
  DelphiRobotAddinU in 'DelphiRobotAddinU.pas' {DelphiRobotAddin: CoClass},
  MainFormU in 'MainFormU.pas' {MainForm},
  PinnedColumnBaseU in 'PinnedColumnBaseU.pas',
  CommonU in 'CommonU.pas',
  FixedColumnBaseU in 'FixedColumnBaseU.pas',
  ColumnBaseU in 'ColumnBaseU.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
