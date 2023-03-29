unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FPReadGif, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ExtDlgs, ActnList;

type

  { TForm1 }

  TForm1 = class(TForm)
    ActOpenPict: TAction;
    ActionList1: TActionList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    oDlg: TOpenDialog;
    ScrollBox1: TScrollBox;
    procedure ActOpenPictExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ActOpenPictExecute(Sender: TObject);
var
  img: TImage = nil;
begin
  if not TObject(Sender).InheritsFrom(TButton) then Exit;

  if TButton(Sender).Equals(Button1) then img:= Image1;
  if TButton(Sender).Equals(Button3) then img:= Image3;
  if TButton(Sender).Equals(Button5) then img:= Image2;
  if TButton(Sender).Equals(Button7) then img:= Image4;

  if oDlg.Execute then
  begin
    if (ExtractFileExt(oDlg.FileName) = '.png') then
      TImage(img).Picture.PNG.LoadFromFile(oDlg.FileName);

    if ((ExtractFileExt(oDlg.FileName) = '.jpg') or (ExtractFileExt(oDlg.FileName) = 'jpeg')) then
      img.Picture.Jpeg.LoadFromFile(oDlg.FileName);

    if (ExtractFileExt(oDlg.FileName) = '.bmp') then
      img.Picture.Bitmap.LoadFromFile(oDlg.FileName);

   if (ExtractFileExt(oDlg.FileName) = '.gif') then //uses FPReadGif;
      img.Picture.LoadFromFile(oDlg.FileName);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.OnClick:= @ActOpenPictExecute;
  Button3.OnClick:= @ActOpenPictExecute;
  Button5.OnClick:= @ActOpenPictExecute;
  Button7.OnClick:= @ActOpenPictExecute;
end;

end.

