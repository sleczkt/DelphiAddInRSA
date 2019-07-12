unit ColumnBaseU;

interface

uses
  RobotOM_TLB;


function Copy_IRJointColumnBFoundation( const source: IRJointColumnBFoundation; target: IRJointColumnBFoundation ): Boolean;
function Copy_IRJointFootStiffenerSimple( const source: IRJointFootStiffenerSimple; target: IRJointFootStiffenerSimple ): Boolean;
function Copy_IRJointFootStiffenerTrapezoid( const source: IRJointFootStiffenerTrapezoid; target: IRJointFootStiffenerTrapezoid): Boolean;



implementation



function Copy_IRJointColumnBFoundation( const source: IRJointColumnBFoundation; target: IRJointColumnBFoundation ): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin

      Height:=                     source.Height;
      Length:=                     source.Length;
      Width:=                      source.Width;
      Tg:=                         source.Tg;
      Material:=                   source.Material;
      GroutLayer_fckg:=            source.GroutLayer_fckg;
      GroutLayer_cfd:=             source.GroutLayer_cfd;
      IsCracked:=                  source.IsCracked;
      CoeffPunchingMethod:=        source.CoeffPunchingMethod;
      IsCoeffSteelConcreteManual:= source.IsCoeffSteelConcreteManual;
      CoeffSteelConcreteManual:=   source.CoeffSteelConcreteManual;
      CoeffK:=                     source.CoeffK;
      CalcTypeCoeffK:=             source.CalcTypeCoeffK;
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootStiffenerSimple( const source: IRJointFootStiffenerSimple; target: IRJointFootStiffenerSimple ): Boolean;
var
  res: Boolean;
begin
  res:= false;
begin
  res:= true;
end;
  With target do
    begin

      Length:=        source.Length;
      Height:=        source.Height;
      Width:=         source.Width;
      Thick:=         source.Thick;
      type_:=         source.type_;
      CutHorizontal:= source.CutHorizontal;
      CutVertical:=   source.CutVertical;
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootStiffenerTrapezoid( const source: IRJointFootStiffenerTrapezoid; target: IRJointFootStiffenerTrapezoid): Boolean;
var
  res: Boolean;
begin
  res:= false;
begin
  res:= true;
end;
  With target do
    begin
      Length:=        source.Length;
      Height:=        source.Height;
      Width:=         source.Width;
      Thick:=         source.Thick;
      type_:=         source.type_;
      CutHorizontal:= source.CutHorizontal;
      CutVertical:=   source.CutVertical;
    end;
  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
















end.
