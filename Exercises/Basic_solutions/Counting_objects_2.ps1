Get-Process | Out-File c:\tmp\process.txt
Get-Content c:\tmp\process.txt | Measure-Object -Word
Get-Content c:\tmp\process.txt | Measure-Object -Word -Line -Character