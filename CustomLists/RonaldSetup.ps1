$apps = @(
    #Communication
    @{name = "WhatsApp.WhatsApp"; location = "C:\Programme\WhatsApp\" },
    @{name = "Zoom.Zoom"; location = "C:\Programme\Zoom\" },

    #Streaming
     @{name = "9NXQXXLFST89"; source = "msstore"; location = "C:\Programme\DisneyPlus\" },#Disney+

    #Coding and utilty  
    @{name = "Microsoft.VisualStudioCode"; location = "C:\Programme\VisualStudioCode\" }, 
    @{name = "Microsoft.WindowsTerminal"; source = "msstore"; location = "C:\Programme\WindowsTerminal\" },  
    @{name = "Microsoft.PowerToys" },
    @{name = "Notepad++.Notepad++"; location = "C:\Programme\Notepad++\" },
    @{name = "EclipseAdoptium.Temurin.19.JDK" },#Java especialy for Minecraft

    #Cloud Services 
    @{name = "Seafile.Seafile"; location = "C:\Programme\Seafile\" },

    #WSL
    @{name = "Canonical.Ubuntu.2204"; location = "L:\WSL\Ubuntu2204\" },

    #Browser
    @{name = "Mozilla.Firefox"; location = "C:\Programme\Firefox\" },
    @{name = "Opera.OperaGX"; location = "C:\Programme\OperaGX\" },
    @{name = "Google.Chrome"; location = "C:\Programme\GoogleChrome\" },

    #Writing and Office
    # @{name = "TheDocumentFoundation.LibreOffice" },#Open Office
    @{name = "Adobe.Acrobat.Reader.64-bit"; location = "C:\Programme\Adobe\AcrobatReader" },#Acrobat Reader
    @{name = "TeXstudio.TeXstudio "; location = "C:\Programme\TeXstudio" },#TeXstudio
    @{name = "JabRef.JabRef"; location = "C:\Programme\Jabref\" },#Jabref

    #Game Clients
    @{name = "Valve.Steam"; location = "C:\Games\Steam\" },#Steam
    @{name = "Battle.net"; location = "C:\Games\Battlenet\"  },#Battlenet
    @{name = "GOG.Galaxy"; location = "C:\Games\GOG\"  },#GOG Galaxy
    @{name = "Ubisoft.Connect"; location = "C:\Games\Ubisoft\"  },#Uplay
    @{name = "ElectronicArts.EADesktop"; location = "C:\Games\EADesktop\"  },#Origin
    @{name = "Peppy.Osu!"; location = "S:\Games\Osu\" },#Osu

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
    @{name = "Obsidian.Obsidian"; location = "C:\Programme\Obsidian\" },#Obsidian
    @{name = "RARLab.WinRAR"; location = "C:\Programme\Winrar\" },#Winrar
    @{name = "VideoLAN.VLC"; location = "C:\Programme\VLC\" },#VLC Media Player
    @{name = "Piriform.Recuva"; location = "C:\Programme\Recuva\" },#data recovery
    @{name = "Lenovo.LegionAccessoryCentral"; location = "C:\Programme\LenovoLegion\" },#Keyboard Control
    @{name = "9NQH3P2DZFFN"; location = "C:\Programme\ROG_Aura\" },#ROG Aura controll center

    #Benchmarking
    @{name = "9PGZKJC81Q7J"; location = "C:\Programme\Benchmark\Cinebench" },#Cinebench
    @{name = "Unigine.HeavenBenchmark"; location = "C:\Programme\Benchmark\HeavenBenchmark\"  },#Heaven Benchmark
    @{name = "CPUID.CPU-Z"; location = "C:\Programme\Benchmark\CPUZ\"  },#CPU-Z
    @{name = "Unigine.SuperpositionBenchmark"; location = "C:\Programme\Benchmark\SuperpositionBenchmark\"  },#Superposition
    @{name = "CrystalDewWorld.CrystalDiskMark"; location = "C:\Programme\Benchmark\CrystalDiskMark\"  },#Crystal Disc mark

    #Nvidia
    @{name = "Nvidia.GeForceExperience"; location = "C:\Programme\Programme\Nvidia\GeForceExperience\" },
    @{name = "9NF8H0H7WMLT"; location = "C:\Programme\Programme\Nvidia\ControlPanel\"; source = "msstore"; },#controllPanel
    @{name = "Nvidia.Broadcast"; location = "C:\Programme\Programme\Nvidia\Broadcast\" }#AI based noise removal from microphone input for RTX cards https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/
    @{name = "Nvidia.PhysX"; location = "C:\Programme\Programme\Nvidia\PhysX\" }
    # @{name = "Nvidia.RTXVoice"; location = "C:\Programme\Programme\Nvidia\RTXVoice\ }#AI based noise removal from microphone input for GTX cards https://www.nvidia.com/en-gb/geforce/guides/broadcast-app-setup-guide/


    );

#Finisher 
Write-host "Loaded Custom Apps List"#Leave this in the file as it is needed to run this file seperately!!!