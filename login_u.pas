unit login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids,dmData_u, Vcl.Samples.Spin,admin_u,property_u;

type
  TfrmLog = class(TForm)
    pgLogin: TPageControl;
    tbsLogin: TTabSheet;
    tbsMenu: TTabSheet;
    tbsBuy: TTabSheet;
    Image1: TImage;
    imgLog: TImage;
    imgSign: TImage;
    lblUser: TLabel;
    edtUser: TEdit;
    lblLog: TLabel;
    lblPass: TLabel;
    edtPass: TEdit;
    lblNextLog: TLabel;
    btnBacksign: TButton;
    lblSi: TLabel;
    lblName: TLabel;
    edtName: TEdit;
    lblSur: TLabel;
    lblEmail: TLabel;
    lblPasscode: TLabel;
    edtSurname: TEdit;
    edtEmail: TEdit;
    edtPasscode: TEdit;
    lblClic: TLabel;
    btnBacklog: TButton;
    Image2: TImage;
    tbsSell: TTabSheet;
    tbsData: TTabSheet;
    dbnNav: TDBNavigator;
    lblOr: TLabel;
    btnClosemenu: TBitBtn;
    imgSell: TImage;
    imgBuy: TImage;
    Image3: TImage;
    redBuy: TRichEdit;
    Label1: TLabel;
    cmbHousetypes: TComboBox;
    lblRegion: TLabel;
    cmbRegion: TComboBox;
    lbludget: TLabel;
    edtBudgt: TEdit;
    Image4: TImage;
    tbsSelldbg: TTabSheet;
    dbgPropertySales: TDBGrid;
    Button1: TButton;
    lblbuynext: TLabel;
    dbgCust: TDBGrid;
    tbsAgent: TTabSheet;
    dbgAgent: TDBGrid;
    tbsRegion: TTabSheet;
    dbgRegion: TDBGrid;
    BitBtn1: TBitBtn;
    lblCustomer: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblAM: TLabel;
    Label5: TLabel;
    lbltoil: TLabel;
    lblPop: TLabel;
    lblLoc: TLabel;
    Label6: TLabel;
    edtAmen: TEdit;
    edtV: TEdit;
    edtLoc: TEdit;
    spdBed: TSpinEdit;
    spdBath: TSpinEdit;
    spdAge: TSpinEdit;
    Label4: TLabel;
    Image5: TImage;
    tbsAbout: TTabSheet;
    Label7: TLabel;
    memAbt: TMemo;
    Memo1: TMemo;
    lblext: TLabel;
    Image6: TImage;
    tbsCustService: TTabSheet;
    Label8: TLabel;
    edtIDserv: TLabel;
    lblmsg: TLabel;
    edtIDService: TEdit;
    edtMessage: TEdit;
    lblMsgClick: TLabel;
    dbnSales: TDBNavigator;
    cmbH: TComboBox;
    btnAdmin: TButton;
   // fNameT:string;
    //fSurnameT:string
    procedure imgLogClick(Sender: TObject);
    procedure imgSignClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBacksignClick(Sender: TObject);
    procedure btnBacklogClick(Sender: TObject);
    procedure lblNextLogClick(Sender: TObject);
    procedure imgBuyClick(Sender: TObject);
    procedure imgSellClick(Sender: TObject);
    procedure lblBuyclickClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbHousetypesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmbRegionChange(Sender: TObject);
    procedure edtBudgtChange(Sender: TObject);
    procedure edtHouseIDChange(Sender: TObject);
    procedure lblbuynextClick(Sender: TObject);
    procedure lblextClick(Sender: TObject);
    procedure lblClicClick(Sender: TObject);
    procedure lblCustomerClick(Sender: TObject);
    procedure lblMsgClickClick(Sender: TObject);
    procedure tbsSellEnter(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sNameT:string;
    sSurnamet:string;
    sIDt:string;
    sPasscode:string;
    selectedID:integer;
    shouset:string;
    rCostt:real;
    iPropaget:integer;

    sPropT,sPropAmen,sPropLoc:string;
    iAge,iBed,iBath:integer;
    rValue:real;
     //constructor create(pNameT,pIDt,pSurnameT:string);
  end;

var
  frmLog: TfrmLog;
  bValid:boolean;
  arrPropID:array [1..1000] of integer;
  arrPropType:array [1..1000] of string;
  arrPropPrice:array [1..1000] of real;
  arrPropAge:array [1..1000] of integer;
  sRegion,sType:string;
  //sNamet,sSurname,sIDt:string;


implementation

{$R *.dfm}
uses sell_u,buying_u;


procedure TfrmLog.btnAdminClick(Sender: TObject);
var
sUser,sPass:string;
bT:boolean;
begin
bT:=true;
 sUser:=inputbox('Please enter your name:','','');
 sPass:=inputbox('Please enter your email','','');
 if (sUser='') OR (sPass='') then
 begin
  bT:=false;
  showmessage('Please enter your name and email');
 end;

  with datamoduledata do
  begin
  tblAgent.First;
  while not tblAgent.eof do
  begin
   if (tblAgent['Name']=sUser) AND (tblAgent['Email']=sPass) then
   begin
     bT:=true;
   end;
  end;
     tblAgent.Next;
  end;
    if bt=true then
    begin
      showmessage('Successfully logged in');
      close;
      frmAdmin.Show;
    end
    else
    begin
      showmessage('Please retry again');
    end;

end;

procedure TfrmLog.btnBacklogClick(Sender: TObject);
begin
btnBacklog.Hide;
 lblName.Hide;
lblSur.hide;
lblEmail.hide;
lblPasscode.hide;
lblSi.hide;
edtName.hide;
edtSurname.hide;
edtEmail.hide;
edtPasscode.hide;
imgSign.Show;
imgLog.Show;
lblClic.Hide;
imglog.Enabled:=true;
imgSign.Enabled:=true;
end;

procedure TfrmLog.btnBacksignClick(Sender: TObject);
begin
 imgSign.show;
imgLog.show;
imgLog.Enabled:=true;
imgLog.transparent:=false;
lblLog.hide;
lblUser.hide;
lblPass.hide;
edtUser.hide;
edtPass.hide;
lblNextlog.hide;
btnBackSign.Hide;
imgSign.Enabled:=true;
imgLog.Enabled:=true;
end;

procedure TfrmLog.Button1Click(Sender: TObject);
begin
//dbnNav.DataSource:=dmdata.dscCust ;
//dbgLogin.DataSource:=dmdata.dscCust;
end;

procedure TfrmLog.cmbHousetypesChange(Sender: TObject);
var
i:integer;
begin
bValid:=true;

//else
//begin
  //bValid:=true;
//end;

end;

procedure TfrmLog.cmbRegionChange(Sender: TObject);
begin

//else
//begin
  //bValid:=true;
//end;

end;

//constructor TfrmLog.create(sNameT, sIDt, sSurnameT: string);
{begin

end;   }

procedure TfrmLog.edtBudgtChange(Sender: TObject);
var
amount:real;
begin
{amount:=strtofloat(edtBudgt.Text);
if amount<100000 then
begin
  showmessage('Please enter a amount over R100000');
  showmessage('Property not found');
  redBuy.Clear;
    cmbRegion.Text:='-Select-';
      cmbhousetypes.Text:='-Select-';
end;
         }
end;

procedure TfrmLog.edtHouseIDChange(Sender: TObject);
begin
//edtHouseID.Clear;
end;

procedure TfrmLog.FormActivate(Sender: TObject);
var
i:integer;
begin
i:=0;
imgLog.Show;
imgSign.Enabled:=true;
imgLog.Enabled:=true;
lblLog.Hide;
lblUser.Hide;
lblPass.Hide;
edtUser.Hide;
edtPass.Hide;
lblNextlog.Hide;
lblNextLog.Transparent:=true;
lblLog.Transparent:=true;
lblUser.Transparent:=true;
lblPass.Transparent:=true;
btnBacksign.Hide;
lblName.Hide;
lblSur.hide;
lblEmail.hide;
lblPasscode.hide;
lblSi.hide;
lblClic.Hide;
edtName.hide;
edtSurname.hide;
edtEmail.hide;
edtPasscode.hide;
btnBacklog.Hide;
tbsMenu.Hide;
tbsBuy.Hide;
tbsSell.Hide;
tbsAgent.Hide;
tbsRegion.Hide;
tbsData.hide;
tbsSelldbg.Hide;
tbsMenu.Enabled:=false;
tbsBuy.Enabled:=false;
tbsSell.Enabled:=false;
tbsAgent.Enabled:=false;
tbsregion.Enabled:=false;
tbsData.Enabled:=false;
tbsSelldbg.Enabled:=false;

  with datamoduledata do
  begin
    tblSales.First;
    while not (tblSales.eof) do
    begin
     // if i >= Length(arrPropID) then
       // Break;
      arrPropID[i] := tblSales['PropertyID'];
      arrPropType[i] := tblSales['PropertyType'];
      arrPropPrice[i] := tblSales['TotalCost'];
      arrPropAge[i] := tblSales['Age'];
      i := i + 1;
      tblSales.Next;
    end;
  end;



end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
dbgCust.DataSource:= datamoduledata.dscCust;
dbgPropertySales.datasource:=datamoduledata.dscSales;
dbgAgent.DataSource:=datamoduledata.dscAgent;
dbgRegion.DataSource:=datamoduledata.dscregion;
dbnSales.DataSource:=datamoduledata.dscSales;
datamoduledata.tblSales.Open;
datamoduledata.tblCust.Open;
//datamoduledata.qryCust.Open;
//datamoduledata.qryCust.Active:=true;

end;

procedure TfrmLog.imgBuyClick(Sender: TObject);
begin
tbsBuy.Show;
tbsBuy.Enabled:=true;
end;

procedure TfrmLog.imgLogClick(Sender: TObject);
begin
imgSign.Hide;
imgLog.Hide;
imgLog.Enabled:=false;
imgLog.transparent:=true;
lblLog.show;
lblUser.show;
lblPass.show;
edtUser.show;
edtPass.show;
lblNextlog.Show;
btnBackSign.Show;
imgSign.Enabled:=false;

end;

procedure TfrmLog.imgSellClick(Sender: TObject);
begin
tbsSell.show;
tbsSell.Enabled:=true;
end;

procedure TfrmLog.imgSignClick(Sender: TObject);
begin
imgLog.Hide;
imgSign.Hide;
imgSign.Enabled:=false;
lblName.Show;
lblSur.Show;
lblEmail.Show;
lblPasscode.Show;
lblSi.Show;
edtName.Show;
edtSurname.Show;
lblClic.Show;
edtEmail.Show;
edtPasscode.show;
lblName.transparent:=true;
lblSur.transparent:=true;
lblEmail.transparent:=true;
lblPasscode.transparent:=true;
lblSi.transparent:=true;;
  btnBacklog.Show;
  imgLog.Enabled:=false;
end;

procedure TfrmLog.Label4Click(Sender: TObject);
var
bT:boolean;
begin
iAge:=0;
iBath:=0;
iBed:=0;
bT:=true;
sPropt:= cmbH.Text;
  sPropAmen:= edtAmen.Text;
   sPropLoc:= edtLoc.Text;
   iAge:=spdAge.Value;
   iBed:=spdBed.value;
   iBath:= spdBath.value;
    rValue:=strtofloat(edtV.Text);

    if cmbH.Text='                  -Select-' then
    begin
      showmessage('Please select a property type');
      bT:=false;
    end;
    if (edtAmen.Text='') then
    begin
      showmessage('Please enter a/an amenity');
      bT:=false;
    end;
    if (edtLoc.text='') then
    begin
      showmessage('Please input the propertys location');
      bT:=false;
    end;
    if edtv.Text='' then
    begin
      showmessage('Please enter a value');
      bT:=false;
    end;
    if (spdAge.Value=0) OR (spdBed.Value=0) OR (spdBath.Value=0)  then
    begin
      showmessage('Please ensure your value for either the age/bathrooms/bedrooms is greater than 0');
      bT:=false;
    end;

    if rValue<50000 then
    begin
      showmessage('Property Value must be greater than 50000');
      bT:=false;
    end;
  if bT=TRUE then
  begin
    showmessage('Property Details imported, Thank You!');
      frmSell.show;
      frmSell.tbsSell.Show;
    close;
  end
  else
  begin
    showmessage('Please all information entered meets the requirements');
  end;










end;

procedure TfrmLog.lblBuyclickClick(Sender: TObject);
begin
if (cmbHousetypes.text='') or (cmbHousetypes.Text='-Select-') then
begin
  showmessage('Please select a house type');
end;
end;

procedure TfrmLog.lblbuynextClick(Sender: TObject);
var
rbudget:real;
i,j,k:integer;
fcurrency:currency ;
sHouse,sRegion:string;
begin
j:=0;
k:=0;
sHouse:=cmbHousetypes.Text;
sRegion:=cmbRegion.Text;
fCurrency:=strtofloat(edtBudgt.text);

if (cmbHouseTypes.Text='-Select-') OR (cmbRegion.Text='-Select-') then
begin
  showmessage('Please select an option in the Region/House type tab');


end;
 for j := 1 to 1000 do
    begin
      redbuy.Lines.Add(inttostr(arrPropID[J])+#9+arrProptype[j]+#9+inttostr(arrPropAge[j])+#9+floattostr(arrPropprice[j]));

    end;
 selectedid:=strtoint(inputbox('Please select a property ID:','',''));
 if not selectedid=0 then
     begin
  for k := 1 to 100 do
    begin
      if arrPropID[k]=selectedid then
      begin
       shouset:=arrPropType[k];
       iPropaget:=arrPropAge[k];
       rCostt:=arrPropPrice[k];
      end;
    end;
    frmBuy.show;
     end
     else
     showmessage('Please select a property using its ID');
end;
procedure TfrmLog.lblClicClick(Sender: TObject);
var
sName,sSurname,sEmail,sPass,sSQL1:string;
bValid:boolean;
iagentid:integer;
begin
iagentid:=0;
bValid:=true;
sName:=edtName.Text;
sSurname:=edtSurname.Text;
sEmail:=edtEmail.Text;
sPass:=edtPasscode.Text;
if (edtName.Text='') then
begin
  showmessage('Please enter your name');
  bValid:=false;
end;
if edtSurname.Text='' then
begin
  showmessage('Please enter your surname');
  bValid:=false;
end;
if edtEmail.Text='' then
begin
  showmessage('Please enter your email');
  bValid:=false;
end;
if edtPasscode.Text='' then
begin
  showmessage('Please enter your passcode');
  showmessage('Dont forget it!! :)');
  bValid:=false;
end;
  with datamoduledata do
  begin
    tblAgent.First;
    while not tblAgent.eof do
    begin
      if tblAgent['Availability']=true then
      begin
        iagentid:=tblAgent['AgentID'];

      end;
      tblAgent.next;
    end;

    while not tblAgent.eof do
    begin
      if tblAgent['AgentID']=iagentid then
      begin
        tblAgent.edit;
        tblAgent['Availability']:=false;
      end;
      tblAgent.Next;
    end;

    tblCust.Insert;
    tblCust.Append;
    tblCust['Name']:=sName;
     tblCust['Surname']:=sSurname;
     tblCust['Email']:=sEmail;
      tblCust['Password']:=sPass;
      tblCust['AgentID']:=iagentid;
      tblCust.Post;
  end;
  if bValid=false then
  begin
    showmessage('Please ensure all your information meets the requirements');
  end
  else
  begin
    MessageDlg('Are you sure your information is correct?', mtWarning, [mbYes, mbNo, mbCancel], 0 );
    if MessageDlg('Are you sure your information is correct?', mtWarning, [mbYes, mbNo, mbCancel], 0)=mrYes then
    begin
    showmessage('You have successfully signed up!');
      tbsMenu.Show;
      tbsMenu.Enabled:=true;
    end;


  end;



end;

procedure TfrmLog.lblCustomerClick(Sender: TObject);
begin
tbsMenu.Hide;
tbsCustService.show;
end;

//end;
{i:=0;
showmessage('Please fill in missing info');
//frmBuy.show;
 housetype:=cmbHousetypes.Text;
 region:=cmbRegion.text;
 budget:=strtofloat(edtBudgt.text);
 custid:=edtHouseid.Text;
 with datamoduledata do
 begin
   tblSales.first;
   while not tblSales.eof do
   begin
     if (tblSales['PropertyType']=housetype) and (tblSales['PropertyTotal Cost']<=budget) then
     begin
      for i := 1 to 100 do
      begin
     arrPropNames[i]:=tblSales['PropertyType'];
     arrPropPrice[i]:=tblSales['PropertyTotal Cost'];
     arrPropAge[i]:=tblSales['PropertyAge'];

      end;

     end;
     tblSales.Next;

   end;



 end;
 redBuy.Lines.Add('Property Types'+#10+'Property Cost'+#10+'Property Region'+#10+'Property Age');
 for i  := 1 to 100 do
   begin
   redBuy.Lines.Add(arrPropNames[i]+#10+'R'+floattostr(arrPropPrice[i])+#10+'Region not done'+#10+inttostr(arrPropAge[i]));

   end;
end;  }

procedure TfrmLog.lblextClick(Sender: TObject);
begin
exit;
end;

procedure TfrmLog.lblMsgClickClick(Sender: TObject);
var
sCustID,sMessage:string;
tCust:textfile;
begin
sCustID:=edtIDservice.Text;
sMessage:=edtMessage.text;
if fileexists('C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Support.txt') then
 begin
   assignfile(tCust,'C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Support.txt');
  append(tCust);
   writeln(tCust,sCustID+'^'+sMessage);
   closefile(tCust);
 end;
 showmessage('Complaint successfully sent!');
 exit;
end;

procedure TfrmLog.lblNextLogClick(Sender: TObject);
var
sUser:string;
bTestU,bTestP:boolean;

begin
//with datamoduledata do
//tblCust.Active:=true;
//tbsBuy.enabled:=true;
 { sUser := edtUser.Text;
  sPasscode := edtPass.Text;

  if sUser = '' then
  begin
    ShowMessage('Please enter your username');
    Exit;
  end
  else if Length(sUser) < 5 then
  begin
    ShowMessage('Please ensure that you have a minimum of 5 characters in your username');
    Exit;
  end;

  if sPasscode = '' then
  begin
    ShowMessage('Please enter your passcode');
    Exit;
  end
  else if Length(sPasscode) < 8 then
  begin
    ShowMessage('Please ensure that you have a minimum of 8 characters in your passcode');
    Exit;
  end;

  // Assuming you have a TADOQuery component connected to your database
  with DataModuleData.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblCust');
    SQL.Add('WHERE (Name + Surname = :User) AND (Password = :Passcode)');
    Parameters.ParamByName('User').Value := sUser;
    Parameters.ParamByName('Passcode').Value := sPasscode;
    Open;

    if not Eof then
    begin
      bTestU := true;
      bTestP := true;
    end
    else
    begin
      bTestU := false;
      bTestP := false;
    end;
  end;

  if not bTestU then
    ShowMessage('Invalid Username');
  if not bTestP then
    ShowMessage('Invalid Passcode');

  if bTestU and bTestP then
  begin
    ShowMessage('Successfully Logged In!');
    tbsLogin.Hide;
    tbsLogin.Enabled := False;
    tbsMenu.Show;
    tbsMenu.Enabled := True;
    tbsBuy.Enabled := true;
  end;
  frmAdmin.show;
  frmBuy.Show;
  frmSell.Show;   }

  //real code
   bTestU := false;
  bTestP := false;
  sUser := edtUser.Text;
  sPasscode := edtPass.Text;

  if sUser = '' then
  begin
    ShowMessage('Please enter your username');
    Exit;
  end
  else if Length(sUser) < 5 then
  begin
    ShowMessage('Please ensure that you have a minimum of 5 characters in your username');
    Exit;
  end;

  if sPasscode = '' then
  begin
    ShowMessage('Please enter your passcode');
    Exit;
  end
  else if Length(sPasscode) < 8 then
  begin
    ShowMessage('Please ensure that you have a minimum of 8 characters in your passcode');
    Exit;
  end;


  with datamoduledata.tblCust do
  begin
    First;
    while not Eof do
    begin
      if (sUser = FieldByName('Name').AsString + FieldByName('Surname').AsString) and
         (sPasscode = FieldByName('Password').AsString) then
      begin
      sNameT:=fieldbyname('Name').asstring;
      sSurnameT:=fieldbyname('Surname').asstring;
      sIDt:=sUser;

        bTestU := true;
        bTestP := true;
        Break; // exits the loop once a match is found
      end;
      Next;
    end;
  end;

  if not bTestU then
  begin
    ShowMessage('Invalid Username');
    edtUser.Clear;
  end;
  if not bTestP then
  begin
    ShowMessage('Invalid Passcode');
    edtPass.Clear;
  end;

  if bTestU and bTestP then
  begin
    ShowMessage('Successfully Logged In!');
    tbsLogin.Hide;
    tbsLogin.Enabled := False;
    tbsMenu.Show;
    tbsMenu.Enabled := True;
    tbsBuy.Enabled:=true;

  end;
  //frmAdmin.show;
  //frmBuy.Show;
  //frmSell.Show;
end;



procedure TfrmLog.tbsSellEnter(Sender: TObject);
begin
cmbH.Text:='                  -Select-' ;
end;

//end;

end.
