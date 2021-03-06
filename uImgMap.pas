unit uImgMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, uGameManager;

type
  TfImgMap = class(TForm)
    tile_fog: TImage;
    icon_iq: TImage;
    icon_food: TImage;
    icon_health: TImage;
    icon_man: TImage;
    icon_wood: TImage;
    icon_stone: TImage;
    tile_dead: TImage;
    tile_plane: TImage;
    tile_bush: TImage;
    tile_tree: TImage;
    tile_bigtree: TImage;
    tile_deadtree: TImage;
    tile_paporotnik: TImage;
    tile_appletree: TImage;
    tile_graystone: TImage;
    tile_brovnstone: TImage;
    tile_smallgrass: TImage;
    tile_wolf: TImage;
    tile_bizon: TImage;
    tile_bear: TImage;
    tile_mush: TImage;
    tile_blackwolf: TImage;
    icon_prod: TImage;
    icon_grass: TImage;
    icon_spear: TImage;
    icon_skin: TImage;
    icon_hide: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    tile_b_mush: TImage;
    Image8: TImage;
    tile_w_flover: TImage;
    tile_y_flower: TImage;
    tile_b_flower: TImage;
    iObjectActive: TImage;
    iObjectUnactive: TImage;
    iScienceUnactive: TImage;
    iScienceActive: TImage;
    iProductionActive: TImage;
    iProductionUnactive: TImage;
    iOperationActive: TImage;
    iOperationUnactive: TImage;
    action_1: TImage;
    action_2: TImage;
    action_3: TImage;
    action_4: TImage;
    action_5: TImage;
    action_6: TImage;
    action_7: TImage;
    action_9: TImage;
    action_8: TImage;
    iNewGame_active: TImage;
    iNewGame_unactive: TImage;
    iOptions_active: TImage;
    iOptions_unactive: TImage;
    iExit_active: TImage;
    iExit_unactive: TImage;
    Image7: TImage;
    iContinue_unactive: TImage;
    iContinue_active: TImage;
    icon_neutral: TImage;
    icon_wow: TImage;
    icon_angry: TImage;
    icon_fear: TImage;
    icon_what: TImage;
    tile_bigstone: TImage;
    lMessage: TLayout;
    rBackround: TRectangle;
    iImg: TImage;
    lBody: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    lMess: TLabel;
    rOkButton: TRectangle;
    lMessOKButton: TLabel;
    icon_dead: TImage;
    rMessScreenBackground: TRectangle;
    tile_mammoth: TImage;
    tile_tagedstone: TImage;
    tile_healflower: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    function AssignImage( target_img: TImage; source_img: string ): boolean;
  end;

var
  fImgMap: TfImgMap;

implementation

{$R *.fmx}

{ TfImgMap }

function TfImgMap.AssignImage(target_img: TImage; source_img: string): boolean;
var
   source: TImage;
begin
  result := false;
  source := TImage(FindComponent( source_img ));

  if assigned(source) then
  begin
      target_img.bitmap.Assign( source.MultiResBitmap.Bitmaps[1.0] );
      result := true;
  end;
end;

end.
