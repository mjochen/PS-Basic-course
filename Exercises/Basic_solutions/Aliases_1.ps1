cls
Get-Process i*
ps i*

Get-Alias
Get-Alias gps
Get-Alias -Definition Get-Process
Get-Alias -Definition *item*

Set-Alias procs Get-Process
New-Alias procs Get-Process

Export-Alias C:\tmp\MyAliasses.csv -Name procs
Export-Alias C:\tmp\MyAliasses.ps1 –as script -Name procs

Remove-Item alias:procs

Import-Alias C:\tmp\MyAliasses.csv

Remove-Item alias:procs

C:\tmp\MyAliasses.ps1
