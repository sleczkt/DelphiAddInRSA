//****************************************************************************//
unit CommonU;

interface
uses
  RobotOM_TLB;

  function Copy_IRJointWeld( const source: IRJointWeld; target: IRJointWeld ): Boolean;
  function Copy_IRJointPlate( const source: IRJointPlate; target: IRJointPlate ): Boolean;
  function Copy_IRJointFootBolts(const source: IRJointFootBolts; target: IRJointFootBolts): Boolean;
  function Copy_IRJointAnchor(const source: IRJointAnchor; target: IRJointAnchor): Boolean;
  function Copy_IRJointAnchorBolt(const source: IRJointAnchorBolt; target: IRJointAnchorBolt): Boolean;
  function Copy_IRJointAnchorPlate(const source: IRJointAnchorPlate; target: IRJointAnchorPlate): Boolean;

  function Copy_IRJointFootPlate(const source: IRJointFootPlate; target: IRJointFootPlate): Boolean;
  function Copy_IRJointWedge(const source: IRJointWedge; target: IRJointWedge): Boolean;
  function Copy_IRJointBearingPlate(const source: IRJointBearingPlate ; target: IRJointBearingPlate): Boolean;
  function Copy_IRJointFootWelds(const source: IRJointFootWelds; target: IRJointFootWelds): Boolean;
  function Copy_IRJointFootStiffenerHoriz(const source: IRJointFootStiffenerHoriz; target: IRJointFootStiffenerHoriz): Boolean;
  function Copy_IRJointFootStiffenerVert(const source: IRJointFootStiffenerVert; target: IRJointFootStiffenerVert): Boolean;
  function Copy_IRJointFootMaterials(const source: IRJointFootMaterials; target: IRJointFootMaterials): Boolean;
  function Copy_IRJointColumnSquare(const source: IRJointColumnSquare; target: IRJointColumnSquare): Boolean;
  function Copy_IRobotMaterialData(const source: IRobotMaterialData; target: IRobotMaterialData): Boolean;
  function Copy_IRJointProfile( const source: IRJointProfile; target: IRJointProfile ): Boolean;


implementation


//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointWeld( const source: IRJointWeld; target: IRJointWeld ): Boolean;
begin
  With target do
    begin
      Thick:=    source.Thick;
      Strength:= source.Strength;
      type_:=    source.type_;
    end;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointPlate( const source: IRJointPlate; target: IRJointPlate ): Boolean;
var
  res: Boolean;
begin
  res:= false;
  With target do
    begin
      Length:= source.Length;
      Width:=  source.Width;
      Thick:=  source.Thick;
      Exist:=  source.Exist;
    end;
  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootBolts(const source: IRJointFootBolts; target: IRJointFootBolts): Boolean;
var
  res: Boolean;
begin
  res:= false;
  With target do
    begin
       SpacingH:=     source.SpacingH;
       SpacingV:=     source.SpacingV;
       DiameterName:= source.DiameterName;
       Friction:=     source.Friction;
       //Area:=         source.Area;     read only
       Rows:=         source.Rows;
       Distance:=     source.Distance;
       //Diameter:=   source.Diameter;  read only
       _className:=   source._className;
    end;
  res:= true;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointAnchor(const source: IRJointAnchor; target: IRJointAnchor): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      type_:= source.type_;

      Copy_IRJointAnchorPlate(source.AnchorPlate, AnchorPlate);
      Copy_IRJointAnchorBolt(source.Tige, Tige);
      Copy_IRJointFootBolts(source.Bolts, Bolts);
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointAnchorBolt(const source: IRJointAnchorBolt; target: IRJointAnchorBolt): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Length1:= source.Length1;
      Length2:= source.Length2;
      Length3:= source.Length3;
      Length4:= source.Length4;
    end;

  res:= true;

  Result:= res;

end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointAnchorPlate(const source: IRJointAnchorPlate; target: IRJointAnchorPlate): Boolean;
var
  res: Boolean;
begin
  res:= false;

  Copy_IRJointPlate(source, target);

  With target do
    begin
      type_:= source.type_;
      Material:= source.Material;
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootPlate(const source: IRJointFootPlate; target: IRJointFootPlate): Boolean;
var
  res: Boolean;
