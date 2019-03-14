<#
	.SYNOPSIS
	The sort description of the function.
	
	.DESCRIPTION
	The long description of the function.

    .PARAMETER computername
    The name of the computer we are examining

    .PARAMETER detail
    Switch that indicates if detailed information is needed
	
	.EXAMPLE
	Get-ComputerSystem -ComputerName DC01 -Detail
#>

param(
	$ComputerName,
	[switch]$Detail
)
if ($Detail) {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
    Select-Object Name, Model, Manufacturer, SystemType, Domain, BootUpState, 
    @{name="Memory (GB)";expression={$_.TotalPhysicalMemory/1GB -as [int]}}
}
else {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
    Select-Object Name, Model, Manufacturer
}

<# NEXT STEP
Add cmdlet binding to make the Common parameters available
#>