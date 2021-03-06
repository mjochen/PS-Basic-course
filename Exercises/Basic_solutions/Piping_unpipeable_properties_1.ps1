# implicit, by value
Get-Process "Iexplore" | Stop-Process

# explicit, by value
$ie = Get-Process "Iexplore"
Stop-Process -InputObject $ie

# input object, allows by value pipeline input
Get-Help Stop-Process -Parameter InputObject

# Explicitly stating the name, works
Stop-Process -Name "IExplore"

# Piping the name, doesn't work
"IExplore" | Stop-Process

# name, only allowed by property name
Get-Help Stop-Process -Parameter Name

# creating an object
$myobject = New-Object System.Management.Automation.PSObject
$myobject | Add-Member -Value "IExplore" -Name "Name" -MemberType NoteProperty

# killing IE again
$myobject | Stop-Process
