unit buying_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Samples.Spin,dmdata_u,property_u,login_U;

type
  TfrmBuy = class(TForm)
    pgBuy: TPageControl;
    tbsBuy: TTabSheet;
    imgHouse: TImage;
    lblAmount: TLabel;
    tbsReceipt: TTabSheet;
    redDis: TRichEdit;
    lblDis: TLabel;
    lblTop: TLabel;
    btnNxt: TButton;
    tbsThank: TTabSheet;
    lblPaymentType: TLabel;
    edtPayType: TEdit;
    lblPayperiod: TLabel;
    spdTime: TSpinEdit;
    lbln: TLabel;
    Image2: TImage;
    Label1: TLabel;
    Label4: TLabel;
    imgBack: TImage;
    lblNameSur: TLabel;
    lblClose: TLabel;
    procedure tbsReceiptShow(Sender: TObject);
    procedure lblDisClick(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuy: TfrmBuy;
  objProperty:TProperty;
  sPropertyID,sDate:string;
  rTot:real;
  bAv:boolean;
  objLogin:TObject;
  sNamet,sSurnamet,sIDt:string;


implementation

{$R *.dfm}



procedure TfrmBuy.FormActivate(Sender: TObject);
begin
redDis.Lines.Add('Property ID'+#10+'Customer Name'+#10+  'Customer Surname'+#10+'Payment'+#10+    'Completed'+#10+    'House View Date' );
 bAv:=true;
 lblNamesur.Caption:='';
 sNamet:=inputbox('Please re-enter your name:','','');
 sSurnamet:=inputbox('Please re-enter your surname:','','');
 lblAmount.caption:='R'+floattostr(frmLog.rCostt);
end;

procedure TfrmBuy.lblCloseClick(Sender: TObject);
begin
exit;
end;

procedure TfrmBuy.lblDisClick(Sender: TObject);
begin
with datamoduledata do
begin
  tblCust.first;
  while not tblCust.eof do
  begin
    if (tblCust['Name']=sNameT) and (tblCust['Surname']=sSurnamet) then
    begin
      sIDt:=tblCust['CustomerID'];
    end;
    tblCust.next;

  end;

end;
btnNxt.Enabled:=true;
redDis.lines.add(objProperty.tostring);
 bAv:=false;
 objProperty.setPropertyAvailability(bAv);
 with datamoduledata do
 begin
   tblSales.first;
   while not tblSales.eof do
   begin
     if tblSales['PropertyID']=sPropertyID then
     begin
     tblSales.insert;
     tblSales.edit;
       tblSales['Availability']:=bAv;
       tblSales['CustomerID']:=sIDt;
     end;
     tblSales.next;

   end;

   //  showmesage('Property Successfully purchased!');
 lblNameSur.Caption:=('Thank you '+sNamet+' '+sSurnamet+' !');


 end;
end;

procedure TfrmBuy.lblnClick(Sender: TObject);
var
iP:integer;
sPaymentt:string;
begin
 sPaymentt:=edtPaytype.text;
iP:=spdTime.value;
objProperty:=TProperty.create(sPropertyID,sIDt,sNamet,sSurnamet,sDate,rTot,bAv);
//showmessage('Please fill in missing info');
 lblAmount.caption:=floattostrf(objProperty.calculateamount(sPaymentt,rTot,iP),ffcurrency,5,3);


end;

procedure TfrmBuy.tbsReceiptShow(Sender: TObject);
begin
redDis.clear;
tbsBuy.Hide;
btnNxt.Enabled:=false;
end;

end.
