unit OpenTools.LocalMenus;

interface

uses
  ToolsAPI, System.Classes;

type
  TLocalMenuBase = class(TNotifierObject, IOTALocalMenu)
  private
    FCaption: string;
    FChecked: Boolean;
    FEnabled: Boolean;
    FHelpContext: Integer;
    FName: string;
    FParent: string;
    FPosition: Integer;
    FVerb: string;
    FOnExecute: TNotifyEvent;
  public
    // IOTALocalMenu
    function GetCaption: string;
    function GetChecked: Boolean;
    function GetEnabled: Boolean;
    function GetHelpContext: Integer;
    function GetName: string;
    function GetParent: string;
    function GetPosition: Integer;
    function GetVerb: string;
    procedure SetCaption(const Value: string);
    procedure SetChecked(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetHelpContext(Value: Integer);
    procedure SetName(const Value: string);
    procedure SetParent(const Value: string);
    procedure SetPosition(Value: Integer);
    procedure SetVerb(const Value: string);

    property Caption: string read GetCaption write SetCaption;
    property Checked: Boolean read GetChecked write SetChecked;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property HelpContext: Integer read GetHelpContext write SetHelpContext;
    property Name: string read GetName write SetName;
    property Parent: string read GetParent write SetParent;
    property Position: Integer read GetPosition write SetPosition;
    property Verb: string read GetVerb write SetVerb;
    property OnExute: TNotifyEvent read FOnExecute write FOnExecute;
  end;

implementation

function TLocalMenuBase.GetCaption: string;
begin
  Result := FCaption;
end;

function TLocalMenuBase.GetChecked: Boolean;
begin
  Result := FChecked;
end;

function TLocalMenuBase.GetEnabled: Boolean;
begin
  Result := FEnabled;
end;

function TLocalMenuBase.GetHelpContext: Integer;
begin
  Result := FHelpContext;
end;

function TLocalMenuBase.GetName: string;
begin
  Result := FName;
end;

function TLocalMenuBase.GetParent: string;
begin
  Result := FParent;
end;

function TLocalMenuBase.GetPosition: Integer;
begin
  Result := FPosition;
end;

function TLocalMenuBase.GetVerb: string;
begin
  Result := FVerb;
end;

procedure TLocalMenuBase.SetCaption(const Value: string);
begin
  FCaption := Value;
end;

procedure TLocalMenuBase.SetChecked(Value: Boolean);
begin
  FChecked := Value;
end;

procedure TLocalMenuBase.SetEnabled(Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TLocalMenuBase.SetHelpContext(Value: Integer);
begin
  FHelpContext := Value;
end;

procedure TLocalMenuBase.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TLocalMenuBase.SetParent(const Value: string);
begin
  FParent := Value;
end;

procedure TLocalMenuBase.SetPosition(Value: Integer);
begin
  FPosition := Value;
end;

procedure TLocalMenuBase.SetVerb(const Value: string);
begin
  FVerb := Value;
end;

end.
