$installDir = "C:\Axway-7.7.0"
$installer = "$dir\APIGateway_7.7.20240830_Client-Tools-Install_win-x86-32_BN04.exe"
Start-Process $installer -ArgumentList "--mode unattended --unattendedmodeui none --enable-components policystudio,configurationstudio" -Wait
if (Test-Path "$installDir\policystudio\policystudio.exe") {
    $exePath = "$installDir\policystudio\policystudio.exe"
    $scoopAppsFolder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Scoop Apps"
    $shortcutPath = "$scoopAppsFolder\PolicyStudio.lnk"
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($shortcutPath)
    $Shortcut.TargetPath = $exePath
    $Shortcut.Save()
} else {
    Write-Host "Błąd: Plik PolicyStudio.exe nie został znaleziony."
}
