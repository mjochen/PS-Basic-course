Get-Item C:,nothing,C:
Get-Item C:,nothing,C: > c:\tmp\output.txt
# error on screen, not in file
Get-Item C:,nothing,C: 1> c:\tmp\output.txt
# again, error on screen, not in file
Get-Item C:,nothing,C: 2> c:\tmp\output.txt
# error in file, succesoutput on screen
Get-Item C:,nothing,C: 3> c:\tmp\output.txt
# there are no warnings, so empty file and success and error on screen
Get-Item C:,nothing,C: 2>&1
# everything on screen, as expected
Get-Item C:,nothing,C: 2>&1 > c:\tmp\output.txt
# error and succes in file, nothing on screen
Get-Item C:,nothing,C: -ErrorVariable err
$err
# error on screen and in variable
$items = Get-Item C:,nothing,C:
# error on screen, success in $items
$items = Get-Item C:,nothing,C: 2>&1
# error and success in $items

notepad C:\tmp\output.txt
