param (
    [Parameter(Mandatory=$true,Position=0)][string]$ProfileName = $(Read-Host -Prompt "Enter Profile Name")
)

$KBMGR_DEFAULT_CONF = "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
$PROFILE_LOCATION = "$PSScriptRoot\profiles"
$PROFILE_FILENAME = "$ProfileName.json"

# mkdir exists ok
New-Item -Path $PROFILE_LOCATION -ItemType "directory" -Force > $null

# backup
Copy-Item -Path $KBMGR_DEFAULT_CONF -Destination "$PROFILE_LOCATION\$PROFILE_FILENAME"
Write-Output "Saving config profile`nfrom:`t$KBMGR_DEFAULT_CONF`nto:`t$PROFILE_LOCATION\$PROFILE_FILENAME"
