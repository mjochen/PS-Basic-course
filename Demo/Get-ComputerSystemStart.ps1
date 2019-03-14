cd ... # the folder containing the scripts


# version 1:
.\Get-ComputerSystemV1.ps1

#version 2
.\Get-ComputerSystemV2.ps1 localhost -Detail

#version 3
Get-Help .\Get-ComputerSystemV3.ps1 # -Parameter Detail

#version 4
$pc = .\Get-ComputerSystemV4.ps1 localhost
$pc

#version 5
.\Get-ComputerSystemV5.ps1 localhost -Verbose

#version 6
.\Get-ComputerSystemV6.ps1

#version 7
.\Get-ComputerSystemV7.ps1
.\Get-ComputerSystemV7.ps1 localhost

#version 8
.\Get-ComputerSystemV8.ps1 -ComputerName G102JM-10
.\Get-ComputerSystemV8.ps1 -ComputerName localhost

#version 9
"localhost" | .\Get-ComputerSystemV9.ps1

#version 10

# create a CSV with computernames, throw at script:

$pc1 = [PSCustomObject]@{ computername = "localhost" }
$pc2 = [PSCustomObject]@{ computername = "pc-karin" }

$pc1 = New-Object -TypeName PSObject
$pc1 | Add-Member -MemberType NoteProperty -Name Computername -Value localhost
$pc2 = New-Object -TypeName PSObject
$pc2 | Add-Member -MemberType NoteProperty -Name Computername -Value pc-karin

$pc1, $pc2 | Export-Csv c:\tmp\computers2.csv -Delimiter ";"

Import-Csv c:\tmp\computers.csv -Delimiter ";" | % { .\Get-ComputerSystemV9.ps1 -computername $_.Computername -verbose }
Import-Csv c:\tmp\computers.csv -Delimiter ";" | .\Get-ComputerSystemV10.ps1 -Verbose
Import-Csv c:\tmp\computers.csv -Delimiter ";" | Ft Computername, name

"localhost" | .\Get-ComputerSystemV10.ps1 -Verbose # Broken!