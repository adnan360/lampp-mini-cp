unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  //
  Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnStart: TBitBtn;
    btnStop: TBitBtn;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
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

