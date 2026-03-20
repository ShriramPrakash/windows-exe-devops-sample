param(
    [string]$InstallerPath
)

if (!(Test-Path $InstallerPath)) {
    Write-Host "Installer not found: $InstallerPath"
    exit 1
}

Write-Host "Installing from $InstallerPath"
Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT" -Wait
Write-Host "Installation completed"
