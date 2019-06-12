unit DelphiAddInLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 5/29/2019 2:30:13 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\DelphiAddInLib\DelphiAddInLib.tlb (1)
// LIBID: {99DEF661-28C0-4957-BB64-C70F1BF9224D}
// LCID: 0
// Helpfile: 
// HelpString: DelphiAddInLib Library
// DepndLst: 
//   (1) v1.0 RobotOM, (C:\Program Files\Autodesk\Autodesk Robot Structural Analysis Professional 2019\system\exe\robotom.tlb)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, RobotOM_TLB, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DelphiAddInLibMajorVersion = 1;
  DelphiAddInLibMinorVersion = 0;

  LIBID_DelphiAddInLib: TGUID = '{99DEF661-28C0-4957-BB64-C70F1BF9224D}';

  CLASS_DelphiRobotAddin: TGUID = '{AA6EF21E-BFDD-47A9-A598-7142A4321FBF}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DelphiRobotAddin = IRobotAddIn;


// *********************************************************************//
// The Class CoDelphiRobotAddin provides a Create and CreateRemote method to          
// create instances of the default interface IRobotAddIn exposed by              
// the CoClass DelphiRobotAddin. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelphiRobotAddin = class
    class function Create: IRobotAddIn;
    class function CreateRemote(const MachineName: string): IRobotAddIn;
  end;

implementation

uses ComObj;

class function CoDelphiRobotAddin.Create: IRobotAddIn;
begin
  Result := CreateComObject(CLASS_DelphiRobotAddin) as IRobotAddIn;
end;

class function CoDelphiRobotAddin.CreateRemote(const MachineName: string): IRobotAddIn;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelphiRobotAddin) as IRobotAddIn;
end;

end.
