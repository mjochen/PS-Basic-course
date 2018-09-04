param(
	$ComputerName,
	[switch]$Detail
)

if ($Detail) {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
    Format-List Name, Model, Manufacturer, SystemType, Domain, BootUpState, 
    @{name="Memory (GB)";expression={$_.TotalPhysicalMemory/1GB -as [int]};FormatString="N0"}
}
else {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
    Format-Table Name, Model, Manufacturer -AutoSize
}

<# NEXT STEP
Add help information to the script
#>