unit main_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,login_u,dmData_u,sell_u;

type
  TfrmMain = class(TForm)
    imgBakc: TImage;
    imgMain: TImage;
    btnClose: TBitBtn;
    procedure imgMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.imgMainClick(Sender: TObject);
begin
frmMain.hide;
frmLog.show;
with frmLog do
begin
 tbsLogin.show;
 tbsLogin.Enabled:=true;
end;
end;

end.
