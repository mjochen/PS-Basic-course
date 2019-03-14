Function Get-ComputerSystem {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | 
    Format-List Name, Model, Manufacturer, SystemType, Domain, BootUpState, 
    @{name="Geheugen (GB)";expression={$_.TotalPhysicalMemory/1GB -as [int]};FormatString="N0"}
}

Get-ComputerSystem

<# NEXT STEP
We want to call this script with parameters
    - the name of a server or computer
    - an indication of more or less detailed info
#>