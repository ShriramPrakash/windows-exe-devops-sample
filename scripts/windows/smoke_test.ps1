$logFile = "C:\ProgramData\MyAgent\myagent.log"
$versionFile = "C:\ProgramData\MyAgent\version.txt"

if (!(Test-Path $logFile)) {
    Write-Host "Smoke test failed: log file not found"
    exit 1
}

if (!(Test-Path $versionFile)) {
    Write-Host "Smoke test failed: version file not found"
    exit 1
}

Write-Host "Smoke test passed"
exit 0
