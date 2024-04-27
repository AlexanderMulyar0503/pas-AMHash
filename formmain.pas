unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, md5;

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
    procedure CheckHash();
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

end.

