param (
    [Parameter(Mandatory=$true,Position=0)][string]$Src = $(Read-Host -Prompt "Enter Source Config Location"),
    [Parameter(Mandatory=$true,Position=1)][string]$Dst = $(Read-Host -Prompt "Enter Destination Config Location")
)

if ((Test-Path $Src) -eq $false)
{
    Write-Output "Input Source location does not exists"
    exit -1
}

Copy-Item -Path $Src -Destination $Dst
