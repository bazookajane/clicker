unit uToolPanelManager;

interface

uses
    FMX.TabControl, FMX.Layouts, FMX.Objects,

    uGameObjectManager;

type
    TImageArr = array of TImage;

    TToolPanelManager = class
      private
        fTabButtonPanel
               : TLayout;
        fTabPanel
               : TTabControl;
        fButtons,
        fButtonsActive,
        fButtonsUnactive
               : TImageArr;

        fObjectPreview : TImage;

        fCurrObject: TResourcedObject;
        /// ������� ��������� �� ����� ������, �� ������ ��� ��� ������ ����� �����������

      public
        procedure ObjectSelect( obj: TResourcedObject );
        procedure SetupComponents( tabButtonPanel: TLayout; tabPanel: TTabControl; buttons, active, unactive: TImageArr );
        procedure SetupObjectPanelComponents( preview: TImage );
        procedure Init;
    end;

var

   mToolPanel: TToolPanelManager;

implementation

{ TToolPanelManager }

procedure TToolPanelManager.SetupComponents(tabButtonPanel: TLayout;
  tabPanel: TTabControl; buttons, active,
  unactive: TImageArr);
/// ��������� �������� ��������� ������ ����������
///    tabButtonPanel - ���� �� ������� ��������� ������ ������������ �������
///    tabPanel - ��� ��������� �� ����������-��������. �� ���������� ������������� ��������
///    buttons - ����� ������ � ����������, ������� ����� ����������� ������. �� ������� ������
///              ��������������� ������� ������� tabPanel. �.�. 1 ������ ����� ��������� 1 �������� � �.�.
///    active - ����� ��������, ���������� �������� ��������� ��������� ��� buttons
///    unactive - ����� ��������, ���������� �������� ����������� ��������� ��� buttons
begin
    fTabButtonPanel := tabButtonPanel;
    fTabPanel := tabPanel;
    fButtons := buttons;
    fButtonsActive := active;
    fButtonsUnactive := unactive;
end;

procedure TToolPanelManager.SetupObjectPanelComponents(preview: TImage);
begin
    fObjectPreview := preview;
end;

procedure TToolPanelManager.Init;
/// �������������� ��������� ���� ������
var
    i: integer;
begin
    fTabPanel.ActiveTab := fTabPanel.Tabs[0];

    for I := 0 to High(fButtons) do
    if i = 0
    then fButtons[i].bitmap.Assign( fButtonsActive[i].MultiResBitmap.Bitmaps[1.0] )
    else fButtons[i].bitmap.Assign( fButtonsUnactive[i].MultiResBitmap.Bitmaps[1.0] )

end;

procedure TToolPanelManager.ObjectSelect(obj: TResourcedObject);
begin
    if not Assigned(obj.Image) or not (obj.Image is TImage) then exit;
    fObjectPreview.bitmap.Assign( TImage(obj.Image).MultiResBitmap.Bitmaps[1.0] );

    fCurrObject := obj;
end;

initialization
   mToolPanel := TToolPanelManager.Create;

finalization
   mToolPanel.Free;

end.