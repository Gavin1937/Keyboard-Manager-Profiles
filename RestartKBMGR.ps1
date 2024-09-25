$PROCESS_BASENAME = "C:\Program Files\PowerToys\KeyboardManagerEngine\"
$PROCESS_NAME = "PowerToys.KeyboardManagerEngine"

$processes = (Get-Process $PROCESS_NAME 2> $null)
if ($processes.Count -ge 1)
{
    foreach ($process in $processes)
    {
        $process.Kill()
        $process.WaitForExit()
    }
}

Start-Process -FilePath "$PROCESS_BASENAME/$PROCESS_NAME.exe" -WorkingDirectory $PROCESS_BASENAME
