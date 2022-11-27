$apps = @(
    #Communication
    @{name = "WhatsApp.WhatsApp" },
    @{name = "Zoom.Zoom" },
    #Coding 
    @{name = "Microsoft.PowerShell" }, 
    @{name = "Microsoft.VisualStudioCode" }, 
    @{name = "Microsoft.WindowsTerminal"; source = "msstore" },  
    @{name = "Microsoft.PowerToys" },
    @{name = "Notepad++.Notepad++" },
    @{name = "EclipseAdoptium.Temurin.19.JDK" },#Java especialy for Minecraft
    #Cloud Services 
    @{name = "Seafile.Seafile" },
    #Nvidia
    @{name = "Nvidia.GeForceExperience" },
    @{name = "Nvidia.Broadcast" }#AI based noise removal from microphone input for RTX cards https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/
    # @{name = "Nvidia.RTXVoice" }#AI based noise removal from microphone input for GTX cards https://www.nvidia.com/en-gb/geforce/guides/broadcast-app-setup-guide/
);

#Finisher 
Write-host "Loaded Custom Apps List"#Leave this in the file as it is needed to run this file seperately!!!