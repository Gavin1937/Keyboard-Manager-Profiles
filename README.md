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


# Examples

```pwsh
# backup default profile (will use current current file in "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json" as default profile)
.\00.BackupDefault.ps1

# or, you can add a MAX_BACKUP_LENGTH (default 5) to limit how many backup files you want
.\00.BackupDefault.ps1 -MAX_BACKUP_LENGTH 10


# save current "default.json" file as a new profile
.\01.SaveCurrentProfile.ps1 MyProfile
# note that some string like "0" are reserved and cannot be a profile name


# change profiles using interactive cli
.\02.ChangeProfile.ps1

# or, change profiles by passing its name as parameter
.\02.ChangeProfile.ps1 MyProfile    # file name without extension in profiles/ folder
.\02.ChangeProfile.ps1 myProFILE    # case doesn't matter
.\02.ChangeProfile.ps1 default      # change to default profile
.\02.ChangeProfile.ps1 0            # 0 is also default profile
```