begin
  res:= false;
  Copy_IRJointPlate( source, target );

  With target do
    begin
      type_:=        source.type_;
      Diameter:=     source.Diameter;
      CenterAnchor:= source.CenterAnchor;
    end;

  res:= true;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointWedge(const source: IRJointWedge; target: IRJointWedge): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Copy_IRJointProfile( source.Profile, Profile );

      type_:=         source.type_;
      Length:=        source.Length;
      Width:=         source.Width;
      Thick:=         source.Thick;
      XTypeMaterial:= source.XTypeMaterial;
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointBearingPlate(const source: IRJointBearingPlate; target: IRJointBearingPlate): Boolean;
var
  res: Boolean;
begin
  res:= false;

  Copy_IRJointPlate( source, target);

  With target do
    begin
      ThickBearingBar:= source.ThickBearingBar;
    end;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootWelds(const source: IRJointFootWelds; target: IRJointFootWelds): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Copy_IRJointWeld(source.FootPlate, FootPlate);
      Copy_IRJointWeld(source.Wedge,     Wedge);
      Copy_IRJointWeld(source.Washer,    Washer);
      Copy_IRJointWeld(source.Bearing,   Bearing);
      Copy_IRJointWeld(source.Stiff,     Stiff);
    end;

  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootStiffenerHoriz(const source: IRJointFootStiffenerHoriz; target: IRJointFootStiffenerHoriz): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Thick:= source.Thick;
    end;
  res:= true;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootStiffenerVert(const source: IRJointFootStiffenerVert; target: IRJointFootStiffenerVert): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Thick:=        source.Thick;
      Length:=       source.Length;
      WidthSpacing:= source.WidthSpacing;
    end;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointFootMaterials(const source: IRJointFootMaterials; target: IRJointFootMaterials): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      PlateSigma:=      source.PlateSigma;
      PlateYoung:=      source.PlateYoung;
      CementAmount:=    source.CementAmount;
      ConcrSteelCoeff:= source.ConcrSteelCoeff;
      ConcrClass:=      source.ConcrClass;
    end;
  res:= true;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointColumnSquare(const source: IRJointColumnSquare; target: IRJointColumnSquare): Boolean;
var
  res: Boolean;
begin

  Result:= true;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRobotMaterialData(const source: IRobotMaterialData; target: IRobotMaterialData): Boolean;
var
  res: Boolean;
begin
  res:= false;

  With target do
    begin
      Name:=               source.Name;
      Nuance:=             source.Nuance;
      type_:=              source.type_;
      Steel_Thermal:=      source.Steel_Thermal;
      Timber_Type:=        source.Timber_Type;
      Default:=            source.Default;
      SecondName:=         source.SecondName;
      CB71_Category:=      source.CB71_Category;
      CB71_Nature:=        source.CB71_Nature;
      E:=                  source.E;
      NU:=                 source.NU;
      LX:=                 source.LX;
      RO:=                 source.RO;
      RE:=                 source.RE;
      RE_AxCompr:=         source.RE_AxCompr;
      CS:=                 source.CS;
      RT:=                 source.RT;
      E_5:=                source.E_5;
      E_Trans:=            source.E_Trans;
      PN_E_Trans:=         source.PN_E_Trans;
      PN_E_Additional:=    source.PN_E_Additional;
      RE_Bending:=         source.RE_Bending;
      RE_AxTens:=          source.RE_AxTens;
      RE_TrTens:=          source.RE_TrTens;
      RE_TrCompr:=         source.RE_TrCompr;
      RE_Shear:=           source.RE_Shear;
      DumpCoef:=           source.DumpCoef;
      CB71_Retreat:=       source.CB71_Retreat;
      CB71_Humidity:=      source.CB71_Humidity;
      EC_Deformation:=     source.EC_Deformation;
      PN_Deformation:=     source.PN_Deformation;
      GMean:=              source.GMean;
      Kirchoff:=           source.Kirchoff;
    end;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointProfile( const source: IRJointProfile; target: IRJointProfile ): Boolean;
var
  res: Boolean;
begin
  res:= false;
  With target do
    begin
      Section:= source.Section;
      Material:= source.Material;
      Angle:= source.Angle;
    end;

  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
end.
