Get-Process –computername .
Get-Process –cn .

# an alias for the "computername"-parameter of the get-process cmdlet
Get-Command Get-Process | Get-Member
Get-Command Get-Process | Select-Object Parameters
Get-Command Get-Process | Select-Object –ExpandProperty Parameters
(Get-Command Get-Process | Select-Object –ExpandProperty Parameters).computername
(Get-Command Get-Process | Select-Object –ExpandProperty Parameters).computername.aliases

# or...
get-help get-process -online
# and ctrl-F "-computername"
