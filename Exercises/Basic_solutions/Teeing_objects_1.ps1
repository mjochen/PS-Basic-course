# one pipe
Get-Process |
Tee-Object -FilePath "c:\tmp\allprocesses.txt" |
Where-Object CPU -gt 1 |
Tee-Object -Variable filteredprocesses |
Format-Table Name, CPU

# variables
$allprocesses = Get-Process
$allprocesses | Out-File "c:\tmp\allprocesses.txt"
$filteredprocesses = $allprocesses | Where-Object CPU -gt 1
$filteredprocesses | Format-Table Name, CPU
