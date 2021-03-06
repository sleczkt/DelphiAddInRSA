unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, RobotOM_TLB,
  PinnedColumnBaseU;

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
    Label3: TLabel;
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


  parrent:    IRJointPinnedColumnBase;
  connPinned: IRJointPinnedColumnBase;

  findFirst: Boolean;

  const
    mm2m: Double = 0.001;
begin


  findFirst:= false;

  arrNumbers:= FRsaConnections.GetAllNumbers;

  for i:= 1 to FRsaConnections.Count do
    begin
      number:=   arrNumbers.Get(i);
      conn:=     FRsaConnections.Get(number);

      connInfo:= FRsaConnections.GetInfo(number);

      connType:= connInfo.type_;

      if (connType = RobotOM_TLB.I_JCT_COL_PINNED) then
        begin

            if (findFirst) then
              begin
                connPinned:= ( conn as IRJointPinnedColumnBase );
                Copy_IRJointPinnedColumnBase( parrent, connPinned);
                connPinned.SetToRobot( connInfo );
              end
            else
              begin
                parrent:= ( conn as IRJointPinnedColumnBase );
                findFirst:= true;
              end;
        end;
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
