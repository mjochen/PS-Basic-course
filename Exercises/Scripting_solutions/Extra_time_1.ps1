$start = Get-date -Hour 8 -Minute 30 -Second 0
$end = Get-date -Hour 11 -Minute 45 -Second 0
$minutesLongExamen = (($end - $start).TotalMinutes * 1.25)
$span = New-timespan -Minutes $minutesLongExamen
$start + $span
