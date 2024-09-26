param (
    [Parameter(Mandatory=$false)][string]$profileName = ""
)

$KBMGR_DEFAULT_CONF = "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
$PROFILE_LOCATION = "$PSScriptRoot\profiles"

if ((Test-Path $PROFILE_LOCATION) -eq $false)
{
    Write-Output "No profile found, please SaveCurrentProfile first"
    exit 0
}


$profile_idx = -1
$profileName = $profileName.Trim().ToLower()
$profiles = (Get-ChildItem $PROFILE_LOCATION)

# parameter profile
if ($profileName.Length -gt 0)
{
    if ($profileName -eq "default" -or $profileName -eq "0")
    {
        $profile_idx = 0
    }
    else
    {
        for ($i=1; $i -le $profiles.Count; $i++)
        {
            $locProfilename = ($profiles[$i-1] | Select-Object BaseName).BaseName.ToLower()
            if ($locProfilename -eq $profileName)
            {
                $profile_idx = $i
                break
            }
        }
    }
}
# prompt for profile
else
{
    for ($i=1; $i -le $profiles.Count; $i++)
    {
        $locProfilename = ($profiles[$i-1] | Select-Object BaseName).BaseName
        Write-Output "$i) $locProfilename"
    }
    Write-Output "0) default profile"
    try
    {
        $profile_idx = [int]$(Read-Host -Prompt "Enter profile index")
    }
    catch
    {
        $profile_idx = -1
    }
}


# change profile
if ($profile_idx -eq 0)
{
    $selected_profile_basename = "default"
    .\RestoreDefault.ps1
}
elseif (1 -isnot [int] -or $profile_idx -lt 0 -or $profile_idx -gt $profiles.Count)
{
    Write-Error "Invalid profile input"
    exit -1
}
else
{
    $selected_profile = "$PROFILE_LOCATION\$($profiles[$profile_idx-1].Name)"
    $selected_profile_basename = "$(($profiles[$profile_idx-1] | Select-Object BaseName).BaseName)"
    .\InstallConfig.ps1 -Src $selected_profile -Dst $KBMGR_DEFAULT_CONF
}
Write-Output "Change profile to: $selected_profile_basename"


.\RestartKBMGR.ps1