unit admin_u;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,dmData_u;

type
  TfrmAdmin = class(TForm)
    pgAdmin: TPageControl;
    tbsMainadmin: TTabSheet;
    tbsManageadmin: TTabSheet;
    lblWelcadmin: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblRevie: TLabel;
    imgManage: TImage;
    imgView: TImage;
    imgServe: TImage;
    Label1: TLabel;
    dbgProp: TDBGrid;
    memOut: TMemo;
    btnRemove: TButton;
    btnDate: TButton;
    btnViewHouse: TButton;
    lblHome1: TLabel;
    tbsReviews: TTabSheet;
    lblV: TLabel;
    memRev: TMemo;
    btnDis: TButton;
    Label4: TLabel;
    tbsCustomerServ: TTabSheet;
    lblCust: TLabel;
    memService: TMemo;
    btnDisplay: TButton;
    Image5: TImage;
    Label5: TLabel;
    lblExit: TLabel;
    btnSum: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure lblRevieClick(Sender: TObject);
    procedure lblExitClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure btnViewHouseClick(Sender: TObject);
    procedure btnDisClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure btnSumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

{$R *.dfm}

procedure TfrmAdmin.btnDateClick(Sender: TObject);
var
date,propp:string;
bdate:boolean;
begin
with datamoduledata do
begin
bdate:=false;
propp:=inputbox('Please enter Property ID:','','');
date:=inputbox('Please enter date in this format:','YYYY/MM/DD','');
qryadmin.SQL.clear;
qryAdmin.SQL.Text := 'UPDATE tblSales SET ViewDate = #' + date + '# WHERE PropertyID = ''' + propp + '''';
qryadmin.ExecSQL;
showmessage('Date successfully inputted');
qryadmin.Close;
 {with datamoduledata do
 begin
   tblSales.First;
   while not tblSales.eof do
   begin
     if tblSales['PropertyID']=propp then
     begin
     tblSales.Insert;
     tblSales.Edit;
       tblSales['ViewDate']:=date;
       bdate:=true;
     end;
     tblSales.Next;
   end;          }
   //tblSales.Close;

 end;
end;

procedure TfrmAdmin.btnDisClick(Sender: TObject);
var
treview:textfile;
sLine,sID:string;
iIndex:integer;
begin
memRev.Lines.Add('Customer ID'+#10+'Review:');
if fileexists('C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Reviews.txt') then
begin

assignfile(treview,'C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Reviews.txt');
 reset(treview);
 while not eof(treview) do
 begin
   readln(treview,sLine);
   iIndex:=pos('*',sLine);
   sID:=copy(sLine,1,iIndex-1);
   delete(sLine,1,iIndex);
   sLine:=sLine;
   memRev.Lines.Add(sID+#10+sLine);
 end;
 closefile(treview);
end;
memRev.Clear;
end;

procedure TfrmAdmin.btnDisplayClick(Sender: TObject);
var
tsupport:textfile;
sLine,sIDs:string;
iIndex1:integer;
begin
memService.Lines.Add('Customer ID'+#10+'Issue:');
if fileexists('C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Support.txt') then
begin
assignfile(tsupport,'C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\GUI\Support.txt');
 reset(tsupport);
 while not eof(tsupport) do
 begin
   readln(tsupport,sLine);
   iIndex1:=pos('^',sLine);
   sIDs:=copy(sLine,1,iIndex1-1);
   delete(sLine,1,iIndex1);
   sLine:=sLine;
   memService.Lines.Add(sIDs+#10+sLine);
 end;
 closefile(tsupport);
end;
memService.Clear;
end;

procedure TfrmAdmin.btnRemoveClick(Sender: TObject);
var
propid:string;
begin
with datamoduledata do
begin
propid:=inputbox('Please enter the property id:','','');
qryadmin.SQL.Clear;
  qryAdmin.SQL.Text := 'DELETE FROM tblSales WHERE PropertyID = ''' + propid + '''';
  qryAdmin.ExecSQL;
  showmessage('Record deleted successfully');
  qryadmin.Close;
end;
end;

procedure TfrmAdmin.btnSumClick(Sender: TObject);
var
rTotal:real;
begin
 with datamoduledata do
 begin
  qryadmin.SQL.Clear;
    qryadmin.SQL.Text := 'SELECT SUM(TotalCost) AS TotalCost FROM tblSales';
    qryadmin.Open;

    if not qryadmin.IsEmpty then
    begin
      rTotal := qryAdmin.Fields[0].AsFloat;
      memOut.Lines.Add('Total Cost of all Properties is: R' + FloatToStr(rTotal));
    end
    else
    begin
      memOut.Lines.Add('No Total Cost available.');
    end;

    qryadmin.Close;
 end;
end;

procedure TfrmAdmin.btnViewHouseClick(Sender: TObject);
begin
with datamoduledata do
begin
 {memOut.Lines.Add('Property ID'+#10+'Property Type'+#10+'Property Cost');
   with datamoduledata do
   begin
     tblSales.First;
     while not tblSales.eof do
     begin
       if tblSales['Availability']=true then
       begin
       memOut.Lines.Add(tblSales['PropertyID']+#10+tblSales['PropertyType']);
       end;
       tblSales.next;

     end;

   end;
   qryadmin.SQL.Clear;
   qryadmin.SQL.Text:='SELECT PropertyID,PropertyType,TotalCost FROM tblSales WHERE Availability=True ';
   qryadmin.ExecSQL;
   memOut.Lines.Add(qryAdmin.sql.text);}
  memOut.Lines.Clear;

  memOut.Lines.Add('Property ID' + #10 + 'Property Type' + #10 + 'Property Cost');

  qryadmin.SQL.Clear;
  qryadmin.SQL.Text := 'SELECT PropertyID, PropertyType, TotalCost FROM tblSales WHERE Availability = True ORDER BY PropertyID'; // Add ORDER BY clause if needed
  qryadmin.Open;
  if qryadmin.IsEmpty then
  begin
    ShowMessage('No properties are available');
    Exit; // Exit the procedure if no records are found
  end;
  qryadmin.First;
  while not qryadmin.Eof do
  begin
    memOut.Lines.Add(
      qryadmin.FieldByName('PropertyID').AsString + #10 +
      qryadmin.FieldByName('PropertyType').AsString + #10 +
      qryadmin.FieldByName('TotalCost').AsString
    );
    qryadmin.Next;
  end;

  qryadmin.Close;

end;
end;

procedure TfrmAdmin.FormActivate(Sender: TObject);
begin

dbgProp.DataSource:=datamoduledata.dscqry;
datamoduledata.qryAdmin.Open;
datamoduledata.qryAdmin.Active:=true;
end;

procedure TfrmAdmin.Label3Click(Sender: TObject);
begin
tbsManageAdmin.Show;
end;

procedure TfrmAdmin.lblExitClick(Sender: TObject);
begin
exit;
end;

procedure TfrmAdmin.lblRevieClick(Sender: TObject);
begin
tbsReviews.Show;
end;

end.
