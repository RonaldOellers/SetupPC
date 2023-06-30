you need to execute the following Powershell command as Administrator if you want to use a custom applist file. This sets the ExecutionPolicy to Unrestricted in Powershell for this session only.

NOTE: This might be no longer necessary since the ExecutionPolicy is set to Bypass if you use the command shown below under 2. or 3. . However, admin mode is still advisable.
```Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force```

# Running the PC Setup script
1. Start the Powershell in Admin Mode
2. Execute from Github (no download required)
```
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RonaldOellers/SetupPC/master/SetupPC.ps1'))"
```

somethis this is necessary:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RonaldOellers/SetupPC/master/SetupPC.ps1'))
```

or

3. Execute locally after download... example:
```
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "\\wsl$\Ubuntu-22.04\home\oellers\documents\WinGetFreshPC\SetupPC.ps1"
```


If you need an overview of winget packages search [here](https://winget.run/) (only shows winget source packages, not msstore)

It automatically agrees to all source/package agreements so you do not need to stay with the pc while its installing see winget flag: ```--accept-source-agreements```   ```--accept-package-agreements```

To show all available packages use: ```winget search -q `"`"```  and ```winget search -q `"`" | sort``` to sort them alphabetically. In case the list is too long, use the following command to redirect the output to a file ```winget search -q `"`" | sort | Out-File C:\Users\Ronald\Desktop\WingetPackages.txt```

To check what you have installed type: ```winget list```
