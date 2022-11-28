$apps = @(
    #Communication
    @{name = "WhatsApp.WhatsApp"; location = "C:\Programme\WhatsApp\" },
    @{name = "Telegram.TelegramDesktop"; location = "C:\Programme\Telegram\" },

    #Coding and utilty  
    @{name = "Notepad++.Notepad++"; location = "C:\Programme\Notepad++\" },
    @{name = "EclipseAdoptium.Temurin.19.JDK"; location = "C:\Programme\EclipseAdoptium\" },#Java especialy for Minecraft

    #Browser
    @{name = "Mozilla.Firefox"; location = "C:\Programme\Firefox\" },
    @{name = "Google.Chrome"; location = "C:\Programme\GoogleChrome\" },

    #Writing and Office
    @{name = "TheDocumentFoundation.LibreOffice"; location = "C:\Programme\OpenOffice\" },#Open Office
    @{name = "TrackerSoftware.PDF-XChangeEditor"; location = "C:\Programme\PDF_XChange\" },#PDF XChange Editor

    #Entertainment
    @{name = "Spotify.Spotify"; location = "C:\Programme\Spotify\" },#Spotify

    #Game Clients
    @{name = "Valve.Steam"; location = "C:\Games\Steam\" },#Steam
    @{name = "Ubisoft.Connect"; location = "C:\Games\Ubisoft\"  },#Uplay
    @{name = "ElectronicArts.EADesktop"; location = "C:\Games\EADesktop\"  },#Origin

    #Game Utility
    @{name = "Discord.Discord"; location = "C:\Programme\Discord\" },#Discord

    #Monitoring
    @{name = "CPUID.HWMonitor"; location = "C:\Programme\HWmonitor\" },#HW Monitor
    @{name = "FinalWire.AIDA64.Extreme"; location = "C:\Programme\AIDA64\" },#Aida64
    @{name = "CrystalDewWorld.CrystalDiskInfo"; location = "C:\Programme\CrystalDiskInfo\" },#Crystal Disc info

    #Utility Software
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
    @{name = "Nvidia.GeForceExperience"; location = "C:\Programme\Nvidia\GeForceExperience\" },
    @{name = "Nvidia.Broadcast"; location = "C:\Programme\Programme\Nvidia\Broadcast\" }#AI based noise removal from microphone input for RTX cards https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/



    );

#Finisher 
Write-host "Loaded Custom Apps List"#Leave this in the file as it is needed to run this file seperately!!!