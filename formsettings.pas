unit FormSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, IniFiles;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    ButtonDefault: TButton;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ExtMD5: TEdit;
    GroupExts: TGroupBox;
    LabelExtMD5: TLabel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonDefaultClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private

  public

  end;

var
  SettingsForm: TSettingsForm;


implementation

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.ButtonDefaultClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.amhash.ini');
  IniFile.WriteString('Exts', 'MD5', 'md5');
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 500);
  IniFile.WriteInteger('Size', 'Height', 310);
  IniFile.Free;
  SettingsForm.Close;
end;

procedure TSettingsForm.ButtonCancelClick(Sender: TObject);
begin
  SettingsForm.Close;
end;

procedure TSettingsForm.ButtonOKClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.amhash.ini');
  IniFile.WriteString('Exts', 'MD5', ExtMD5.Text);
  IniFile.Free;
  SettingsForm.Close;
end;

end.

