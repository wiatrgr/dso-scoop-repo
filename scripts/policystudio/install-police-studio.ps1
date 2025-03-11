# Ścieżka do katalogu instalacyjnego
$installDir = "C:\Axway-7.7.0"
$installer = "$dir\APIGateway_7.7.20240830_Client-Tools-Install_win-x86-32_BN04.exe"

# Uruchomienie instalacji
Start-Process $installer -ArgumentList "--mode unattended --unattendedmodeui none --enable-components policystudio,configurationstudio" -Wait

# Sprawdzenie, czy instalacja się powiodła
if (Test-Path "$installDir\policystudio\policystudio.exe") {
    # Ścieżka do pliku wykonywalnego
    $exePath = "$installDir\policystudio\policystudio.exe"
    
    # Ścieżka do folderu Scoop Apps
    $scoopAppsFolder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Scoop Apps"
    
    # Ścieżka do skrótu
    $shortcutPath = "$scoopAppsFolder\PolicyStudio.lnk"
    
    # Tworzenie skrótu
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($shortcutPath)
    $Shortcut.TargetPath = $exePath
    $Shortcut.Save()
} else {
    Write-Host "Błąd: Plik PolicyStudio.exe nie został znaleziony."
}
