unit uImgMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TfImgMap = class(TForm)
    tile_forest: TImage;
    tile_fog: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImgMap: TfImgMap;

implementation

{$R *.fmx}

end.
