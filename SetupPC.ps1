#Global Variables
$standartInstall = "C:\Programme\"

#Input promt
$CustomApps = Read-Host "If you have a custom app list, please enter the file location: "

Write-Output "Default Install location: $standartInstall"
$standartInstall = Read-Host "Please enter your standart installation Directory: "

# if ("" -eq $standartInstall){
#     $standartInstall = "C:\Programme\"
# }


#Install WinGet
#Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'
if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]"1.10.0.0") {
    "Installing winget Dependencies"
    Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

    $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $releases = Invoke-RestMethod -uri $releases_url
    $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

    "Installing winget from $($latestRelease.browser_download_url)"
    Add-AppxPackage -Path $latestRelease.browser_download_url
}
else {
    "winget already installed"
}


#App List
if ("" -eq $CustomApps){
    $apps = @(
    #Communication
    @{name = "WhatsApp.WhatsApp" },
    @{name = "Zoom.Zoom" },
    #Coding  
    @{name = "Microsoft.VisualStudioCode" }, 
    @{name = "Microsoft.WindowsTerminal"; source = "msstore" },  
    @{name = "Microsoft.PowerToys" },
    @{name = "Notepad++.Notepad++" },
    @{name = "EclipseAdoptium.Temurin.19.JDK" },#Java especialy for Minecraft
    #Cloud Services 
    @{name = "Seafile.Seafile" },
    #Browser
    @{name = "Mozilla.Firefox" },
    @{name = "Opera.OperaGX" },
    @{name = "Google.Chrome" },
    #Writing and Office
    # @{name = "TheDocumentFoundation.LibreOffice" },#Open Office
    #Game Clients
    @{name = "Valve.Steam"; location = "C:\Programme\Games\" },#Steam
    @{name = "Battle.net" },#Battlenet
    @{name = "GOG.Galaxy" },#GOG Galaxy
    @{name = "Ubisoft.Connect" },#Uplay
    @{name = "ElectronicArts.EADesktop" },#Origin
    @{name = "Peppy.Osu!" },#Osu
    #Game Utility
    @{name = "Discord.Discord" },
    @{name = "TeamSpeakSystems.TeamSpeakClient" },
    @{name = "Mumble.Mumble.Client" },
    #Monitoring
    @{name = "CPUID.HWMonitor" },#HW Monitor
    @{name = "FinalWire.AIDA64.Extreme" },#Aida64
    #Utility Software
    @{name = "DebaucheeOpenSourceGroup.Barrier" },#KVM software
    @{name = "Obsidian.Obsidian" },#Obsidian
    @{name = "RARLab.WinRAR" },#Winrar
    @{name = "VideoLAN.VLC" },#VLC Media Player
    @{name = "Piriform.Recuva" },#data recovery
    @{name = "Lenovo.LegionAccessoryCentral" },#Keyboard Control
    #Nvidia
    @{name = "Nvidia.GeForceExperience" },
    @{name = "Nvidia.Broadcast" }#AI based noise removal from microphone input for RTX cards https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/
    # @{name = "Nvidia.RTXVoice" }#AI based noise removal from microphone input for GTX cards https://www.nvidia.com/en-gb/geforce/guides/broadcast-app-setup-guide/


    );
}
else {
    Write-host "custom app list detected" $CustomApps
    . $CustomApps
    Write-host "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
}


#Install New apps
Foreach ($app in $apps) {
    #check if the app is already installed
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing:" $app.name
        if ($app.location -ne $null) {#Installation if there is a custom install location 
            $installdir = $app.location
            if ($app.source -ne $null) {
                winget install --exact --silent $app.name --source $app.source --location $installdir
            }
            else {
                winget install --exact --silent $app.name --location $app.location
            }
        }
        else {#Installation if there is no custom install location
            $installdir = $standartInstall
            if ($app.source -ne $null) {
                winget install --exact --silent $app.name --source $app.source --location $installdir
            }
            else {
                winget install --exact --silent $app.name --location $installdir
            }
        }
    }
    else {
    Write-Host $app.name " is already installed!"
    Write-host "Skipping Installation of: " $app.name
    }
    Write-host "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
}




# #Debug
# $apps = @(
#     #Communication
#     #@{name = "WhatsApp.WhatsApp" },
#    # @{name = "Zoom.Zoom" },
#     #coding
#     #@{name = "Microsoft.WindowsTerminal"; source = "msstore" },  
#     #Game Clients
#     @{name = "FinalWire.AIDA64.Extreme"; source = "C:\Programme\Games\" }#Steam
#     @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Programme\Games\" }#Steam
#     @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Programme\Games\"; source = "test" }#Steam
#     @{name = "FinalWire.AIDA64.Extreme" }#Steam
#     #@{name = "Battle.net" }#Battlenet
    

# );

# Foreach ($app in $apps) {
#     #check if the app is already installed
#     Write-host "Currently processing: "$app.name
#     $listApp = winget list --exact -q $app.name
#     Write-host $listApp
#     Write-host $app.location 
#     if (![String]::Join("", $listApp).Contains($app.name)) {
#         Write-host "Installing:" $app.name
#         if ($app.location -ne $null) {#Installation if there is a custom install location
#             $installdir = $app.location 
#             Write-host "not standart install location"
#             if ($app.source -ne $null) {
#                 Write-host "1 winget install --exact --silent $app.name --source $app.source --location $installdir"
#             }
#             else {
#                 Write-host "2 winget install --exact --silent $app.name --location $app.location"
#             }
#         }
#         else {#Installation if there is no custom install location
#             $installdir = $standartInstall
#             if ($app.source -ne $null) {
#                 Write-host "3 winget install --exact --silent $app.name --source $app.source --location $installdir"
#             }
#             else {
#                 Write-host "4 winget install --exact --silent $app.name --location $installdir"
#             }
#         }
#     }
#     else {
#     Write-Host $app.name " is already installed!"
#     Write-host "Skipping Installation of: " $app.name
#     }
#     Write-host "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
# }

#Finisher
Write-host "Successfully finished setting up your PC!"