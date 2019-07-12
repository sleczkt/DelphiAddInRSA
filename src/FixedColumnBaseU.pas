unit FixedColumnBaseU;

interface
uses
  RobotOM_TLB,
  CommonU,
  ColumnBaseU;





function Copy_IRJointFixedFootWelds(const source: IRJointFixedFootWelds; target: IRJointFixedFootWelds): Boolean;

function Copy_IRJointFootStiffenerComplex(const source: IRJointFootStiffenerComplex; target: IRJointFootStiffenerComplex): Boolean;




function Copy_IRJointFixedColumnBase( const source: IRJointFixedColumnBase; target: IRJointFixedColumnBase ): Boolean;



implementation


//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFixedFootWelds(const source: IRJointFixedFootWelds; target: IRJointFixedFootWelds): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Copy_IRJointWeld(source.FootPlate, FootPlate);
      Copy_IRJointWeld(source.Wedge, Wedge);
      Copy_IRJointWeld(source.Washer, Washer);
      Copy_IRJointWeld(source.Stiff, Stiff);
    end;

  res:= true;

  Result:= res;

end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootStiffenerComplex(const source: IRJointFootStiffenerComplex; target: IRJointFootStiffenerComplex): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Length:=        source.Length;
      Height:=        source.Height;
      ThickPlateHor:= source.ThickPlateHor;
      ThickStiff:=    source.ThickStiff;
    end;

  res:= true;

  Result:= res;

end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFixedColumnBase( const source: IRJointFixedColumnBase; target: IRJointFixedColumnBase ): Boolean;
var
  res: Boolean;

begin
  res:= false;
  With target do
    begin

      //NodeNumber:=          source.NodeNumber;
      StiffType:=           source.StiffType;
      IsSwayFrame:=         source.IsSwayFrame;
      IsEndFrez:=           source.IsEndFrez;
      ColumnBaseCalcModel:= source.ColumnBaseCalcModel;
      //ColumnLength:=        source.ColumnLength;
      BetaCoeff:=           source.BetaCoeff;

      Copy_IRJointFootBolts(source.Bolts, Bolts);
      Copy_IRJointAnchor(source.Anchor, Anchor);
      Copy_IRJointFootPlate(source.FootPlate, FootPlate);
      Copy_IRJointWedge(source.Wedge, Wedge);
      Copy_IRJointPlate(source.Base, Base);
      Copy_IRJointPlate(source.Washer, Washer);
      Copy_IRJointFixedFootWelds(source.Welds, Welds);
      Copy_IRJointFootStiffenerSimple(source.SimpleStiff, SimpleStiff);
      Copy_IRJointFootStiffenerComplex(source.ComplexStiff, ComplexStiff);
      //Copy_IRJointProfile(source.Profile, Profile);
      Copy_IRJointFootMaterials(source.Materials, Materials);
      Copy_IRobotMaterialData(source.BasePlateMaterial, BasePlateMaterial);

      Copy_IRJointFootStiffenerTrapezoid(source.TrapezoidStiff, TrapezoidStiff);
      Copy_IRJointPlate(source.UpperPlate, UpperPlate);
      Copy_IRJointColumnBFoundation(source.Foundation, Foundation);
    end;
  res:= true;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//





end.
