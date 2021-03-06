<#
.SYNOPSIS
Make a backup of some folders to another folder.

.DESCRIPTION
Make a backup of some folders to another folder. All folders are passed as parameters, and a new date-based subfolder is automatically created.

.PARAMETER CSV
A CSV-file that contains all folders that will be stored in the backup

.PARAMETER destination
The destination for all backups. A subfolder wil automatically be created

.PARAMETER createCSV
Switch. If true, no backup will be made, but an example CSV-file is created.

.PARAMETER createLog
Switch. If true, every backup-action is logged to a file. Every action is always shown as verbose messages.

.EXAMPLE
Backup-Folders -CSV folders.csv -createCSV

Generates an exampleCSV-file as 'folders.csv'

.EXAMPLE
Backup-Folders -CSV folders.csv -destination D:

Creates a subfolder called "1944-06-06 Backup" (when the script was run on D-Day) and backups all folders in folders.csv to that location.

.EXAMPLE
Backup-Folders -CSV folders.csv -destination D: -CreateLog

Creates a subfolder called "1944-06-06 Backup" (when the script was run on D-Day) and backups all folders in folders.csv to that location and creates a logfile.
#>

[CmdletBinding()]
param(
    [string]$destination,
    [Parameter(Mandatory = $True,
        ValueFromPipeline = $true)]
    [string]$CSV,
    [switch]$createLOG,
    [switch]$createCSV
)

if ($createCSV) {
    if (Test-Path $CSV -IsValid) {
        Write-Verbose "Creating example CSV file as '$CSV'."
        $obj = New-Object psobject
        Add-Member -InputObject $obj -MemberType NoteProperty -Name "Folder" -Value "c:\Folder that will be backupped"

        $obj | Export-Csv $CSV
    }
    else {
        Write-Error "$CSV is not a valid path..."
    }

    Write-Verbose "Exiting script."
    exit
}

if (-not(Test-Path $CSV)) {
    Write-Error "$CSV doesn't exist. Exiting..."
    exit
}

if (-not(Test-Path $destination)) {
    Write-Error "$destination doesn't exist. Exiting..."
    exit
}

$backupFolder = Join-Path $destination (Get-Date -Format "yyyy-MM-dd Backup")
Write-Verbose "Backupdestination: $backupFolder."
New-Item -ItemType Directory -Path $backupFolder | Out-Null

if ($createLOG) {
    $LogFile = Join-Path $backupFolder "backuplog.txt"
    Write-Output "$(Get-Date -Format "d M yyyy HH:mm:ss"): Backup started" | Out-File $LogFile
}

foreach ($folder in (Import-Csv $CSV)) {
    if (-not(Test-Path $folder.Folder)) {
        Write-Verbose "$($folder.Folder) doesn't exist. Not included in backup."
        continue
    }

    Write-Verbose "Backup of $($folder.Folder)."

    if ($createLOG) {
        Write-Output "$(Get-Date -Format "d M yyyy HH:mm:ss"): $($folder.Folder)" | Out-File $LogFile -Append
    }

    Copy-Item -Path $($folder.Folder) -Destination $backupFolder -Recurse

}

Write-Verbose "Done!"
if ($createLOG) {
    Write-Output "$(Get-Date -Format "d M yyyy HH:mm:ss"): Done!" | Out-File $LogFile -Append
}
