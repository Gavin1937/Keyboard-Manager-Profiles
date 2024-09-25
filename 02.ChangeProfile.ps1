$KBMGR_DEFAULT_CONF = "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
$PROFILE_LOCATION = "$PSScriptRoot\profiles"

if ((Test-Path $PROFILE_LOCATION) -eq $false)
{
    Write-Output "No profile found, please SaveCurrentProfile first"
    exit 0
}


# prompt for profile
$default_profile = (Get-ChildItem default_backup | Sort-Object CreationTime | Select-Object -Last 1)
$profiles = (Get-ChildItem $PROFILE_LOCATION)
For ($i=1; $i -le $profiles.Count; $i++)
{
    $profilename = ($profiles[$i-1] | Select-Object BaseName).BaseName
    Write-Output "$i) $profilename"
}
Write-Output "0) default profile"
$profile_idx = $(Read-Host -Prompt "Enter profile index")


# change profile
if ($profile_idx -eq 0)
{
    $selected_profile_basename = "default"
    .\RestoreDefault.ps1
}
else
{
    $selected_profile = "$PROFILE_LOCATION\$($profiles[$profile_idx-1].Name)"
    $selected_profile_basename = "$(($profiles[$profile_idx-1] | Select-Object BaseName).BaseName)"
    .\InstallConfig.ps1 -Src $selected_profile -Dst $KBMGR_DEFAULT_CONF
}
Write-Output "Change profile to: $selected_profile_basename"


.\RestartKBMGR.ps1