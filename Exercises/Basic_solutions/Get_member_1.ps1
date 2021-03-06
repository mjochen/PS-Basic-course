notepad # Start a notepad instance
Get-Process notepad # There is only one notepad instance
Get-Process notepad | Get-member
(Get-Process notepad).Description
# or
$notepadprocess = Get-Process "Notepad"
$notepadprocess.Description

(Get-Process notepad).Description | Get-Member
(Get-Process notepad).Description.Length
# or (but longer)
(Get-Process "Notepad").Description | Measure-Object -Character

(Get-Process notepad).Description.Toupper()
