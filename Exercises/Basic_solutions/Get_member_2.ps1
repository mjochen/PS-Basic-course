notepad # execute more than once
$var = Get-Process Notepad
$var | Get-Member # shows members of processes
$var.Description # returns the description of all processes
$var.Description.Length # returns the number of processes
$var.Description[0].Length # returns the number of characters in "notepad"

# the difficulty: Length is a property of an array, and of a processdescription
# the properties of arrays:

Get-Member -InputObject $var
