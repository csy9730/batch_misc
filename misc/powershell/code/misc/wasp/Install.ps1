if($PSVersionTable) {
   Write-Host "You're running PowerShell $($PSVersionTable.PSVersion), so you don't need to Install this as a PSSnapin, you can use Import-Module (or Add-Module in CTP2) to load it.  If you still want to install it as a PSSnapin, re-run this script with -Force"
   if($args -notcontains "-Force") {
      return
   }
}

$rtd = [System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
set-alias installutil (resolve-path (join-path $rtd installutil.exe))

# cd C:\Users\Joel\Projects\PowerShell\Win32Window\bin\Release
installutil (Join-Path (Split-Path $MyInvocation.MyCommand.Path) WASP.dll)

if($?) {
# Get-PSSnapin -registered
Add-PSSnapin WASP

# get-help *-Window
Get-Command -PSSnapin WASP

Write-Host "To load the Windows Automation Snapin in the future, you need to run:"
Write-Host "Add-PSSnapin WASP" -fore Red
Write-Host 
Write-Host "You can also add that line to your Profile script to load it automatically."
} else {

Write-Warning @"
`nInstallation Failed. You're probably just not running as administrator.

If you see a System.UnauthorizedAccessException in the log output above, with an HKEY_LOCAL_MACHINE path, that's deffinitely what happened, just start an administrative console and try again.
"@
}