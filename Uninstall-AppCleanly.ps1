<#
.SYNOPSIS
    Uninstalls an application and removes its leftover registry keys and folders.

.DESCRIPTION
    1. Finds the app in the Windows "Uninstall" registry keys by display name.
    2. Runs its uninstaller (quiet uninstall string if available).
    3. Optionally exports and removes leftover registry keys/folders you name.
    Registry keys are exported to .reg files first, so every deletion can be undone.
    Supports -WhatIf and -Confirm; run it with -WhatIf first.

.EXAMPLE
    .\Uninstall-AppCleanly.ps1 -Name "7-Zip" -WhatIf

.EXAMPLE
    .\Uninstall-AppCleanly.ps1 -Name "Notepad++" `
        -RegistryKeys "HKCU:\Software\Notepad++" `
        -Folders "$env:APPDATA\Notepad++"
#>
#Requires -Version 5.1
[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
param(
    [Parameter(Mandatory)][string]$Name,
    [string[]]$RegistryKeys = @(),
    [string[]]$Folders = @(),
    [string]$BackupDir = (Join-Path $env:USERPROFILE "AppCleanupBackup\$(Get-Date -Format 'yyyyMMdd-HHmmss')")
)

$ErrorActionPreference = 'Stop'

$uninstallRoots = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

$apps = Get-ItemProperty $uninstallRoots -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName -like "*$Name*" }

if (-not $apps) {
    Write-Warning "No installed application matching '$Name' was found."
} else {
    foreach ($app in $apps) {
        $cmd = if ($app.QuietUninstallString) { $app.QuietUninstallString } else { $app.UninstallString }
        if (-not $cmd) { Write-Warning "$($app.DisplayName): no uninstall command."; continue }
        if ($PSCmdlet.ShouldProcess($app.DisplayName, "Run uninstaller: $cmd")) {
            Write-Host "Uninstalling $($app.DisplayName)..."
            Start-Process -FilePath cmd.exe -ArgumentList '/c', $cmd -Wait
        }
    }
}

foreach ($key in $RegistryKeys) {
    if (-not (Test-Path -LiteralPath $key)) { Write-Verbose "Not found: $key"; continue }
    if ($PSCmdlet.ShouldProcess($key, 'Back up and remove registry key')) {
        New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        $nativePath = $key -replace '^HKCU:', 'HKCU' -replace '^HKLM:', 'HKLM'
        $file = Join-Path $BackupDir (($nativePath -replace '[\\/:*?"<>|]', '_') + '.reg')
        & reg.exe export $nativePath $file /y | Out-Null
        if ($LASTEXITCODE -ne 0) { throw "Backup of $key failed; not deleting." }
        Remove-Item -LiteralPath $key -Recurse -Force
        Write-Host "Removed $key (backup: $file)"
    }
}

foreach ($dir in $Folders) {
    if (-not (Test-Path -LiteralPath $dir)) { Write-Verbose "Not found: $dir"; continue }
    if ($PSCmdlet.ShouldProcess($dir, 'Remove folder')) {
        Remove-Item -LiteralPath $dir -Recurse -Force
        Write-Host "Removed $dir"
    }
}

if (Test-Path $BackupDir) { Write-Host "Registry backups saved in $BackupDir (double-click a .reg file to restore)." }
