$a = Get-Random -Minimum 100 -Maximum 999

"{0:C3}" -f $a
"{0:N0}" -f $a
"{0,20:N3}" -f $a
"{0,-20:N3}some text" -f $a
"{0:P}" -f ($a/1000)
"{0:D8}" -f $a
"{0:X}" -f $a
[Convert]::ToString($a, 2)
