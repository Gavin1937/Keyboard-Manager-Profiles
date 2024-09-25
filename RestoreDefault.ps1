$KBMGR_DEFAULT_CONF = "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
$BACKUP_LOCATION = "$PSScriptRoot\default_backup"

# restore lastest default config
$LASTEST_DEFAULT = (Get-ChildItem default_backup | Sort-Object CreationTime | Select-Object -Last 1).Name

.\InstallConfig.ps1 -Src "$BACKUP_LOCATION\$LASTEST_DEFAULT" -Dst "$KBMGR_DEFAULT_CONF"