Function Repair-CylanceUI{
    <#
        .SYNOPSIS
            A repair utility for Cylance Antivirus.

        .DESCRIPTION
            This utility fixes the application display when deployed with LAUNCHAPP=0.
            Registry keys are set as follows:
                1: Simplistic UI Interface
                2: Full UI Interface
        
        .PARAMETER UIMode
            Sets the UI mode to the desired state.

        .EXAMPLE
            Repair-CylanceUI -UIMode Simple

    #>

    Param(
        [cmdletBinding()]
        [Parameter(
            Mandatory=$true,
            Position=0)]
            [ValidateSet(
                "Simple",
                "Full")]
            [string]
            $UIMode
        )
    
    Switch ($UIMode)
        {
        "Simple" { Set-ItemProperty 'HKLM:\Software\Cylance\Desktop' -name 'UiMode' -Value '1' }
        "Full" { Set-ItemProperty 'HKLM:\Software\Cylance\Desktop' -name 'UiMode' -Value '2' }
        } #End switch
        
    #Create a shortcut for every user to launch A/V Software at Startup.
    $TargetFile = 'C:\Program Files\Cylance\CylanceUI.exe'
    $ShortcutFile = 'C:\Users\All Users\Microsoft\Windows\Start Menu\Programs\Startup\Cylance Desktop.lnk'
    $WScriptShell = New-Object -ComObject Wscript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = $TargetFile
    $Shortcut.Save()

}