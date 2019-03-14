<#
	.SYNOPSIS
	The short description of the function.
	
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
    Format-List Name, Model, Manufacturer, SystemType, Domain, BootUpState, 
    @{name="Memory (GB)";expression={$_.TotalPhysicalMemory/1GB -as [int]};FormatString="N0"}
}
else {
	Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
    Format-Table Name, Model, Manufacturer -AutoSize
}

<# NEXT STEP
Replace Format-List and Format-Table by Select-Object.
#>