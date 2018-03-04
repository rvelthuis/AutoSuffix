unit AddAutoSuffixProjectMenu;

interface

procedure Register;

implementation

uses
  ToolsAPI, System.SysUtils, System.Classes, Vcl.Dialogs, OpenTools.LocalMenus;

const
  CInvalidNotifier = -1;

type
  TAutoSuffixContextMenu = class(TNotifierObject, IOTANotifier, IOTAProjectMenuItemCreatorNotifier)
    procedure AddMenu(const Project: IOTAProject; const IdentList: TStrings;
      const ProjectManagerMenuList: IInterfaceList; IsMultiSelect: Boolean);
  end;

  TAutoSuffixLocalMenu = class(TLocalMenuBase, IOTAProjectManagerMenu)
    // IOTAProjectManagerMenu
    function GetIsMultiSelectable: Boolean;
    procedure SetIsMultiSelectable(Value: Boolean);
    procedure Execute(const MenuContextList: IInterfaceList); overload;
    function PreExecute(const MenuContextList: IInterfaceList): Boolean;
    function PostExecute(const MenuContextList: IInterfaceList): Boolean;
    property IsMultiSelectable: Boolean read GetIsMultiSelectable write SetIsMultiSelectable;
  end;

var
  FNotifierIndex: Integer;

{ TAutoSuffixContextMenu }

procedure TAutoSuffixContextMenu.AddMenu(const Project: IOTAProject; const IdentList: TStrings;
  const ProjectManagerMenuList: IInterfaceList; IsMultiSelect: Boolean);
var
  LMenu: TAutoSuffixLocalMenu;
begin
  if (Project.ApplicationType = sPackage) and (not IsMultiSelect) and Assigned(Project) and (IdentList.IndexOf(sProjectContainer) <> -1) and
    Assigned(ProjectManagerMenuList) then
  begin
    LMenu := TAutoSuffixLocalMenu.Create;
    LMenu.Caption := 'Add Version Suffix';
    LMenu.Enabled := True;
    LMenu.Position := pmmpUserRename;
    ProjectManagerMenuList.Add(LMenu)
  end;
end;

{ TAutoSuffixContextMenuLocal }

procedure TAutoSuffixLocalMenu.Execute(const MenuContextList: IInterfaceList);
var
  LMenuContext: IOTAProjectMenuContext;
  LProject: IOTAProject;
  LProjectOptions: IOTAProjectOptions;
  LAutoSuffix: string;
  LOffset: Integer;
begin
  if RTLVersion <= 20.0 then
    LOffset := 8
  else
    LOffset := 7;
  LAutoSuffix := IntToStr(10 * (Trunc(RTLVersion) - LOffset)); // Should work for most versions.
  LMenuContext := MenuContextList.Items[0] as IOTAProjectMenuContext;
  LProject := LMenuContext.Project;
  if LProject.ApplicationType <> sPackage then
    Exit;


  LProjectOptions := LProject.GetProjectOptions;
  LProjectOptions.SetOptionValue('SOSuffix', LAutoSuffix);
  ShowMessageFmt('Suffix set to ''%s''', [LAutoSuffix]);
end;

function TAutoSuffixLocalMenu.GetIsMultiSelectable: Boolean;
begin
  Result := False;
end;

function TAutoSuffixLocalMenu.PostExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result := True;
end;

function TAutoSuffixLocalMenu.PreExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result := True;
end;

procedure TAutoSuffixLocalMenu.SetIsMultiSelectable(Value: Boolean);
begin
  // stub implementation.
end;

procedure Register;
begin
  FNotifierIndex := (BorlandIDEServices as IOTAProjectManager).AddMenuItemCreatorNotifier
    (TAutoSuffixContextMenu.Create);
end;

initialization

  FNotifierIndex := CInvalidNotifier;

finalization

  if FNotifierIndex > CInvalidNotifier then
  begin
    (BorlandIDEServices as IOTAProjectManager).RemoveMenuItemCreatorNotifier(FNotifierIndex);
    FNotifierIndex := CInvalidNotifier;
  end;

end.
