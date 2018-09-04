[cmdletbinding()]
param(
    [Parameter(Mandatory=$true)][String]$iso,
    [Parameter(Mandatory=$true)][String]$name,
    [Parameter(Mandatory=$true)][String]$switchname,
    [String]$location = "C:\Virtual Machines"
)

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

Get-VM -Name $name | Start-VM