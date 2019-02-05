unit uTiledModeManager;

///    �������� ������ ���� ���������� �� ������
///    ������ ����� ����������� ��� ���� �� ����� ���������� (���������):
///        - ������������ ����������
///        - ��������� ������
///
///    ������ ���� ����� 4 ��������:
///    - ������������ (����� ���������� ������)
///    - ��� ���������
///    - ������ (�� ������. ��� �� ������ ��������)
///    - ��������� ������ (�� ������. ����� ���� ���������� ��-�� ���� ��������� ��� �������������� �������)

interface

uses
    FMX.Layouts, FMX.Objects, SysUtils, System.Types, FMX.Graphics, FMX.ImgList, uImgMap;

const

    // ����������� ����� ������
    // ���� ���������
    LAND_FOREST = 0;      // ���
    LAND_PLAIN  = 1;     // �������
    LAND_MOUNT  = 2;     // ����
    LAND_SAND   = 3;     // �������
    LAND_ICE    = 4;     // ������
    LAND_CANYON = 5;     // ������
    LAND_LAVA   = 6;     // ������� ����

    // ���� ��������
    OBJ_NONE        =  0;  // ��� �������
    OBJ_FOG         =  1;  // ���� ��� �� ���������� (����� �����)
    OBJ_TOWN_SMALL  =  2;  // ��������� ���������
    OBJ_TOWN_MEDIUM =  3;  // ������� ���������
    OBJ_TOWN_BIG    =  4;  // ������� ���������
    OBJ_TOWN_GREAT  =  5;  // �������� ���������
    OBJ_PREDATOR    =  6;  // ������
    OBJ_MAMONT      =  7;  // ������ (���������)
    OBJ_ATTACKER    =  8;  // ��������� ����� (���������)
    OBJ_CAVE        =  9;  // ������
    OBJ_HERD        = 10;  // ����� (���������)

    MAP_COL_COUNT   = 50;
    MAP_ROW_COUNT   = 50;

    TILE_WIDTH      = 50;
    TILE_HEIGHT     = 50;

type

    { ������� �����, ���������� � ���� ��������� ������� �����.
      1 - ��� ���������
      2 - ������
      3 - �����, ���� ������ ��� �� ����������
    }
    TTile = record
        Land: smallint;   // ��� ���������. ��. ��������� LAND_���
        Obj: smallint;    // ��� �������, ���� ����
        Fog: boolean;     // ����� �� ������ ������� �������������
    end;

    TTileModeDrive = class
    private
        fScreen : TScrollBox;
        fTiles: array [0..MAP_COL_COUNT, 0..MAP_ROW_COUNT] of TTile;
        fImages: TImageList;
        fViewPort: TLayout;
    public

        procedure SetupComponents(screen: TObject);
                 // ���������� � ������ ������� ����� � ������� ��������� ���� ������������

        procedure BuildField;
                 // ������������ �������� ����

        procedure UpdateField;
                 // ������ / ��������� ������� ����
    end;

var
    mTileDrive : TTileModeDrive;

implementation

{ TTileModeDrive }

 uses
    uMain;

 var
   BitmapSize: TSizeF;


procedure TTileModeDrive.BuildField;
{ ������������ �������� ���� }
var
    col, row: integer;
begin

    for col := 0 to MAP_COL_COUNT - 1 do
    for row := 0 to MAP_ROW_COUNT - 1 do
    fTiles[col, row].Land := LAND_FOREST;

end;

procedure TTileModeDrive.UpdateField;
var
    col, row: integer;
    image: TImage;
begin

    if Assigned(fViewPort) then FreeAndNil(fViewPort);
    fViewPort := TLayout.Create(fScreen);
    fViewPort.Parent := fScreen;
    fViewPort.Width := MAP_COL_COUNT * TILE_WIDTH;
    fViewPort.Height := MAP_ROW_COUNT * TILE_HEIGHT;

    for col := 0 to MAP_COL_COUNT - 1 do
    for row := 0 to MAP_ROW_COUNT - 1 do
    begin

        image := TImage.Create(fViewPort);
        image.Parent := fViewPort;
        image.Height := TILE_WIDTH;
        image.Width := TILE_HEIGHT;
        image.Position.X := col * TILE_WIDTH;
        image.Position.Y := row * TILE_HEIGHT;

        case fTiles[col,row].Land of
            LAND_FOREST: image.bitmap.Assign( fImgMap.iForest.MultiResBitmap.Bitmaps[1.0] );
        end;

    end;

end;

procedure TTileModeDrive.SetupComponents(screen: TObject);
begin
    fScreen := Screen as TScrollBox;
end;

initialization

    BitmapSize.cx := 50;
    BitmapSize.cy := 50;

finalization

    mTileDrive.Free;

end.