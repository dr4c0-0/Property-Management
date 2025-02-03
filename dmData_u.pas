unit dmData_u;

interface

uses
  System.SysUtils, System.Classes,DB, ADODB;

type
  TdatamoduleData = class(TDataModule)

    procedure DataModuleSetup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //declare objects
    conData:TADOConnection;
    tblCust:TADOTable;
    dscCust:TDataSource;
    tblAgent:TADOTable;
    dscAgent:TDataSource;
    tblRegion:TADOTable;
    dscRegion:TDataSource;
    tblSales:TADOTable;
    dscSales:TDataSource;
   qryAdmin:TADOQuery;
   dscQry:TDatasource


  end;

var
  datamoduleData: TdatamoduleData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdatamoduleData.DataModuleSetup(Sender: TObject);
begin
conData:=TADOConnection.create(datamoduleData);
tblAgent:=TADOTable.Create(datamoduleData);
tblCust:=TADOTable.Create(datamoduledata);
tblRegion:=TADOTable.Create(datamoduleData);
tblSales:=TADOTable.Create(datamoduleData);
dscCust:=TDataSource.Create(datamoduledata);
dscAgent:=TDataSource.Create(datamoduleData);
dscRegion:=TDataSource.Create(datamoduleData);
dscSales:=TDataSource.Create(datamoduleData);

qryAdmin:=TADOQuery.Create(datamoduleData);
dscqry:=TDataSource.Create(datamoduledata);


conData.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\info.mdb;Mode=ReadWrite;Persist Security Info=False';

conData.loginprompt:=false;
conData.Open;

 qryAdmin.Connection:=conData;
 qryAdmin.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Administrator\Desktop\IT PAT backup 24 may\Masengana Jonathan PAT\Phase 1\info.mdb;Mode=ReadWrite;Persist Security Info=False';
 //qryAdmin.Active:=true;
tblCust.Connection:=conData;
tblCust.TableName:='CustomerDeets';
tblCust.Active:=true ;

tblAgent.Connection:=conData;
tblAgent.TableName:='AgentDeets';
//tblAgent.Active:=true;

tblRegion.Connection:=conData;
tblRegion.Tablename:='RegionInfo';
 //tblRegion.Active:=true;

 tblSales.Connection:=conData;
 tblSales.tablename:='PropertyDeets';
 //tblSales.Active:=true;

 dscSales.DataSet:=tblSales;
 dscRegion.DataSet:=tblRegion;
 dscAgent.DataSet:=tblAgent;
 dscCust.DataSet:=tblCust;

 dscqry.dataset:=qryAdmin;

 tblSales.Open;
 tblAgent.Open;
 tblCust.Open;
 tblRegion.open;

end;

end.
