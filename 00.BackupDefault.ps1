param (
    [Parameter(Mandatory=$false)][int]$MAX_BACKUP_LENGTH = 5
)

$KBMGR_DEFAULT_CONF = "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
$BACKUP_LOCATION = "$PSScriptRoot\default_backup"

# mkdir exists ok
New-Item -Path $BACKUP_LOCATION -ItemType "directory" -Force > $null

# backup
$BACKUP_NAME = "default.json.backup-$(Get-Date -UFormat "%Y%m%d-%H%M%S")"
Copy-Item -Path $KBMGR_DEFAULT_CONF -Destination "$BACKUP_LOCATION\$BACKUP_NAME"
Write-Output "Backing up config file`nfrom:`t$KBMGR_DEFAULT_CONF`nto:`t$BACKUP_LOCATION\$BACKUP_NAME"

# keeping last $MAX_BACKUP_LENGTH files in backup folder
$backup_dir_items = (Get-ChildItem default_backup | Sort-Object CreationTime)
if ($backup_dir_items.Count -gt $MAX_BACKUP_LENGTH)
{
    echo "Keeping Last $MAX_BACKUP_LENGTH backups"
    foreach ($name in ($backup_dir_items | Select-Object -First ($backup_dir_items.Count - $MAX_BACKUP_LENGTH)).Name)
    {
        rm "$BACKUP_LOCATION\$name"
    }
}
