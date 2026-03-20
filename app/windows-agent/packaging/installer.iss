#define MyAppVersion "1.0.0"

[Setup]
AppName=MyAgent
AppVersion={#MyAppVersion}
DefaultDirName={pf}\MyAgent
DefaultGroupName=MyAgent
OutputDir=output
OutputBaseFilename=MyAgentSetup-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\MyAgent.ps1

[Files]
Source: "..\src\MyAgent.ps1"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "powershell.exe"; Parameters: "-ExecutionPolicy Bypass -File ""{app}\MyAgent.ps1"""; Flags: runhidden
