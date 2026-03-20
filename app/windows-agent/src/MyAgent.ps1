$installDir = "C:\ProgramData\MyAgent"
$logFile = "$installDir\myagent.log"
$versionFile = "$installDir\version.txt"

if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"Heartbeat from MyAgent at $timestamp" | Out-File -FilePath $logFile -Append

"1.0.0" | Out-File -FilePath $versionFile -Force
