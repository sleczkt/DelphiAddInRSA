unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, RobotOM_TLB;

type
  TMainForm = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    ListBox1: TListBox;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    FRsaApplication:     IRobotApplication;
    FRsaProject:         IRobotProject;
    FRsaStructure:       IRobotStructure;

    FRsaBars:            IRobotBarServer;
    FRsaNodes:           IRobotNodeServer;

    FRSAConnections:     IRJointConnectionServer;

  public
    { Public declarations }
    procedure SetRobotApplication( const robotApp: IRobotApplication );
  end;


  procedure Copy_IRJointPlate( const source: IRJointPlate; target: IRJointPlate );



implementation

{$R *.dfm}


//****************************************************************************//
                                    { TMainForm }
//****************************************************************************//
procedure TMainForm.BitBtn2Click(Sender: TObject);
var
  i, number: Integer;

  arrNumbers: IRobotNumbersArray;

  conn:       IRJointConnection;
  connInfo:   RJointConnectionInfo;
  connType:   IRJointConnectionType;

  connPinned: IRJointPinnedColumnBase;

  lp, bp, tp: Double;

  const
    mm2m: Double = 0.001;
begin

  lp:= 700.0;
  bp:= 500.0;
  tp:= 35.0;

  arrNumbers:= FRsaConnections.GetAllNumbers;

  for i:= 1 to FRsaConnections.Count do
    begin
      number:=   arrNumbers.Get(i);
      conn:=     FRsaConnections.Get(number);

      connInfo:= FRsaConnections.GetInfo(number);

      connType:= connInfo.type_;

      if (connType = RobotOM_TLB.I_JCT_COL_PINNED) then
        begin
            connPinned:= ( conn as IRJointPinnedColumnBase );

            if (connPinned <> nil) then
              begin

                connPinned.FootPlate.Length:= lp;
                connPinned.FootPlate.Width:= bp;
                connPinned.FootPlate.Thick:= tp;

                connPinned.SetToRobot(connInfo);
              end;
        end;
    end;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
procedure Copy_IRJointPlate( const source: IRJointPlate; target: IRJointPlate );
begin
  With target do
    begin
      Length:= source.Length;
      Width:=  source.Width;
      Thick:=  source.Thick;
      Exist:=  source.Exist;
    end;
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

    end;
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

    end;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
function Copy_IRJointBearingPlate(const source: IRJointBearingPlate ; target: IRJointBearingPlate): Boolean;
var
  res: Boolean;
begin
  res:= false;
  With target do
    begin

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

    end;
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

    end;
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

    end;
  Result:= res;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//


























//----------------------------------------------------------------------------//
procedure Copy_IRJointProfile( const source: IRJointProfile; target: IRJointProfile );
begin
  With target do
    begin
      Section:= source.Section;
      Material:= source.Material;
      Angle:= source.Angle;
    end;
end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
procedure TMainForm.SetRobotApplication(const robotApp: IRobotApplication);
var
  i, c:       Integer;
  connInfo:   IRJointConnectionInfo;
  connName:   String;

  arrNumbers: IRobotNumbersArray;
begin
  FRsaApplication:= robotApp;

  FRsaProject:=         FRsaApplication.Project;
  FRsaConnections:=     FRsaProject.Connections;

  FRsaStructure:=       FRsaProject.Structure;
  FRsaNodes:=           FRsaStructure.Nodes;
  FRsaBars:=            FRsaStructure.Bars;





  c:= FRsaBars.GetAll.Count;

  Edit1.Text:= IntToStr( c );

  c:= FRsaNodes.GetAll.Count;

  Edit2.Text:= IntToStr( c );

  With FRsaConnections do
    begin
      for i:= 1 to Count do
        begin
          connInfo:= GetInfo( i );

          Case connInfo.type_ of
            I_JCT_KNEE_BOLTED:      connName:= 'I_JCT_KNEE_BOLTED';
            I_JCT_KNEE_WELDED:      connName:= 'I_JCT_KNEE_WELDED';
                  I_JCT_ANGLE:      connName:= 'I_JCT_ANGLE';
                   I_JCT_TRNS:      connName:= 'I_JCT_TRNS';
             I_JCT_COL_PINNED:      connName:= 'I_JCT_COL_PINNED';
              I_JCT_COL_FIXED:      connName:= 'I_JCT_COL_FIXED';
              I_JCT_COL_CONCR:      connName:= 'I_JCT_COL_CONCR';
                   I_JCT_TUBE:      connName:= 'I_JCT_TUBE';

            I_JCT_GUSSET_SIMPLE:    connName:= 'I_JCT_GUSSET_SIMPLE';
             I_JCT_GUSSET_CROSS:    connName:= 'I_JCT_GUSSET_CROSS';
            I_JCT_GUSSET_FLANGE:    connName:= 'I_JCT_GUSSET_FLANGE';
              I_JCT_BEAM_GIRDER:    connName:= 'I_JCT_BEAM_GIRDER';
              I_JCT_BEAM_COLUMN:    connName:= 'I_JCT_BEAM_COLUMN';
                   I_JCT_SPLICE:    connName:= 'I_JCT_SPLICE';
                      I_JCT_TIE:    connName:= 'I_JCT_TIE';
                  I_JCT_UNKNOWN:    connName:= 'I_JCT_UNKNOWN';
          end;

          self.ListBox1.Items.Add( connName );
        end;
    end;

end;
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
end.
