$destination = "c:\tmp\Backup"
$CSV = "all folders.csv"
$createLOG = $false

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
