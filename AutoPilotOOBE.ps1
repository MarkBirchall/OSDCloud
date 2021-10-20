Write-Host  -ForegroundColor Cyan "Install PowerShell Module"
Install-Module OSD -Force
Install-Module AutopilotOOBE -Force

Write-Host  -ForegroundColor Cyan "Importing PowerShell Modules"
Import-Module OSD -Force
Import-Module AutopilotOOBE -Force

#=======================================================================
#   OS: Params and Start-OSDCloud
#=======================================================================
$Params = @{
    OSBuild = "21H1"
    OSEdition = "Ent"
    OSLanguage = "en-gb"
    OSLicense = "Retail"
    SkipAutopilot = $true
    SkipODT = $true
}
Start-OSDCloud @Params

#=======================================================================
#   PostOS: AutopilotOOBE Staging
#=======================================================================
$AutopilotOOBEJson = @'
{
    "Assign":  {
                   "IsPresent":  true
               },
    "GroupTag":  "Staff",
    "GroupTagOptions":  [
                            "Student",
                            "Staff"
                        ],
    "Hidden":  [
                   "AddToGroup",
                   # "AssignedComputerName",
                   # "AssignedUser",
                   "PostAction"
               ],
    "PostAction":  "Quit",
    "Run":  "NetworkingWireless",
    "Docs":  "https://autopilotoobe.osdeploy.com/",
    "Title":  "OSDeploy Autopilot Registration"
}
'@
$AutopilotOOBEJson | Out-File -FilePath "C:\ProgramData\OSDeploy\OSDeploy.AutopilotOOBE.
