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
    GroupPosition: TGroupBox;
    GroupSize: TGroupBox;
    LabelExtMD5: TLabel;
    LabelPositionX: TLabel;
    LabelPositionY: TLabel;
    LabelSizeWidth: TLabel;
    LabelSizeHeight: TLabel;
    PositionX: TSpinEdit;
    PositionY: TSpinEdit;
    SizeWidth: TSpinEdit;
    SizeHeight: TSpinEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonDefaultClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private

  public

  end;

var
  SettingsForm: TSettingsForm;
  CancelPositionX, CancelPositionY: Integer;
  CancelSizeWidth, CancelSizeHeight: Integer;

implementation

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.ButtonDefaultClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteString('Exts', 'MD5', 'md5');
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 500);
  IniFile.WriteInteger('Size', 'Height', 310);
  IniFile.Free;
  SettingsForm.Close;
end;

procedure TSettingsForm.ButtonCancelClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteInteger('Position', 'X', CancelPositionX);
  IniFile.WriteInteger('Position', 'Y', CancelPositionY);
  IniFile.WriteInteger('Size', 'Width', CancelSizeWidth);
  IniFile.WriteInteger('Size', 'Height', CancelSizeHeight);
  IniFile.Free;
  SettingsForm.Close;
end;

procedure TSettingsForm.ButtonOKClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteString('Exts', 'MD5', ExtMD5.Text);
  IniFile.WriteInteger('Position', 'X', PositionX.Value);
  IniFile.WriteInteger('Position', 'Y', positiony.Value);
  IniFile.WriteInteger('Size', 'Width', SizeWidth.Value);
  IniFile.WriteInteger('Size', 'Height', SizeHeight.Value);
  IniFile.Free;
  SettingsForm.Close;
end;

end.

