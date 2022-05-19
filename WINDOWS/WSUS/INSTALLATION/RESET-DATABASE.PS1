Uninstall-WindowsFeature -Name UpdateServices,Windows-Internal-Database -Restart

# Post restart, delete EVERYTHING in the C:\Windows\WID\ (for Win 2012 r2) folder.

Install-WindowsFeature UpdateServices -Restart

#This only works on PowerShell 3 or higher.
