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

[CmdletBinding()]
param(
    [Parameter(Mandatory=$True,
               ValueFromPipeline=$true)]
    [ValidateSet(".","localhost","PC-Karin")]
	[string]$ComputerName,

	[switch]$Detail
)
process {
    if ($Detail) {
	    Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
        Select-Object Name, Model, Manufacturer, SystemType, Domain, BootUpState, 
        @{name="Geheugen (GB)";expression={$_.TotalPhysicalMemory/1GB -as [int]}}
    }
    else {
	    Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName | 
        Select-Object Name, Model, Manufacturer
    }
}

<# NEXT STEP
Use the common parameter -Verbose to show (or not show) extra information.
#>
