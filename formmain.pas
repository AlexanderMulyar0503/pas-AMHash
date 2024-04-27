unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

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
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

end.

