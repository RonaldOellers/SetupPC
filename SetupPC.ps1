#Global Variables
# $standartInstall = "C:\Programme\"

#Input promt
$CustomApps = Read-Host "If you have a custom app list, please enter the file location "

# Write-Output "Default Install location: $standartInstall"
# $standartInstall = Read-Host "Please enter your standart installation Directory "

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
    @{name = "WhatsApp.WhatsApp"; location = "C:\Programme\WhatsApp\" },
    #Coding and utilty  
    @{name = "Microsoft.PowerToys" },
    @{name = "Notepad++.Notepad++"; location = "C:\Programme\Notepad++\" },
    @{name = "EclipseAdoptium.Temurin.19.JDK" },#Java especialy for Minecraft
    #Browser
    @{name = "Mozilla.Firefox"; location = "C:\Programme\Firefox\" },
    @{name = "Opera.OperaGX"; location = "C:\Programme\OperaGX\" },
    @{name = "Google.Chrome"; location = "C:\Programme\GoogleChrome\" },
    #Writing and Office
    # @{name = "TheDocumentFoundation.LibreOffice" },#Open Office
    #Game Clients
    @{name = "Valve.Steam"; location = "C:\Games\Steam\" },#Steam
    @{name = "Battle.net"; location = "C:\Games\Battlenet\"  },#Battlenet
    @{name = "GOG.Galaxy"; location = "C:\Games\GOG\"  },#GOG Galaxy
    @{name = "Ubisoft.Connect"; location = "C:\Games\Ubisoft\"  },#Uplay
    @{name = "ElectronicArts.EADesktop"; location = "C:\Games\EADesktop\"  },#Origin
    #Game Utility
    @{name = "Discord.Discord"; location = "C:\Programme\Discord\" },
    @{name = "TeamSpeakSystems.TeamSpeakClient"; location = "C:\Programme\Teamspeak\" },
    @{name = "Mumble.Mumble.Client"; location = "C:\Programme\Mumble\" },
    #Monitoring
    @{name = "CPUID.HWMonitor"; location = "C:\Programme\HWmonitor\" },#HW Monitor
    @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Programme\AIDA64\" },#Aida64
    @{name = "CrystalDewWorld.CrystalDiskInfo"; location = "C:\Programme\CrystalDiskInfo\" },#Crystal Disc info
    #Utility Software
    @{name = "DebaucheeOpenSourceGroup.Barrier"; location = "C:\Programme\Barrier\" },#KVM software
    @{name = "RARLab.WinRAR"; location = "C:\Programme\Winrar\" },#Winrar
    @{name = "VideoLAN.VLC"; location = "C:\Programme\VLC\" },#VLC Media Player
    @{name = "9NQH3P2DZFFN"; location = "C:\Programme\ROG_Aura\" },#ROG Aura controll center
    #Benchmarking
    @{name = "9PGZKJC81Q7J"; location = "C:\Programme\Benchmark\Cinebench" },#Cinebench
    @{name = "Unigine.HeavenBenchmark"; location = "C:\Programme\Benchmark\HeavenBenchmark\"  },#Heaven Benchmark
    @{name = "CPUID.CPU-Z"; location = "C:\Programme\Benchmark\CPUZ\"  },#CPU-Z
    @{name = "Unigine.SuperpositionBenchmark"; location = "C:\Programme\Benchmark\SuperpositionBenchmark\"  },#Superposition
    @{name = "CrystalDewWorld.CrystalDiskMark"; location = "C:\Programme\Benchmark\CrystalDiskMark\"  },#Crystal Disc mark
    #Nvidia
    @{name = "Nvidia.GeForceExperience"; location = "C:\Programme\Programme\Nvidia\GeForceExperience\" },
    @{name = "Nvidia.Broadcast"; location = "C:\Programme\Programme\Nvidia\Broadcast\" }#AI based noise removal from microphone input for RTX cards https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/
    # @{name = "Nvidia.RTXVoice"; location = "C:\Programme\Programme\Nvidia\RTXVoice\ }#AI based noise removal from microphone input for GTX cards https://www.nvidia.com/en-gb/geforce/guides/broadcast-app-setup-guide/


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
                winget install --accept-source-agreements --accept-package-agreements --exact --silent $app.name --source $app.source --location $installdir
            }
            else {
                winget install --accept-source-agreements --accept-package-agreements --exact --silent $app.name --location $installdir
            }
        }
        else {#Installation if there is no custom install location
            # $installdir = $standartInstall
            if ($app.source -ne $null) {
                winget install --accept-source-agreements --accept-package-agreements --exact --silent $app.name --source $app.source 
            }
            else {
                winget install --accept-source-agreements --accept-package-agreements --exact --silent $app.name
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
#     @{name = "FinalWire.AIDA64.Extreme"; source = "C:\Games\" }#Steam
#     @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Games\" }#Steam
#     @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Games\"; source = "test" }#Steam
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
#                 Write-host "2 winget install --exact --silent $app.name --location $installdir"
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