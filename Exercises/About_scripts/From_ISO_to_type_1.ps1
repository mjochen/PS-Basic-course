#requires -runasadministrator
#requires -module Hyper-V

[cmdletbinding()]
param(
#[Parameter(Mandatory=$true)][String]$iso,
[Parameter(Mandatory=$true)]
[ValidateSet("Windows Server 2016","Windows Server 2012R2","Ubuntu server 16.04")]
[String]$type,
[Parameter(Mandatory=$true)][String]$name,
[Parameter(Mandatory=$true)][String]$switchname,
[Switch]$startVM=$true,
[String]$location = "C:\Virtual Machines"
)

if( (Test-Path $location))
{
write-Verbose "Location exists!"
}
else
{
throw "Please select an existing location!"
}

switch($type)
{
"Windows Server 2016"
{ $iso = "C:\ISO\en_windows_server_2016_x64_dvd_9327751.iso" }
"Windows Server 2012R2"
{ $iso = "C:\ISO\en_windows_server_2012_r2_x64_dvd_2707946.iso" }
"Ubuntu server 16.04"
{ $iso = "C:\ISO\ubuntu-16.04.1-server-amd64.iso" }
}

$vhdxname = Join-Path ( Join-Path ( Join-Path $location $name ) "HDs") "$name.vhdx"

New-VM -Name $name `
-MemoryStartupBytes 1GB `
-Path $location `
-Generation 2 `
-SwitchName $switchname `
-NewVHDPath $vhdxname `
-NewVHDSizeBytes 40GB `
-BootDevice CD

Get-VM -Name $name | Get-VMDvdDrive | Set-VMDvdDrive -Path $iso.FullName

Get-VM -Name $name | Set-VMMemory -DynamicMemoryEnabled $true -MaximumBytes 2GB -MinimumBytes 256MB

if($startVM)
{
Write-Verbose "Starting the VM"
Get-VM -Name $name | Start-VM
}
