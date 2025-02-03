program Main_p;

uses
  Vcl.Forms,
  main_u in 'main_u.pas' {frmMain},
  login_u in 'login_u.pas' {frmLog},
  admin_u in 'admin_u.pas' {frmAdmin},
  buying_u in 'buying_u.pas' {frmBuy},
  dmData_u in 'dmData_u.pas' {datamoduleData: TDataModule},
  sell_u in 'sell_u.pas' {frmSell},
  property_u in 'property_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLog, frmLog);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmBuy, frmBuy);
  Application.CreateForm(TdatamoduleData, datamoduleData);
  Application.CreateForm(TfrmSell, frmSell);
  Application.Run;
end.
