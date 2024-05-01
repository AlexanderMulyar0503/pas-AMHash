unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, md5, FormSettings, FormAbout, IniFiles;

type

  { TMainForm }

  TMainForm = class(TForm)
    ButtonSaveInFile: TButton;
    ButtonHashCalc: TButton;
    ButtonOpenFile: TButton;
    CalcAlgorithm: TComboBox;
    HashExpectation: TEdit;
    HashResult: TEdit;
    FilePath: TEdit;
    LabelExpectation: TLabel;
    LabelResult: TLabel;
    LabelCalcAlgorithm: TLabel;
    LabelFilePath: TLabel;
    MainFormMenu: TMainMenu;
    MainFormMenuFile: TMenuItem;
    MainFormMenuSettings: TMenuItem;
    MainFormMenuSeparator1: TMenuItem;
    MainFormMenuExit: TMenuItem;
    MainFormMenuHelp: TMenuItem;
    MainFormMenuAbout: TMenuItem;
    OpenFileDialog: TOpenDialog;
    procedure ButtonHashCalcClick(Sender: TObject);
    procedure ButtonOpenFileClick(Sender: TObject);
    procedure ButtonSaveInFileClick(Sender: TObject);
    procedure CheckHash();
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MainFormMenuAboutClick(Sender: TObject);
    procedure MainFormMenuExitClick(Sender: TObject);
    procedure MainFormMenuSettingsClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ButtonOpenFileClick(Sender: TObject);
begin
  if OpenFileDialog.Execute then FilePath.Text:= OpenFileDialog.FileName;
end;

procedure TMainForm.ButtonSaveInFileClick(Sender: TObject);
var
  IniFile: TIniFile;
  HashFile: TextFile;
begin
  if (FileExists(FilePath.Text)) and (Length(HashResult.Text) > 0) then
  begin
    IniFile:= TIniFile.Create('app.ini');
    AssignFile(HashFile, FilePath.Text + '.' + IniFile.ReadString('Exts', 'MD5', 'md5'));
    Rewrite(HashFile);

    Write(HashFile, HashResult.Text + ' ' + ExtractFileName(FilePath.Text));
    ShowMessage('Сохранено в ' + FilePath.Text + '.' + IniFile.ReadString('Exts', 'MD5', 'md5'));

    CloseFile(HashFile);
    IniFile.Free;
  end;
end;

procedure TMainForm.ButtonHashCalcClick(Sender: TObject);
begin
  if FileExists(FilePath.Text) then
  begin
    if CalcAlgorithm.ItemIndex = 0 then
    begin
      HashResult.Text:= MD5Print(MD5File(FilePath.Text));
    end;

    CheckHash();
  end
  else ShowMessage('Файл не существует!');
end;

procedure TMainForm.CheckHash();
begin
  HashResult.Color:= clDefault;

  if Length(HashExpectation.Text) > 0 then
  begin
    if HashExpectation.Text = HashResult.Text then HashResult.Color:= clGreen
    else HashResult.Color:= clRed;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteInteger('Position', 'X', MainForm.Left);
  IniFile.WriteInteger('Position', 'Y', MainForm.Top);
  IniFile.WriteInteger('Size', 'Width', MainForm.Width);
  IniFile.WriteInteger('Size', 'Height', MainForm.Height);
  IniFile.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  if FileExists('app.ini') = False then
    begin
      IniFile:= TIniFile.Create('app.ini');
      IniFile.WriteString('Exts', 'MD5', 'md5');
      IniFile.WriteInteger('Position', 'X', 25);
      IniFile.WriteInteger('Position', 'Y', 25);
      IniFile.WriteInteger('Size', 'Width', 500);
      IniFile.WriteInteger('Size', 'Height', 310);
      IniFile.Free;
    end;

    IniFile:= TIniFile.Create('app.ini');
    MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
    MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
    MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 500);
    MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 310);
    IniFile.Free;
end;

procedure TMainForm.MainFormMenuAboutClick(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.MainFormMenuExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.MainFormMenuSettingsClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  SettingsForm.PositionX.Value:= MainForm.Left;
  SettingsForm.PositionY.Value:= MainForm.Top;
  SettingsForm.SizeWidth.Value:= MainForm.Width;
  SettingsForm.SizeHeight.Value:= MainForm.Height;
  CancelPositionX:= MainForm.Left;
  CancelPositionY:= MainForm.Top;
  CancelSizeWidth:= MainForm.Width;
  CancelSizeHeight:= MainForm.Height;

  SettingsForm.ShowModal;

  IniFile:= TIniFile.Create('app.ini');
  MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
  MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
  MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 500);
  MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 310);
  IniFile.Free;
end;

end.

