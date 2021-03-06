<#
.SYNOPSIS
SizeSubDirs.ps1 shows the size of the subfolders of a directory

.DESCRIPTION
SizeSubDirs.ps1 shows the size of the subfolders of a directory, using
the get-childitem cmdlet

.PARAMETER dir
Name of the directory

.PARAMETER file
Sends output to a file

.EXAMPLE
SizeSubDirs.ps1 -dir K:\CVO"
Shows the size of the subdirs of K:\CVO on the screen

SizeSubDirs.ps1 -dir "K:\CVO" -file c:\tmp
Shows the size of the subdirs of K:\CVO on the screen and saves
the output in c:\tmp\SizeSubDirs.txt

Get-Help SizeSubDirs.ps1
Show help
#>

param(
    [parameter(Mandatory = $true)]
    $dir ,

    $file
)



Write-Verbose "Checking if the output file exists"
if ($file) {
    if (Test-Path $file) {
        Write-Verbose "It exists - removing"
        Remove-Item $file
    }
}

Write-Verbose "What are the subfolders?"
$SubFolders = Get-ChildItem $dir -Force -ErrorAction SilentlyContinue

Write-Verbose "Getting the size..."

foreach ($folder in $SubFolders)
{
    $folderSize = (Get-ChildItem $folder.fullname -Recurse -Force -ErrorAction continue |
            Measure-Object -Property length -sum).sum
    if ($file) {
        "{1,20:N0} KB `t`t`t{0} " -f $folder.FullName, ($folderSize / 1KB) | Out-File $file -Append
    }
    else {
        "{1,20:N0} KB`t`t{0} " -f $folder.FullName, ($folderSize / 1KB)
    }
}
