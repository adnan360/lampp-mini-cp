unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls,
  //
  Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnStatus: TBitBtn;
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    Memo1: TMemo;
    procedure btnStartClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function getSudoGUI:String;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnStartClick(Sender: TObject);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);

  // we just run: 'kdesu /opt/lampp/lampp start';
  AProcess.Executable := getSudoGUI;
  AProcess.Parameters.Add('/opt/lampp/lampp');
  AProcess.Parameters.Add('start');

  AProcess.Execute;
  AProcess.Free;

  Sleep(6000);
  btnStatusClick(Sender);
end;

procedure TForm1.btnStatusClick(Sender: TObject);
var
  AProcess: TProcess;
  AStringList: TStringList;
begin
  AProcess := TProcess.Create(nil);

  //AProcess.Executable := getSudoGUI;
  //AProcess.Parameters.Add('/opt/lampp/lampp');
  //AProcess.Parameters.Add('status');
  AProcess.CommandLine:='/opt/lampp/lampp status';
  AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];

  AProcess.Execute;

  AStringList := TStringList.Create;
  AStringList.LoadFromStream(AProcess.Output);
  Memo1.Text:=AStringList.Text;

  AProcess.Free;
end;

procedure TForm1.btnStopClick(Sender: TObject);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);

  AProcess.Executable := getSudoGUI;
  AProcess.Parameters.Add('/opt/lampp/lampp');
  AProcess.Parameters.Add('stop');

  AProcess.Execute;
  AProcess.Free;

  Sleep(6000);
  btnStatusClick(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnStatusClick(Sender);
end;

function TForm1.getSudoGUI: String;
begin
  if ( FileExists('/usr/bin/pkexec') ) then
    Result := 'pkexec'
  else if ( FileExists('/usr/bin/kdesu') ) then
    Result := 'kdesu'
  else if ( FileExists('/usr/bin/gksu') ) then
    Result := 'gksu';
end;

end.

