$sourceFile = "app/windows-agent/src/MyAgent.ps1"
$versionFile = "app/windows-agent/packaging/version.txt"
$installerFile = "app/windows-agent/packaging/installer.iss"

if (!(Test-Path $sourceFile)) {
    Write-Host "Source file missing"
    exit 1
}

if (!(Test-Path $versionFile)) {
    Write-Host "Version file missing"
    exit 1
}

if (!(Test-Path $installerFile)) {
    Write-Host "Installer definition missing"
    exit 1
}

Write-Host "Validation passed"
exit 0
