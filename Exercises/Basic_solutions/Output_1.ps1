Get-Process | Format-Table –property id,processname,working* -AutoSize

# Supressing output
Get-Process | Select-Object id, name, ws | Format-Table | Out-Null
$a = Get-Process | Select-Object id, name, ws | Format-Table
[Void] {Get-Process | Select-Object id, name, ws | Format-Table}

Get-Process | Out-Printer
Get-Process | Out-Printer "Microsoft Print to PDF"
Get-Process | Out-File “c:\tmp\ProcessList.txt”
Get-Process | Out-File “c:\tmp\ProcessList.txt” –Append

# not in ise, only in console:
Get-Command | Out-host -Paging
