//****************************************************************************//
unit PinnedColumnBaseU;

interface

uses
  RobotOM_TLB,
  CommonU,
  ColumnBaseU;




function Copy_IRJointPinnedColumnBase(const source: IRJointPinnedColumnBase; target: IRJointPinnedColumnBase): Boolean;





implementation


//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointPinnedColumnBase(const source: IRJointPinnedColumnBase; target: IRJointPinnedColumnBase): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin

      StiffType:= source.StiffType;
      //NodeNumber:= source.NodeNumber;
      MilledEnd:= source.MilledEnd;
      IsSwayFrame:= source.IsSwayFrame;
      //ColumnLength:= source.ColumnLength;
      BetaCoeff:= source.BetaCoeff;


      //Copy_IRJointProfile(source.Profile, Profile);
      Copy_IRJointFootBolts( source.Bolts, Bolts );
      Copy_IRJointAnchor(source.Anchor, Anchor);
      Copy_IRJointFootPlate( source.FootPlate, FootPlate);
      Copy_IRJointWedge( source.Wedge, Wedge);
      Copy_IRJointPlate( source.Base, Base);
      Copy_IRJointPlate( source.Washer, Washer);
      Copy_IRJointPlate( source.Bearing, Bearing);
      Copy_IRJointBearingPlate( source.BearingPlate, BearingPlate);
      Copy_IRJointFootWelds( source.Welds, Welds);
      Copy_IRJointFootStiffenerHoriz( source.StiffHoriz, StiffHoriz);
      Copy_IRJointFootStiffenerVert( source.StiffVert, StiffVert);
      Copy_IRJointFootMaterials( source.Materials, Materials);
      Copy_IRJointColumnSquare( source.Square, Square);
      Copy_IRobotMaterialData( source.BasePlateMaterial, BasePlateMaterial);
      Copy_IRJointColumnBFoundation( source.Foundation, Foundation);
      Copy_IRJointFootStiffenerSimple( source.SimpleStiff, SimpleStiff);
      Copy_IRJointFootStiffenerTrapezoid( source.TrapezoidStiff, TrapezoidStiff);
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//


end.
