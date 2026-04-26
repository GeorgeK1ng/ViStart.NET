; Inno Setup 5 script (XP-compatible installer)
#define MyAppName "ViStart .NET"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "Lee-Soft.com"
#define MyAppExeName "ViStart.exe"

[Setup]
AppId={{D3C18EE0-D3E3-40E5-A934-E4CBB4E0D7E5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\ViStart
DefaultGroupName=ViStart
OutputDir=..\artifacts\installer
OutputBaseFilename=ViStart-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=classic
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Main app payload (built output + local resources)
Source: "..\artifacts\dist\app\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion
; Legacy skins from original VB6 repository
Source: "..\artifacts\dist\Skins\*"; DestDir: "{userappdata}\Lee-Soft.com\ViStart\_skins"; Flags: recursesubdirs createallsubdirs ignoreversion
; Legacy language XML files
Source: "..\artifacts\dist\Languages\*"; DestDir: "{app}\Languages"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\ViStart"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\ViStart"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; GroupDescription: "Additional icons:"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch ViStart"; Flags: nowait postinstall skipifsilent
