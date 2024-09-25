# Keyboard Manager Profiles

A PowerShell cli creates a simple profile system for [PowerToys Keyboard Manager](https://learn.microsoft.com/en-us/windows/powertoys/keyboard-manager). So you can create profiles for different key mapping and manage them.

Inspired by [this issue](https://github.com/microsoft/PowerToys/issues/1881)


# Usage:

1. [Install latest PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/install)
2. Enable Keyboard Manager in PowerToys GUI
3. Run script `00.BackupDefault.ps1` to backup default key mapping profile
4. In PowerToys Keyboard Manager GUI, set your key mapping
5. Run script `01.SaveCurrentProfile.ps1` to save your key mapping as a profile
6. Close PowerToys GUI
7. Finally, you can select different profiles using script `02.ChangeProfile.ps1`

> [!NOTE]
> Don't open PowerToys GUI while changing profile, PowerToys will crash.
